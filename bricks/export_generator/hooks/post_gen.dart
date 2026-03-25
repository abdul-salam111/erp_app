import 'dart:io';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  final directory = context.vars['directory'] as String;
  final exportFilePath = 'lib/app_exports.dart';

  final progress = context.logger.progress('Scanning for Dart files');

  try {
    // Get all dart files in the specified directory
    final libDir = Directory(directory);
    if (!libDir.existsSync()) {
      progress.fail('Directory $directory does not exist');
      return;
    }

    final dartFiles = <String>[];
    await for (final entity in libDir.list(recursive: true)) {
      if (entity is File &&
          entity.path.endsWith('.dart') &&
          !entity.path.endsWith('app_exports.dart') &&
          !entity.path.contains('.g.dart') &&
          !entity.path.contains('.freezed.dart')) {
        // Get relative path from lib directory
        var relativePath = path.relative(entity.path, from: directory);
        // Convert Windows backslashes to forward slashes for Dart imports
        relativePath = relativePath.replaceAll(r'\', '/');
        dartFiles.add(relativePath);
      }
    }

    // Sort files for consistent ordering
    dartFiles.sort();

    // Read existing exports if file exists
    final exportFile = File(exportFilePath);
    final existingPackageExports = <String>[]; // External packages (full line)
    final existingFileExports = <String>[]; // Project files

    if (exportFile.existsSync()) {
      final content = exportFile.readAsStringSync();
      // Updated regex to capture entire export statement including hide/show
      final exportPattern = RegExp(r"export\s+'([^']+)'[^;]*;");
      final lines = content.split('\n');

      for (final line in lines) {
        final trimmedLine = line.trim();
        if (trimmedLine.startsWith('export ')) {
          final match = exportPattern.firstMatch(trimmedLine);
          if (match != null) {
            final exportPath = match.group(1)!;
            if (exportPath.startsWith('package:')) {
              // Store the entire export line for packages (preserve hide/show)
              existingPackageExports.add(trimmedLine);
            } else {
              // Store just the path for project files
              existingFileExports.add(exportPath);
            }
          }
        }
      }
    }

    // Find changes
    final currentFiles = dartFiles.toSet();
    final existingFiles = existingFileExports.toSet();
    final newExports = currentFiles.difference(existingFiles).toList();
    final removedExports = existingFiles.difference(currentFiles).toList();

    if (newExports.isEmpty &&
        removedExports.isEmpty &&
        exportFile.existsSync()) {
      progress.complete('No changes detected');
      context.logger.info('✓ app_exports.dart is up to date');
      return;
    }

    // Generate export statements
    final buffer = StringBuffer();
    buffer.writeln('// Generated file - exports all library files');
    buffer.writeln('// Run: mason make export_generator to update');
    buffer.writeln();

    // First add package exports (preserve entire line with hide/show)
    if (existingPackageExports.isNotEmpty) {
      buffer.writeln('// External packages');
      for (final pkgLine in existingPackageExports) {
        buffer.writeln(pkgLine);
      }
      buffer.writeln();
    }

    // Then add project file exports
    if (dartFiles.isNotEmpty) {
      buffer.writeln('// Project files');
      for (final file in dartFiles) {
        buffer.writeln("export '$file';");
      }
    }

    // Write to file
    exportFile.writeAsStringSync(buffer.toString());

    progress.complete('Export file updated');

    // Show added files
    if (newExports.isNotEmpty) {
      context.logger.info('✓ Added ${newExports.length} new export(s):');
      for (final file in newExports) {
        context.logger.info('  + $file');
      }
    }

    // Show removed files
    if (removedExports.isNotEmpty) {
      context.logger
          .info('✓ Removed ${removedExports.length} deleted file(s):');
      for (final file in removedExports) {
        context.logger.info('  - $file');
      }
    }

    context.logger.info(
        '✓ Total exports: ${existingPackageExports.length + dartFiles.length}');
    context.logger
        .info('  - Package exports: ${existingPackageExports.length}');
    context.logger.info('  - File exports: ${dartFiles.length}');
    context.logger.success('app_exports.dart updated successfully');
  } catch (e) {
    progress.fail('Error generating exports');
    context.logger.err(e.toString());
  }
}
