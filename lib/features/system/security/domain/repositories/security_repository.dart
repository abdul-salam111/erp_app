import 'package:fpdart/fpdart.dart';
import '../../../../../core/shared/shared_exports.dart';

abstract interface class SecurityRepository {
 
  Future<Either<Failure, dynamic>> performAction();
}
