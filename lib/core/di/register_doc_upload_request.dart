import '../../features/doc_upload_request/doc_upload_request_exports.dart';
import 'app_dependencies.dart';

Future<void> registerDocUploadRequest() async {
  // DataSource
  sl.registerLazySingleton<IRemoteDocUploadRequestDataSource>(
    () => RemoteDocUploadRequestDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<DocUploadRequestRepository>(
    () => DocUploadRequestRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<GetDocUploadRequestsUsecase>(
    () => GetDocUploadRequestsUsecase(repository: sl()),
  );
  sl.registerLazySingleton<UploadDocumentUsecase>(
    () => UploadDocumentUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<DocUploadRequestBloc>(
    () => DocUploadRequestBloc(getDocUploadRequestsUsecase: sl()),
  );
  sl.registerFactory<DocumentUploadBloc>(
    () => DocumentUploadBloc(uploadDocumentUsecase: sl()),
  );
}
