import '../../../../core/utils/result.dart';

abstract interface class OvertimeRepository {
  Future<Result<dynamic>> performAction();
}
