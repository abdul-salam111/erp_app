import 'package:dio/dio.dart';
import '../debug/cubit/api_debug_cubit.dart';
import '../debug/api_debug_interceptor.dart';
import '../networks/network_manager/dio_client.dart';
import '../networks/network_manager/dio_helper.dart';
import 'app_dependencies.dart';

Future<void> registerNetwork() async {
  final apiDebugCubit = ApiDebugCubit();
  await apiDebugCubit.init();
  sl.registerSingleton<ApiDebugCubit>(apiDebugCubit);

  sl.registerLazySingleton<Dio>(() {
    final dio = DioClient.create();
    dio.interceptors.add(ApiDebugInterceptor(sl<ApiDebugCubit>()));
    return dio;
  });
  sl.registerLazySingleton(() => DioHelper(dio: sl()));
}
