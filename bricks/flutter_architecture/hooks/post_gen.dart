import 'dart:io';
import 'dart:convert';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;

  logger.info('🔧 Setting up Clean Architecture with Bloc...');

  // Install Bloc packages
  await _installBlocDependencies(logger);

  final currentDir = Directory.current;
  final libDir = Directory('${currentDir.path}/lib');
  if (!libDir.existsSync()) {
    libDir.createSync(recursive: true);
  }

  _createCleanFeature(libDir, logger);

  logger.success('✅ Clean Architecture with Bloc setup complete!');

  // Show next steps
  logger.info('''
📦 Bloc packages have been added to your pubspec.yaml.
''');
}

// ------------------------------------------------------------------
// 🧩 Install Bloc Dependencies
// ------------------------------------------------------------------
Future<void> _installBlocDependencies(Logger logger) async {
  logger.info('📦 Installing Bloc packages...');

  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    logger.err('❌ pubspec.yaml not found in current directory.');
    return;
  }

  String content = await pubspecFile.readAsString();

  // Check if Bloc packages are already in dependencies
  bool hasFlutterBloc = false;
  bool hasBloc = false;
  bool hasEquatable = false;
  bool hasGetIt = false;
  bool hasGoRouter = false;

  // Look specifically in the dependencies section
  final lines = content.split('\n');
  bool inDependenciesSection = false;

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i].trim();

    if (line == 'dependencies:') {
      inDependenciesSection = true;
      continue;
    }

    if (line == 'dev_dependencies:' ||
        (line.isNotEmpty &&
            !lines[i].startsWith('  ') &&
            !lines[i].startsWith('\t') &&
            inDependenciesSection)) {
      inDependenciesSection = false;
    }

    if (inDependenciesSection) {
      if (line.contains('flutter_bloc:')) hasFlutterBloc = true;
      if (line.contains('bloc:')) hasBloc = true;
      if (line.contains('equatable:')) hasEquatable = true;
      if (line.contains('get_it:')) hasGetIt = true;
      if (line.contains('go_router:')) hasGoRouter = true;
    }
  }

  // List of packages to add
  final packagesToAdd = <String>[];
  if (!hasFlutterBloc) packagesToAdd.add('  flutter_bloc: ^8.1.3');
  if (!hasBloc) packagesToAdd.add('  bloc: ^8.1.2');
  if (!hasEquatable) packagesToAdd.add('  equatable: ^2.0.5');
  if (!hasGetIt) packagesToAdd.add('  get_it: ^7.6.4');
  if (!hasGoRouter) packagesToAdd.add('  go_router: ^12.1.2');

  if (packagesToAdd.isEmpty) {
    logger.info('✅ All Bloc packages are already installed');
    return;
  }

  logger.info('📦 Adding missing packages: ${packagesToAdd.length} package(s)');

  // Create backup
  final backupFile = File('pubspec.yaml.backup');
  await backupFile.writeAsString(content);
  logger.info('📋 Created backup: pubspec.yaml.backup');

  // Add packages directly after the last dependency
  final updatedLines = <String>[];
  inDependenciesSection = false;
  bool packagesAdded = false;

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i];
    updatedLines.add(line);

    final trimmedLine = line.trim();

    if (trimmedLine == 'dependencies:') {
      inDependenciesSection = true;
      continue;
    }

    if (inDependenciesSection && !packagesAdded) {
      // Check if next line is dev_dependencies or another section
      if (i + 1 < lines.length) {
        final nextLine = lines[i + 1];
        final trimmedNextLine = nextLine.trim();

        if (trimmedNextLine == 'dev_dependencies:' ||
            (trimmedNextLine.isNotEmpty &&
                !nextLine.startsWith('  ') &&
                !nextLine.startsWith('\t'))) {
          // Add packages before this line
          for (final package in packagesToAdd) {
            updatedLines.add(package);
          }
          packagesAdded = true;
        }
      } else {
        // End of file, add packages here
        for (final package in packagesToAdd) {
          updatedLines.add(package);
        }
        packagesAdded = true;
      }
    }
  }

  final updatedContent = updatedLines.join('\n');
  await pubspecFile.writeAsString(updatedContent);
  logger.success('✅ Added packages to pubspec.yaml');

  // Show what was added
  for (final package in packagesToAdd) {
    logger.info('   + $package');
  }

  // Run flutter pub get
  logger.info('\n🔄 Running flutter pub get...');
  try {
    final process =
        await Process.start('flutter', ['pub', 'get'], runInShell: true);

    // Stream output in real-time
    process.stdout.transform(utf8.decoder).listen((data) {
      final output = data.trim();
      if (output.isNotEmpty) {
        logger.info(output);
      }
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      final output = data.trim();
      if (output.isNotEmpty) {
        logger.err(output);
      }
    });

    final exitCode = await process.exitCode;
    if (exitCode == 0) {
      logger.success('✅ Dependencies installed successfully');
      // Delete backup
      if (backupFile.existsSync()) {
        backupFile.deleteSync();
      }
    } else {
      logger.err('❌ Failed to install dependencies');
      logger.warn('⚠️  Restoring original pubspec.yaml from backup...');
      await pubspecFile.writeAsString(content);
      logger.info('Please run "flutter pub get" manually.');
    }
  } catch (e) {
    logger.err('❌ Error running flutter pub get: $e');
    logger.warn('⚠️  Restoring original pubspec.yaml from backup...');
    await pubspecFile.writeAsString(content);
    logger.info('Please run "flutter pub get" manually.');
  }
}

