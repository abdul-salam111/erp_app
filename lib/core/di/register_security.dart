import '../../features/system/presentation/security/blocs/security_bloc.dart';
import 'app_dependencies.dart';

// Security is a sub-module of system — it reuses system's data and domain
// layers (registered in register_system.dart); only its bloc is registered.
Future<void> registerSecurity() async {
  sl.registerFactory<SecurityBloc>(
    () => SecurityBloc(systemUsecase: sl()),
  );
}
