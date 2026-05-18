import '../local_storage/storage.dart';
import '../services/session_manager.dart';
import '../services/splash_services.dart';
import 'app_dependencies.dart';

Future<void> registerCore() async {
  sl.registerLazySingleton(() => LocalStorage());
  sl.registerLazySingleton(() => SessionController());
  sl.registerLazySingleton(() => SplashServices());
}
