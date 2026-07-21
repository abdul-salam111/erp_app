import '../../../errors/failures.dart';
import '../../../networks/network_exports.dart';
import '../../../utils/result.dart';

abstract class BaseRepository {
  Future<Result<T>> execute<T>({
    required Future<T> Function() call,
  }) async {
    try {
      return Result.success(await call());
    } on AppException catch (e) {
      return Result.failure(Failure.fromException(e));
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }
}
