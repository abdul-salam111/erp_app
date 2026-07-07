import '../../features/scan_document/data/repositories_impl/scan_document_repository_impl.dart';
import '../../features/scan_document/domain/repositories/scan_document_repository.dart';
import '../../features/scan_document/domain/usecases/add_document.dart';
import '../../features/scan_document/domain/usecases/delete_document.dart';
import '../../features/scan_document/domain/usecases/get_documents.dart';
import '../../features/scan_document/presentation/scan_document/blocs/scan_document_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerScanDocument() async {
  sl.registerLazySingleton<DocumentRepository>(
    () => DocumentRepositoryImpl(),
  );

  sl.registerLazySingleton(() => GetDocuments(sl()));
  sl.registerLazySingleton(() => AddDocument(sl()));
  sl.registerLazySingleton(() => DeleteDocument(sl()));

  sl.registerFactory<ScannerBloc>(
    () => ScannerBloc(
      getDocuments: sl(),
      addDocument: sl(),
      deleteDocument: sl(),
    ),
  );
}
