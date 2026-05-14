import 'dart:io';
import 'package:mason/mason.dart';

// ---------------------------------------------------------------------------
// add_screen
//
// Adds a new screen (presentation layer only) to an existing feature.
//
// What it does:
//   1. Creates  lib/features/{feature}/presentation/{screen}/blocs/  (or cubit/)
//   2. Creates  lib/features/{feature}/presentation/{screen}/views/
//   3. Generates BLoC (event + state + bloc) OR Cubit (cubit + state) files
//   4. Generates the view file (StatelessWidget shell + StatefulWidget body)
//   5. Appends presentation exports to  features/{feature}/{feature}_exports.dart
//   6. Adds route entries to route_names.dart, route_paths.dart, routes.dart
//   7. Adds a BLoC/Cubit factory to  core/di/register_{feature}.dart
//
// Import depth from nested presentation files to feature root:
//   lib/features/{f}/presentation/{s}/blocs/{file}.dart → '../../../{f}_exports.dart'
//   lib/features/{f}/presentation/{s}/views/{file}.dart → '../../../{f}_exports.dart'
// ---------------------------------------------------------------------------

Future<void> run(HookContext context) async {
  final logger = context.logger;

  final featureName = (context.vars['feature_name'] as String).trim();
  final screenName = (context.vars['screen_name'] as String).trim();
  final stateManagement = context.vars['state_management'] as String;

  final featureClass = _toPascalCase(featureName);
  final featureFile = _toSnakeCase(featureName);
  final screenClass = _toPascalCase(screenName);
  final screenFile = _toSnakeCase(screenName);

  logger.info('\n🚀 Adding screen "$screenName" to feature "$featureName"');
  logger.info('   State management: $stateManagement');
  logger.info(
    '   Classes: ${screenClass}View · $screenClass${stateManagement == 'bloc' ? 'Bloc' : 'Cubit'}\n',
  );

  // ── Guard: feature must already exist ─────────────────────────────────────
  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    logger.err('lib/ directory not found. Run this from your Flutter project root.');
    return;
  }

  final featureDir = Directory('${libDir.path}/features/$featureFile');
  if (!featureDir.existsSync()) {
    logger.err(
      'Feature "$featureFile" not found at lib/features/$featureFile/.\n'
      'Run "mason make create_feature" first.',
    );
    return;
  }

  // ── Guard: screen must not already exist ──────────────────────────────────
  final screenDir = Directory('${featureDir.path}/presentation/$screenFile');
  if (screenDir.existsSync()) {
    logger.err(
      'Screen "$screenFile" already exists at '
      'lib/features/$featureFile/presentation/$screenFile/.\n'
      'Delete it first or choose a different screen name.',
    );
    return;
  }

  // ── Create directories ────────────────────────────────────────────────────
  final stateFolder = stateManagement == 'bloc' ? 'blocs' : 'cubit';
  for (final path in [
    '${screenDir.path}/$stateFolder',
    '${screenDir.path}/views',
  ]) {
    Directory(path).createSync(recursive: true);
  }

  // ── Generate files ────────────────────────────────────────────────────────
  if (stateManagement == 'bloc') {
    _createBlocFiles(featureDir, featureFile, screenClass, screenFile, logger);
  } else {
    _createCubitFiles(featureDir, featureFile, screenClass, screenFile, logger);
  }

  _createViewFile(
    featureDir, featureFile, screenClass, screenFile, stateManagement, logger,
  );

  // ── Update project files ──────────────────────────────────────────────────
  _updateFeatureBarrel(
    featureDir, featureFile, screenFile, stateManagement, logger,
  );
  _updateRoutes(libDir, screenClass, screenFile, logger);
  _updateDiRegistration(
    libDir, featureFile, screenClass, screenFile, stateManagement, logger,
  );

  logger.success('\n✅ $screenClass screen added to $featureClass!');
  logger.info('\n📦 Next steps:');
  logger.info('1. Wire any required usecases into the '
      '$screenClass${stateManagement == 'bloc' ? 'Bloc' : 'Cubit'} '
      'constructor inside core/di/register_$featureFile.dart');
  logger.info('2. Build your UI in '
      'presentation/$screenFile/views/${screenFile}_view.dart');
}

