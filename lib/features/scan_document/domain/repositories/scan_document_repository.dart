import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';

abstract interface class ScanDocumentRepository {
  Future<Either<Failure, dynamic>> performAction();
}
