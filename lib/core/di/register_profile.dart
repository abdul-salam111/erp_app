import 'package:get_it/get_it.dart';
import '../../features/profile/data/datasources/remote_profile_datasource.dart';
import '../../features/profile/data/repositories_impl/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/get_my_profile_usecase.dart';
import '../../features/profile/profile_exports.dart';

final _sl = GetIt.instance;

Future<void> profileDependencies() async {
  // DataSource
  _sl.registerLazySingleton<IRemoteProfileDataSource>(
    () => RemoteProfileDataSourceImpl(dioHelper: _sl()),
  );

  // Repository
  _sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(dataSource: _sl()),
  );

  // UseCases
  _sl.registerLazySingleton<GetMyProfileUsecase>(
    () => GetMyProfileUsecase(repository: _sl()),
  );

  // BLoC — Profile screen
  _sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(deleteTokenUsecase: _sl()),
  );
}
