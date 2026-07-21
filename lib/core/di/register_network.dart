import 'package:dio/dio.dart';
import '../networks/network_manager/dio_client.dart';
import '../networks/network_manager/dio_helper.dart';
import 'app_dependencies.dart';

Future<void> registerNetwork() async {
  sl.registerLazySingleton<Dio>(() => DioClient.create());
  sl.registerLazySingleton(() => DioHelper(dio: sl()));
}
