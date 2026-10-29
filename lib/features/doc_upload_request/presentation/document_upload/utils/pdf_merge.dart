import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Merges one or more images into a single PDF file (one page per image)
/// and returns the path of the generated file in a temp directory. The
/// upload API only accepts a single file per request, so multi-page
/// scans/picks are combined before upload.
Future<String> mergeImagesToPdf(List<String> imagePaths) async {
  final pdf = pw.Document();

  for (final path in imagePaths) {
    final bytes = await File(path).readAsBytes();
    final image = pw.MemoryImage(bytes);
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (_) => pw.Image(image, fit: pw.BoxFit.contain),
      ),
    );
  }

  final dir = await getTemporaryDirectory();
  final file = File(
    '${dir.path}/doc_upload_${DateTime.now().millisecondsSinceEpoch}.pdf',
  );
  await file.writeAsBytes(await pdf.save());
  return file.path;
}
