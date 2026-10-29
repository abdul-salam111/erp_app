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
  // Singleton: the pending/completed request list is shared app-wide (e.g.
  // the dashboard drawer badge and the Scan Document screen both read it)
  // so a screen that opens after the first fetch can reuse the cached
  // result instead of re-querying the API.
  sl.registerLazySingleton<DocUploadRequestBloc>(
    () => DocUploadRequestBloc(getDocUploadRequestsUsecase: sl()),
  );
  sl.registerFactory<DocumentUploadBloc>(
    () => DocumentUploadBloc(uploadDocumentUsecase: sl()),
  );
}
