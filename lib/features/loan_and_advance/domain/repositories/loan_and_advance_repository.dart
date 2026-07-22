import '../../../../core/utils/result.dart';

abstract interface class LoanAndAdvanceRepository {
  Future<Result<dynamic>> performAction();
}
