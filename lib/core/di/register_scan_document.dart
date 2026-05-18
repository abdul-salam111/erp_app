import '../../features/scan_document/data/datasources/remote_scan_document_datasource.dart';
import '../../features/scan_document/data/repositories_impl/scan_document_repository_impl.dart';
import '../../features/scan_document/domain/repositories/scan_document_repository.dart';
import '../../features/scan_document/domain/usecases/scan_document_usecase.dart';
import '../../features/scan_document/presentation/scan_document/blocs/scan_document_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerScanDocument() async {
  // DataSource
  sl.registerLazySingleton<IRemoteScanDocumentDataSource>(
    () => RemoteScanDocumentDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<ScanDocumentRepository>(
    () => ScanDocumentRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<ScanDocumentUsecase>(
    () => ScanDocumentUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<ScanDocumentBloc>(
    () => ScanDocumentBloc(scandocumentUsecase: sl()),
  );
}