// ------------------------------------------------------------------
// 🧩 CLEAN FEATURE-BASED (with Bloc)
// ------------------------------------------------------------------
void _createCleanFeature(Directory libDir, Logger logger) {
  final featureName = 'signin';
  final featureDir = Directory('${libDir.path}/features/$featureName');
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
    'features/$featureName',
    'features/$featureName/data',
    'features/$featureName/domain',
    'features/$featureName/presentation',
  ]) {
    Directory('${libDir.path}/$folder').createSync(recursive: true);
    logger.success('📁 Created: lib/$folder');
  }

  // ✅ Create data layer
  for (var folder in dataFolders) {
    Directory('${featureDir.path}/data/$folder').createSync(recursive: true);
    logger.success('📁 Created: lib/features/$featureName/data/$folder');
  }

  // ✅ Create domain layer
  for (var folder in domainFolders) {
    Directory('${featureDir.path}/domain/$folder').createSync(recursive: true);
    logger.success('📁 Created: lib/features/$featureName/domain/$folder');
  }

  // ✅ Create presentation layer
  for (var folder in presentationFolders) {
    Directory('${featureDir.path}/presentation/$folder')
        .createSync(recursive: true);
    logger
        .success('📁 Created: lib/features/$featureName/presentation/$folder');
  }

  _createBlocFiles(featureDir, logger);

  // ✅ Create separate route files
  final className = 'SignIn';
  final fileName = 'signin';
  _createSeparateRouteFiles(libDir, fileName, className,
      'features/$featureName/presentation/views', logger);

  // ✅ Update dependency injection file
  _updateDependencyInjection(libDir, logger);
}