// ---------------------------------------------------------------------------
// BLoC files  (bloc + event + state)
// ---------------------------------------------------------------------------
void _createBlocFiles(
  Directory featureDir,
  String featureFile,
  String screenClass,
  String screenFile,
  Logger logger,
) {
  final dir = '${featureDir.path}/presentation/$screenFile/blocs';

  // ── Bloc ──────────────────────────────────────────────────────────────────
  File('$dir/${screenFile}_bloc.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../${featureFile}_exports.dart';

class ${screenClass}Bloc extends Bloc<${screenClass}Event, ${screenClass}State>
    with UsecaseExecuterMixin {
  // TODO: Inject required usecases here
  // final SomeUsecase someUsecase;

  ${screenClass}Bloc(/*{required this.someUsecase}*/)
      : super(const ${screenClass}State()) {
    // on<${screenClass}Submitted>(_on${screenClass}Submitted);
  }

  // Future<void> _on${screenClass}Submitted(
  //   ${screenClass}Submitted event,
  //   Emitter<${screenClass}State> emit,
  // ) async {
  //   await executeUsecase(
  //     emit: emit,
  //     currentState: state,
  //     usecase: () => someUsecase(NoParams()),
  //     stateBuilder: (status, {data, error}) =>
  //         state.copyWith(apiStatus: status, data: data, message: error),
  //   );
  // }
}
''');
  logger.success(
    '🧱 Created: lib/features/$featureFile/presentation/$screenFile/blocs/${screenFile}_bloc.dart',
  );

  // ── Event ─────────────────────────────────────────────────────────────────
  File('$dir/${screenFile}_event.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../${featureFile}_exports.dart';

abstract class ${screenClass}Event extends Equatable {
  const ${screenClass}Event();

  @override
  List<Object> get props => [];
}

// TODO: Define events for this screen
// class ${screenClass}Submitted extends ${screenClass}Event {}
''');
  logger.success(
    '🧱 Created: lib/features/$featureFile/presentation/$screenFile/blocs/${screenFile}_event.dart',
  );

  // ── State ─────────────────────────────────────────────────────────────────
  File('$dir/${screenFile}_state.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../${featureFile}_exports.dart';

class ${screenClass}State extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const ${screenClass}State({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.initial,
  });

  ${screenClass}State copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return ${screenClass}State(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
''');
  logger.success(
    '🧱 Created: lib/features/$featureFile/presentation/$screenFile/blocs/${screenFile}_state.dart',
  );
}

// ---------------------------------------------------------------------------
// Cubit files  (cubit + state)
// ---------------------------------------------------------------------------
void _createCubitFiles(
  Directory featureDir,
  String featureFile,
  String screenClass,
  String screenFile,
  Logger logger,
) {
  final dir = '${featureDir.path}/presentation/$screenFile/cubit';

  // ── Cubit ─────────────────────────────────────────────────────────────────
  File('$dir/${screenFile}_cubit.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../${featureFile}_exports.dart';

class ${screenClass}Cubit extends Cubit<${screenClass}State> {
  // TODO: Inject required usecases here

  ${screenClass}Cubit() : super(const ${screenClass}State());

  // TODO: Add state-changing methods here
}
''');
  logger.success(
    '🧱 Created: lib/features/$featureFile/presentation/$screenFile/cubit/${screenFile}_cubit.dart',
  );

  // ── State ─────────────────────────────────────────────────────────────────
  File('$dir/${screenFile}_state.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../${featureFile}_exports.dart';

class ${screenClass}State extends Equatable {
  final ApiStatus apiStatus;
  final String? message;

  const ${screenClass}State({
    this.apiStatus = ApiStatus.initial,
    this.message,
  });

  ${screenClass}State copyWith({
    ApiStatus? apiStatus,
    String? message,
  }) {
    return ${screenClass}State(
      apiStatus: apiStatus ?? this.apiStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [apiStatus, message];
}
''');
  logger.success(
    '🧱 Created: lib/features/$featureFile/presentation/$screenFile/cubit/${screenFile}_state.dart',
  );
}

// ---------------------------------------------------------------------------
// View file
// ---------------------------------------------------------------------------
void _createViewFile(
  Directory featureDir,
  String featureFile,
  String screenClass,
  String screenFile,
  String stateManagement,
  Logger logger,
) {
  final viewPath =
      '${featureDir.path}/presentation/$screenFile/views/${screenFile}_view.dart';

  final controller =
      stateManagement == 'bloc' ? '${screenClass}Bloc' : '${screenClass}Cubit';
  final stateType = '${screenClass}State';

  if (stateManagement == 'bloc') {
    File(viewPath)
      ..createSync(recursive: true)
      ..writeAsStringSync('''import 'package:flutter/material.dart';
import '../../../${featureFile}_exports.dart';

class ${screenClass}View extends StatelessWidget {
  const ${screenClass}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<$controller>(),
      child: const _${screenClass}Body(),
    );
  }
}

class _${screenClass}Body extends StatefulWidget {
  const _${screenClass}Body();

  @override
  State<_${screenClass}Body> createState() => _${screenClass}BodyState();
}

class _${screenClass}BodyState extends State<_${screenClass}Body> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<$controller, $stateType>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.success) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.failure) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return UnfocusWrapper(
          child: Scaffold(
            appBar: CustomAppBar(title: '$screenClass'),
            body: Form(
              key: _formKey,
              child: const Center(
                child: Text('$screenClass View'),
              ),
            ),
          ),
        );
      },
    );
  }
}
''');
  } else {
    // Cubit: both shell and body can be StatelessWidget
    File(viewPath)
      ..createSync(recursive: true)
      ..writeAsStringSync('''import 'package:flutter/material.dart';
