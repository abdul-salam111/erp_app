import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;

  // 🧠 Step 1: Get feature name from user
  final featureName = context.vars['feature_name'] as String;

  final className = _toPascalCase(featureName);
  final fileName = _toSnakeCase(featureName);

  logger.info('\n🚀 Creating feature: $featureName');
  logger.info('📝 Class name: $className');
  logger.info('📝 File name: $fileName\n');

  final currentDir = Directory.current;
  final libDir = Directory('${currentDir.path}/lib');

  if (!libDir.existsSync()) {
    libDir.createSync(recursive: true);
  }

  // 🧱 Create feature structure
  _createCleanFeature(libDir, className, fileName, logger);

  logger.success('\n✅ $className feature created successfully!');
  logger.info('\n📦 Next steps:');
  logger.info('1. Update API endpoints in datasource');
  logger.info('2. Define your models in data/models/');
  logger.info('3. Implement business logic in usecases');
  logger.info('4. Design UI in presentation/views/');
}

// ------------------------------------------------------------------
// 🧩 CREATE CLEAN FEATURE (Bloc)
// ------------------------------------------------------------------
void _createCleanFeature(
  Directory libDir,
  String className,
  String fileName,
  Logger logger,
) {
  final featureDir = Directory('${libDir.path}/features/$fileName');
  final dataFolders = [
    'datasources',
    'repository_impl',
    'models',
    'models/request_models',
    'models/response_models'
  ];
  final domainFolders = ['repositories', 'usecases', 'entities'];
  final presentationFolders = ['views', 'widgets', 'blocs'];

  // ✅ Create root structure
  for (var folder in [
    'features',
    'features/$fileName',
    'features/$fileName/data',
    'features/$fileName/domain',
    'features/$fileName/presentation',
  ]) {
    Directory('${libDir.path}/$folder').createSync(recursive: true);
    logger.success('📁 Created: lib/$folder');
  }

  // ✅ Create data layer
  for (var folder in dataFolders) {
    Directory('${featureDir.path}/data/$folder').createSync(recursive: true);
    logger.success('📁 Created: lib/features/$fileName/data/$folder');
  }

  // ✅ Create domain layer
  for (var folder in domainFolders) {
    Directory('${featureDir.path}/domain/$folder').createSync(recursive: true);
    logger.success('📁 Created: lib/features/$fileName/domain/$folder');
  }

  // ✅ Create presentation layer
  for (var folder in presentationFolders) {
    Directory('${featureDir.path}/presentation/$folder')
        .createSync(recursive: true);
    logger.success('📁 Created: lib/features/$fileName/presentation/$folder');
  }

  // ✅ Create all files
  _createBlocFiles(featureDir, className, fileName, logger);
  _createDataSourceFiles(featureDir, className, fileName, logger);
  _createRepositoryFiles(featureDir, className, fileName, logger);
  _createUseCaseFiles(featureDir, className, fileName, logger);
  _createEntityFiles(featureDir, className, fileName, logger);

  // ✅ Update routes
  _updateRoutes(libDir, className, fileName, logger);

  // ✅ Update dependency injection
  _updateDependencyInjection(libDir, className, fileName, logger);
}

