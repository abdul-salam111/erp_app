/* -------------------------------------------------------------------------- */
/*                             Base Repository                                 */
/* -------------------------------------------------------------------------- */

import 'package:fpdart/fpdart.dart';

import '../../../errors/failures.dart';
import '../../../networks/network_exports.dart';

abstract class BaseRepository {
  /// Executes a data-layer [call] and maps the result into [Either<Failure, T>].
  /// [AppException] subtypes are translated to [Failure] subtypes here —
  /// nothing above this layer ever sees a raw [AppException].
  Future<Either<Failure, T>> execute<T>({
    required Future<T> Function() call,
  }) async {
    try {
      return Right(await call());
    } on AppException catch (e) {
      return Left(Failure.fromException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
