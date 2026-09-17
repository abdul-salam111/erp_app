import '../../../../core/utils/result.dart';
import '../entities/system_entity.dart';

abstract interface class SystemRepository {
  Future<Result<List<SystemUserEntity>>> getUsersList();
}