// ------------------------------------------------------------------
// 🧩 Create Bloc Files
// ------------------------------------------------------------------
void _createBlocFiles(
  Directory featureDir,
  String className,
  String fileName,
  Logger logger,
) {
  // ✅ View File
  File('${featureDir.path}/presentation/views/${fileName}_view.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import 'package:flutter/material.dart';
import '../../../../app_exports.dart';

class ${className}View extends StatefulWidget {
  const ${className}View({super.key});

  @override
  State<${className}View> createState() => _${className}ViewState();
}

class _${className}ViewState extends State<${className}View> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<${className}Bloc>(),
      child: UnfocusWrapper(
        child: Scaffold(
          appBar: AppBar(title: const Text('$className')),
          body: BlocConsumer<${className}Bloc, ${className}State>(
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.success) {
                AppToastsUtils.showSuccessTop(
                  context,
                  "Success!",
                );
              }

              if (state.apiStatus == ApiStatus.failure) {
                AppToastsUtils.showErrorTop(context, state.message.toString());
              }
            },
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: .all(12),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        // TODO: Add your UI widgets here
                        const Text('$className View'),
                        heightBox(context.screenHeight * 0.05),
                        BlocBuilder<${className}Bloc, ${className}State>(
                          buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                          builder: (context, state) {
                            return CustomButton(
                              isLoading: state.apiStatus == ApiStatus.loading,
                              text: "Submit",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<${className}Bloc>().add(
                                    ${className}Submitted(),
                                  );
                                }
                              },
                              radius: 10,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/presentation/views/${fileName}_view.dart');

  // ✅ Bloc
  File('${featureDir.path}/presentation/blocs/${fileName}_bloc.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State>
    with UsecaseExecuterMixin {
  final ${className}Usecase ${_toLowerCamelCase(className)}Usecase;

  ${className}Bloc({required this.${_toLowerCamelCase(className)}Usecase}) : super(${className}State()) {
    on<${className}Submitted>(_on${className}Submitted);
  }

  Future<void> _on${className}Submitted(
    ${className}Submitted event,
    Emitter<${className}State> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => ${_toLowerCamelCase(className)}Usecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/presentation/blocs/${fileName}_bloc.dart');

  // ✅ Bloc Events
  File('${featureDir.path}/presentation/blocs/${fileName}_event.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

abstract class ${className}Event extends Equatable {
  const ${className}Event();

  @override
  List<Object> get props => [];
}

class ${className}Submitted extends ${className}Event {}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/presentation/blocs/${fileName}_event.dart');

  // ✅ Bloc States
  File('${featureDir.path}/presentation/blocs/${fileName}_state.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class ${className}State extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const ${className}State({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.initial,
  });

  ${className}State copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return ${className}State(
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
      '🧱 Created: lib/features/$fileName/presentation/blocs/${fileName}_state.dart');
}

// ------------------------------------------------------------------
// 🧩 Create DataSource Files
// ------------------------------------------------------------------
void _createDataSourceFiles(
  Directory featureDir,
  String className,
  String fileName,
  Logger logger,
) {
  File('${featureDir.path}/data/datasources/remote_${fileName}_datasource.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

abstract interface class IRemote${className}DataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class Remote${className}DataSourceImpl extends BaseRemoteDatasource
    implements IRemote${className}DataSource {
  Remote${className}DataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.${_toLowerCamelCase(fileName)},
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/data/datasources/remote_${fileName}_datasource.dart');
}

// ------------------------------------------------------------------
// 🧩 Create Repository Files
// ------------------------------------------------------------------
void _createRepositoryFiles(
  Directory featureDir,
  String className,
  String fileName,
  Logger logger,
) {
  // Repository Interface
  File('${featureDir.path}/domain/repositories/${fileName}_repository.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

abstract interface class I${className}Repository {
  // TODO: Define your repository methods here
  Future<Either<AppException, dynamic>> performAction();
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/domain/repositories/${fileName}_repository.dart');

  // Repository Implementation
  File(
      '${featureDir.path}/data/repository_impl/${fileName}_repository_impl.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class ${className}RepositoryImpl extends BaseRepository implements I${className}Repository {
  final IRemote${className}DataSource dataSource;

  ${className}RepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/data/repository_impl/${fileName}_repository_impl.dart');
}

// ------------------------------------------------------------------
// 🧩 Create UseCase Files
// ------------------------------------------------------------------
void _createUseCaseFiles(
  Directory featureDir,
  String className,
  String fileName,
  Logger logger,
) {
  File('${featureDir.path}/domain/usecases/${fileName}_usecase.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class ${className}Usecase implements Usecase<dynamic, NoParams> {
  final I${className}Repository repository;

  ${className}Usecase({required this.repository});

  @override
  Future<Either<AppException, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/domain/usecases/${fileName}_usecase.dart');
}

// ------------------------------------------------------------------
// 🧩 Create Entity Files
// ------------------------------------------------------------------
void _createEntityFiles(
  Directory featureDir,
  String className,
  String fileName,
  Logger logger,
) {
  File('${featureDir.path}/domain/entities/${fileName}_entity.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class ${className}Entity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const ${className}Entity({required this.id});

  @override
  List<Object> get props => [id];
}
''');
  logger.success(
      '🧱 Created: lib/features/$fileName/domain/entities/${fileName}_entity.dart');
}

// ------------------------------------------------------------------
// 🧩 Update Routes
// ------------------------------------------------------------------
void _updateRoutes(
  Directory libDir,
  String className,
  String fileName,
  Logger logger,
) {
  final routesDir = Directory('${libDir.path}/routes');
  if (!routesDir.existsSync()) {
    routesDir.createSync(recursive: true);
  }

  final pathsFile = File('${routesDir.path}/route_paths.dart');
  final namesFile = File('${routesDir.path}/route_names.dart');
  final routesFile = File('${routesDir.path}/routes.dart');

  // Update route_paths.dart
  _updateRoutePaths(pathsFile, fileName, logger);

  // Update route_names.dart
  _updateRouteNames(namesFile, fileName, logger);

  // Update routes.dart
  _updateRoutesFile(routesFile, className, fileName, logger);
}

void _updateRoutePaths(File pathsFile, String fileName, Logger logger) {
  if (!pathsFile.existsSync()) {
    pathsFile.createSync(recursive: true);
    pathsFile.writeAsStringSync('''class RoutePaths {
  static const String $fileName = '/$fileName';
}
''');
    logger.success('🧭 Created: lib/routes/route_paths.dart');
    return;
  }

  String content = pathsFile.readAsStringSync();

  if (content.contains("static const String $fileName")) {
    logger.warn('⚠️  Path for $fileName already exists in route_paths.dart');
    return;
  }

  final closingBrace = content.lastIndexOf('}');
  final newPath = "  static const String $fileName = '/$fileName';\n";
  content = content.substring(0, closingBrace) +
      newPath +
      content.substring(closingBrace);

  pathsFile.writeAsStringSync(content);
  logger.success('🧭 Added $fileName path to route_paths.dart');
}

void _updateRouteNames(File namesFile, String fileName, Logger logger) {
  if (!namesFile.existsSync()) {
    namesFile.createSync(recursive: true);
    namesFile.writeAsStringSync('''class RouteNames {
  static const String $fileName = '$fileName';
}
''');
    logger.success('🧭 Created: lib/routes/route_names.dart');
    return;
  }

  String content = namesFile.readAsStringSync();

  if (content.contains("static const String $fileName")) {
    logger.warn('⚠️  Name for $fileName already exists in route_names.dart');
    return;
  }

  final closingBrace = content.lastIndexOf('}');
  final newName = "  static const String $fileName = '$fileName';\n";
  content = content.substring(0, closingBrace) +
      newName +
      content.substring(closingBrace);

  namesFile.writeAsStringSync(content);
  logger.success('🧭 Added $fileName name to route_names.dart');
}

void _updateRoutesFile(
  File routesFile,
  String className,
  String fileName,
  Logger logger,
) {
  if (!routesFile.existsSync()) {
    routesFile.createSync(recursive: true);
    routesFile.writeAsStringSync('''import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'route_names.dart';
import '../features/$fileName/presentation/views/${fileName}_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.$fileName,
    routes: [
      GoRoute(
        path: RoutePaths.$fileName,
        name: RouteNames.$fileName,
        builder: (context, state) => const ${className}View(),
      ),
    ],
  );
}
''');
    logger.success('🧭 Created: lib/routes/routes.dart');
    return;
  }

  String content = routesFile.readAsStringSync();

  if (content.contains('RoutePaths.$fileName') ||
      content.contains('${className}View()')) {
    logger.warn('⚠️  Route for $fileName already exists in routes.dart');
    return;
  }

  // Add import
  final importStatement =
      "import '../features/$fileName/presentation/views/${fileName}_view.dart';";
  if (!content.contains(importStatement)) {
    final lastImportIndex = content.lastIndexOf("import '");
    if (lastImportIndex != -1) {
      final endOfLastImport = content.indexOf(';', lastImportIndex) + 1;
      content =
          '${content.substring(0, endOfLastImport)}\n$importStatement${content.substring(endOfLastImport)}';
    }
  }

  // Add route
  final newRoute = '''      GoRoute(
        path: RoutePaths.$fileName,
        name: RouteNames.$fileName,
        builder: (context, state) => const ${className}View(),
      ),''';

  final routesMatch = RegExp(r'routes:\s*\[').firstMatch(content);
  if (routesMatch != null) {
    final routesStart = routesMatch.end;
    final routesEnd = content.indexOf(']', routesStart);
    final beforeClosing = content.lastIndexOf(')', routesEnd);

    if (beforeClosing != -1) {
      final insertPosition = content.indexOf(',', beforeClosing) + 1;
      content =
          '${content.substring(0, insertPosition)}\n$newRoute${content.substring(insertPosition)}';
    }
  }

  routesFile.writeAsStringSync(content);
  logger.success('🧭 Added $className route to routes.dart');
}

// ------------------------------------------------------------------
// 🧩 Update Dependency Injection
// ------------------------------------------------------------------
void _updateDependencyInjection(
  Directory libDir,
  String className,
  String fileName,
  Logger logger,
) {
  final coreDir = Directory('${libDir.path}/core');
  if (!coreDir.existsSync()) {
    coreDir.createSync(recursive: true);
  }

  final depFile = File('${libDir.path}/core/app_dependencies.dart');

  if (!depFile.existsSync()) {
    logger.warn('⚠️  app_dependencies.dart not found. Skipping DI setup.');
    return;
  }

  String content = depFile.readAsStringSync();

  // Check if already registered
  if (content.contains('${fileName}Dependencies')) {
    logger.warn(
        '⚠️  $className dependencies already registered in app_dependencies.dart');
    return;
  }

  // Find setupLocator function and add call
  final setupFunctionMatch =
      RegExp(r'Future<void>\s+setupLocator\s*\(\s*\)\s+async\s*\{')
          .firstMatch(content);

  if (setupFunctionMatch != null) {
    final functionStart = setupFunctionMatch.end;
    final dependencyCall = '\n  await ${fileName}Dependencies();';

    final closingBrace = content.indexOf('}', functionStart);
    if (closingBrace != -1) {
      content =
          '${content.substring(0, closingBrace)}$dependencyCall\n${content.substring(closingBrace)}';
    }
  }

  // Add dependency function
  final dependenciesFunction = '''

/// $className Feature Dependencies
Future<void> ${fileName}Dependencies() async {
  // DataSource
  sl.registerLazySingleton<IRemote${className}DataSource>(
    () => Remote${className}DataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<I${className}Repository>(
    () => ${className}RepositoryImpl(dataSource: sl()),
  );

  // UseCase
  sl.registerLazySingleton<${className}Usecase>(
    () => ${className}Usecase(repository: sl()),
  );

  // Bloc
  sl.registerFactory<${className}Bloc>(
    () => ${className}Bloc(${_toLowerCamelCase(className)}Usecase: sl()),
  );
}
''';

  content = content + dependenciesFunction;

  depFile.writeAsStringSync(content);
  logger.success(
      '🔧 Updated: lib/core/app_dependencies.dart with $className dependencies');
}

// ------------------------------------------------------------------
// 🧩 Helper Functions
// ------------------------------------------------------------------
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

String _toLowerCamelCase(String text) {
  final pascal = _toPascalCase(text);
  return pascal[0].toLowerCase() + pascal.substring(1);
}