// ------------------------------------------------------------------
// 🧩 Create Bloc-specific files
// ------------------------------------------------------------------
void _createBlocFiles(Directory featureDir, Logger logger) {
  // ✅ Example View File
  File('${featureDir.path}/presentation/views/signin_view.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import 'package:flutter/material.dart';
import '../../../../app_exports.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignInBloc>(),
      child: UnfocusWrapper(
        child: Scaffold(
          appBar: AppBar(title: const Text('Sign In')),
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.success) {
                AppToastsUtils.showSuccessTop(
                  context,
                  "You have loggedin successfully!",
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
                        const AppLogo(),
                        heightBox(context.screenHeight * 0.1),
                        BlocBuilder<SignInBloc, SignInState>(
                          buildWhen: (p, n) => p.email != n.email,
                          builder: (context, state) {
                            return CustomTextFormField(
                              prefixIcon: Iconsax.sms,
                              label: "Email",
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Enter your email",
                              onChanged: (email) {
                                context.read<SignInBloc>().add(
                                  EmailChangedEvent(email),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<SignInBloc, SignInState>(
                          buildWhen: (p, n) => p.password != n.password,
                          builder: (context, state) {
                            return CustomTextFormField(
                              onChanged: (password) {
                                context.read<SignInBloc>().add(
                                  PasswordChangedEvent(password),
                                );
                              },
                              obscureText: true,
                              prefixIcon: Iconsax.lock,
                              label: 'Password',
                              hintText: "Enter your password",
                              keyboardType: TextInputType.visiblePassword,
                            );
                          },
                        ),
                        heightBox(context.screenHeight * 0.05),
                        BlocBuilder<SignInBloc, SignInState>(
                          buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                          builder: (context, state) {
                            return CustomButton(
                              isLoading: state.apiStatus == ApiStatus.loading,
                              text: "SignIn",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignInBloc>().add(
                                    SignInSubmitted(),
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
      '🧱 Created: lib/features/signin/presentation/views/signin_view.dart');

  // ✅ Create Bloc
  File('${featureDir.path}/presentation/blocs/signin_bloc.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';
class SignInBloc extends Bloc<SignInEvent, SignInState>
    with UsecaseExecuterMixin {
  final SignInUsecase signinUsecase;

  SignInBloc({required this.signinUsecase}) : super(SignInState()) {
    on<SignInSubmitted>(_onSignInSubmitted);
    on<EmailChangedEvent>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
    on<PasswordChangedEvent>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => signinUsecase.call(
        LoginUserById(uid: state.email, password: state.password),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, userToken: data, message: error),
    );
  }
}


''');
  logger.success(
      '🧱 Created: lib/features/signin/presentation/blocs/signin_bloc.dart');

  // ✅ Create Bloc Events
  File('${featureDir.path}/presentation/blocs/signin_event.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';
abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends SignInEvent {
  final String email;
  const EmailChangedEvent(this.email);
}

class PasswordChangedEvent extends SignInEvent {
  final String password;
  const PasswordChangedEvent(this.password);
}

class SignInSubmitted extends SignInEvent {}

''');
  logger.success(
      '🧱 Created: lib/features/signin/presentation/blocs/signin_event.dart');

  // ✅ Create Bloc States
  File('${featureDir.path}/presentation/blocs/signin_state.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class SignInState extends Equatable {
  final UserToken? userToken;
  final String? message;
  final ApiStatus apiStatus;

  final String email;
  final String password;
  const SignInState({
    this.userToken,
    this.message,
    this.apiStatus = ApiStatus.initial,
    this.email = "",
    this.password = "",
  });

  //copy with method
  SignInState copyWith({
    UserToken? userToken,
    String? message,
    ApiStatus? apiStatus,
    String? email,
    String? password,
  }) {
    return SignInState(
      userToken: userToken ?? this.userToken,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [userToken, message, apiStatus, email, password];
}

''');
  logger.success(
      '🧱 Created: lib/features/signin/presentation/blocs/signin_state.dart');

  // ✅ DataSource with Interface + Implementation
  File('${featureDir.path}/data/datasources/remote_signin_datasource.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

abstract interface class IRemoteSigninDataSource {
  Future<UserToken> loginUserById({required LoginUserById loginUserById});
}

class RemoteSigninDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteSigninDataSource {
  RemoteSigninDataSourceImpl({required super.dioHelper});

  @override
  Future<UserToken> loginUserById({
    required LoginUserById loginUserById,
  }) async {
    return post(
      url: ApiEndPoints.loginByUid,
      parser: (json) => UserToken.fromJson(json),
      body: loginUserById.toJson(),
    );
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/signin/data/datasources/remote_signin_datasource.dart');

  // ✅ Example Entity
  File('${featureDir.path}/domain/entities/signin_entity.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class SigninEntity extends Equatable {
  final String id;
  final String token;

  const SigninEntity({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}
''');
  logger.success(
      '🧱 Created: lib/features/signin/domain/entities/signin_entity.dart');

  // ✅ UseCase
  File('${featureDir.path}/domain/usecases/signin_usecase.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class SignInUsecase implements Usecase<UserToken, LoginUserById> {
  final ISigninRepository repository;

  SignInUsecase({required this.repository});

  @override
  Future<Either<AppException, UserToken>> call(LoginUserById loginUserById) {
    return repository.signinUserById(loginUserById: loginUserById);
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/signin/domain/usecases/signin_usecase.dart');

  // ✅ Example Repository Interface
  File('${featureDir.path}/domain/repositories/signin_repository.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

abstract interface class ISigninRepository {
  Future<Either<AppException, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  });
}
''');
  logger.success(
      '🧱 Created: lib/features/signin/domain/repositories/signin_repository.dart');

  // ✅ Example Repository Implementation
  File('${featureDir.path}/data/repository_impl/signin_repository_impl.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync('''import '../../../../app_exports.dart';

class SigninRepositoryImpl extends BaseRepository implements ISigninRepository {
  final IRemoteSigninDataSource dataSource;

  SigninRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  }) {
    return execute(
      call: () => dataSource.loginUserById(loginUserById: loginUserById),
    );
  }
}
''');
  logger.success(
      '🧱 Created: lib/features/signin/data/repository_impl/signin_repository_impl.dart');
}

// ------------------------------------------------------------------
// 🧩 SHARED: Create Separate Route Files (Paths, Names, Routes)
// ------------------------------------------------------------------
void _createSeparateRouteFiles(Directory libDir, String fileName,
    String className, String viewPath, Logger logger) {
  final routesDir = Directory('${libDir.path}/routes');
  if (!routesDir.existsSync()) {
    routesDir.createSync(recursive: true);
  }

  // ✅ 1. Create route_paths.dart
  final pathsFile = File('${routesDir.path}/route_paths.dart');
  pathsFile.writeAsStringSync('''class RoutePaths {
  static const String $fileName = '/$fileName';
}
''');
  logger.success('🧭 Created: lib/routes/route_paths.dart');

  // ✅ 2. Create route_names.dart
  final namesFile = File('${routesDir.path}/route_names.dart');
  namesFile.writeAsStringSync('''class RouteNames {
  static const String $fileName = '$fileName';
}
''');
  logger.success('🧭 Created: lib/routes/route_names.dart');

  // ✅ 3. Create routes.dart (GoRouter based)
  final routesFile = File('${routesDir.path}/routes.dart');

  routesFile.writeAsStringSync('''import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'route_names.dart';
import '../$viewPath/${fileName}_view.dart';

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
}

// ------------------------------------------------------------------
// 🧩 Update Dependency Injection (GetIt for Bloc) - Clean Structure
// ------------------------------------------------------------------
void _updateDependencyInjection(Directory libDir, Logger logger) {
  // Create core directory if it doesn't exist
  final coreDir = Directory('${libDir.path}/core');
  if (!coreDir.existsSync()) {
    coreDir.createSync(recursive: true);
    logger.success('📁 Created: lib/core');
  }

  final depFile = File('${libDir.path}/core/app_dependencies.dart');

  // If file doesn't exist, create it with clean structure
  if (!depFile.existsSync()) {
    depFile.createSync(recursive: true);
    depFile.writeAsStringSync('''import '../app_exports.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  await coreDependencies();
  await signinDependencies();
}

/// Core Dependencies (DioHelper, SharedPreferences, etc.)
Future<void> coreDependencies() async {
  // Register core dependencies here
  // Example:
  // sl.registerLazySingleton<DioHelper>(() => DioHelper());
}

/// SignIn Feature Dependencies
Future<void> signinDependencies() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSigninDataSource>(
    () => RemoteSigninDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<ISigninRepository>(
    () => SigninRepositoryImpl(dataSource: sl()),
  );

  // UseCase
  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(repository: sl()),
  );

  // Bloc
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(signinUsecase: sl()),
  );
}
''');
    logger.success('🧩 Created: lib/core/app_dependencies.dart');
    return;
  }

  String content = depFile.readAsStringSync();

  // Check if SignIn dependencies are already registered
  if (content.contains('signinDependencies')) {
    logger.warn(
        '⚠️  SignIn dependencies already registered in app_dependencies.dart');
    return;
  }

  // Find setupLocator function and add signin call
  final setupFunctionMatch =
      RegExp(r'Future<void>\s+setupLocator\s*\(\s*\)\s+async\s*\{')
          .firstMatch(content);

  if (setupFunctionMatch != null) {
    final functionStart = setupFunctionMatch.end;
    final signinCall = '\n  await signinDependencies();';

    // Insert the call before the closing brace
    final closingBrace = content.indexOf('}', functionStart);
    if (closingBrace != -1) {
      content =
          '${content.substring(0, closingBrace)}$signinCall\n${content.substring(closingBrace)}';
    }
  }

  // Add signinDependencies function at the end
  final signinDependenciesFunction = '''

/// SignIn Feature Dependencies
Future<void> signinDependencies() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSigninDataSource>(
    () => RemoteSigninDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<ISigninRepository>(
    () => SigninRepositoryImpl(dataSource: sl()),
  );

  // UseCase
  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(repository: sl()),
  );

  // Bloc
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(signinUsecase: sl()),
  );
}
''';

  // Add at the end of file
  content = content + signinDependenciesFunction;

  depFile.writeAsStringSync(content);
  logger.success(
      '🔧 Updated: lib/core/app_dependencies.dart with SignIn dependencies');
}