import '../../../${featureFile}_exports.dart';

/// Public entry point for the $screenClass screen.
class ${screenClass}View extends StatelessWidget {
  const ${screenClass}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<$controller>(),
      child: const _${screenClass}Body(),
    );
  }
}

class _${screenClass}Body extends StatelessWidget {
  const _${screenClass}Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<$controller, $stateType>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: '$screenClass'),
          body: const Center(
            child: Text('$screenClass View'),
          ),
        );
      },
    );
  }
}
''');
  }

  logger.success(
    '🧱 Created: lib/features/$featureFile/presentation/$screenFile/views/${screenFile}_view.dart',
  );
}

// ---------------------------------------------------------------------------
// Update feature barrel
// Note: view is NOT exported here to avoid circular imports
// (view imports the barrel; barrel must not export the view)
// routes.dart imports the view directly instead.
// ---------------------------------------------------------------------------
void _updateFeatureBarrel(
  Directory featureDir,
  String featureFile,
  String screenFile,
  String stateManagement,
  Logger logger,
) {
  final barrelFile = File('${featureDir.path}/${featureFile}_exports.dart');

  if (!barrelFile.existsSync()) {
    logger.warn(
      '⚠️  ${featureFile}_exports.dart not found. Add exports manually.',
    );
    return;
  }

  String content = barrelFile.readAsStringSync();

  // Build the new export lines for this screen (view excluded — circular import)
  final newExports = stateManagement == 'bloc'
      ? '''
// Presentation — $screenFile screen
export './presentation/$screenFile/blocs/${screenFile}_bloc.dart';
export './presentation/$screenFile/blocs/${screenFile}_event.dart';
export './presentation/$screenFile/blocs/${screenFile}_state.dart';'''
      : '''
