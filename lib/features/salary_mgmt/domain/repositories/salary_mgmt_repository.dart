import '../../../../core/utils/result.dart';

abstract interface class SalaryMgmtRepository {
  Future<Result<dynamic>> performAction();
}
