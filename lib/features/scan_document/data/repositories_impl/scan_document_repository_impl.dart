import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/scan_document_repository.dart';
import '../datasources/remote_scan_document_datasource.dart';

class ScanDocumentRepositoryImpl extends BaseRepository
    implements ScanDocumentRepository {
  final IRemoteScanDocumentDataSource dataSource;

  ScanDocumentRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