// Presentation — $screenFile screen
export './presentation/$screenFile/cubit/${screenFile}_cubit.dart';
export './presentation/$screenFile/cubit/${screenFile}_state.dart';''';

  // Guard: already exported?
  if (content.contains("presentation/$screenFile/")) {
    logger.warn(
      '⚠️  Exports for $screenFile already present in ${featureFile}_exports.dart',
    );
    return;
  }

  // Append after last existing export line
  final lastExport = RegExp(r"export '[^']+';").allMatches(content);
  if (lastExport.isNotEmpty) {
    final insertAt = lastExport.last.end;
    content =
        '${content.substring(0, insertAt)}\n$newExports\n${content.substring(insertAt)}';
  } else {
    content = '${content.trimRight()}\n$newExports\n';
  }

  barrelFile.writeAsStringSync(content);
  logger.success(
    '📦 Appended $screenFile exports to lib/features/$featureFile/${featureFile}_exports.dart',
  );
}

// ---------------------------------------------------------------------------
// Update routes
// ---------------------------------------------------------------------------
void _updateRoutes(
  Directory libDir,
  String screenClass,
  String screenFile,
  Logger logger,
) {
  _updateRoutePaths(
    File('${libDir.path}/routes/route_paths.dart'), screenFile, logger,
  );
  _updateRouteNames(
    File('${libDir.path}/routes/route_names.dart'), screenFile, logger,
  );
  _updateRoutesFile(
    File('${libDir.path}/routes/routes.dart'), screenClass, screenFile, logger,
  );
}

void _updateRoutePaths(File file, String screenFile, Logger logger) {
  if (!file.existsSync()) {
    logger.warn('⚠️  route_paths.dart not found. Add path manually.');
    return;
  }
  String content = file.readAsStringSync();
  if (content.contains("static const String $screenFile")) {
    logger.warn('⚠️  Path for $screenFile already in route_paths.dart');
    return;
  }
  final brace = content.lastIndexOf('}');
  content = '${content.substring(0, brace)}'
      "  static const String $screenFile = '/$screenFile';\n"
      '${content.substring(brace)}';
  file.writeAsStringSync(content);
  logger.success('🧭 Added $screenFile to route_paths.dart');
}

void _updateRouteNames(File file, String screenFile, Logger logger) {
  if (!file.existsSync()) {
    logger.warn('⚠️  route_names.dart not found. Add name manually.');
    return;
  }
  String content = file.readAsStringSync();
  if (content.contains("static const String $screenFile")) {
    logger.warn('⚠️  Name for $screenFile already in route_names.dart');
    return;
  }
  final brace = content.lastIndexOf('}');
  content = '${content.substring(0, brace)}'
      "  static const String $screenFile = '$screenFile';\n"
      '${content.substring(brace)}';
  file.writeAsStringSync(content);
  logger.success('🧭 Added $screenFile to route_names.dart');
}

void _updateRoutesFile(
  File file,
  String screenClass,
  String screenFile,
  Logger logger,
) {
  if (!file.existsSync()) {
    logger.warn('⚠️  routes.dart not found. Add route manually.');
    return;
  }
  String content = file.readAsStringSync();
  if (content.contains('RoutePaths.$screenFile') ||
      content.contains('${screenClass}View()')) {
    logger.warn('⚠️  Route for $screenFile already in routes.dart');
    return;
  }

  final newRoute = '''      GoRoute(
        path: RoutePaths.$screenFile,
        name: RouteNames.$screenFile,
        builder: (context, state) => const ${screenClass}View(),
      ),''';

  final routesMatch = RegExp(r'routes:\s*\[').firstMatch(content);
  if (routesMatch != null) {
    final routesEnd = content.indexOf(']', routesMatch.end);
    final beforeClosing = content.lastIndexOf(')', routesEnd);
    if (beforeClosing != -1) {
      final insertAt = content.indexOf(',', beforeClosing) + 1;
      content =
          '${content.substring(0, insertAt)}\n$newRoute${content.substring(insertAt)}';
    }
  }

  file.writeAsStringSync(content);
  logger.success('🧭 Added $screenClass route to routes.dart');
}

// ---------------------------------------------------------------------------
// Update DI — append factory to core/di/register_{feature}.dart
// ---------------------------------------------------------------------------
void _updateDiRegistration(
  Directory libDir,
  String featureFile,
  String screenClass,
  String screenFile,
  String stateManagement,
  Logger logger,
) {
  final registerFile =
      File('${libDir.path}/core/di/register_$featureFile.dart');

  if (!registerFile.existsSync()) {
    logger.warn(
      '⚠️  core/di/register_$featureFile.dart not found.\n'
      '   Add the registration manually:\n'
      '   sl.registerFactory<$screenClass${stateManagement == 'bloc' ? 'Bloc' : 'Cubit'}>(\n'
      '     () => $screenClass${stateManagement == 'bloc' ? 'Bloc' : 'Cubit'}(),\n'
      '   );',
    );
    return;
  }

  String content = registerFile.readAsStringSync();

  final controllerType =
      '$screenClass${stateManagement == 'bloc' ? 'Bloc' : 'Cubit'}';
  final importPath =
      "../../features/$featureFile/presentation/$screenFile/${stateManagement == 'bloc' ? 'blocs' : 'cubit'}/${screenFile}_$stateManagement.dart";

  // Guard: already registered?
  if (content.contains('registerFactory<$controllerType>')) {
    logger.warn(
      '⚠️  $controllerType already registered in register_$featureFile.dart',
    );
    return;
  }

  // Add import
  final importLine = "import '$importPath';";
  final lastImport = content.lastIndexOf("import '");
  if (lastImport != -1) {
    final endOfImport = content.indexOf(';', lastImport) + 1;
    content =
        '${content.substring(0, endOfImport)}\n$importLine${content.substring(endOfImport)}';
  }

  // Append factory inside registerFeature() before closing brace
  final funcMatch =
      RegExp(r'Future<void>\s+register\w+\s*\(\s*\)\s+async\s*\{')
          .firstMatch(content);
  if (funcMatch != null) {
    final closingBrace = content.lastIndexOf('}');
    final registration = stateManagement == 'bloc'
        ? '''
  // BLoC — $screenClass screen
  sl.registerFactory<$controllerType>(
    () => $controllerType(/* inject usecases: someUsecase: sl() */),
  );
'''
        : '''
  // Cubit — $screenClass screen
  sl.registerFactory<$controllerType>(
    () => $controllerType(/* inject usecases if needed */),
  );
''';
    content =
        '${content.substring(0, closingBrace)}$registration${content.substring(closingBrace)}';
  }

  registerFile.writeAsStringSync(content);
  logger.success(
    '🔧 Registered $controllerType in core/di/register_$featureFile.dart',
  );
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------
String _toPascalCase(String text) {
  return text.split('_').map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join('');
}

String _toSnakeCase(String text) {
  return text
      .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)}')
      .toLowerCase()
      .replaceAll(RegExp(r'^_'), '');
}
