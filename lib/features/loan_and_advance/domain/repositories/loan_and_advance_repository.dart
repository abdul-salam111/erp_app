import '../../../../core/utils/result.dart';

abstract interface class LoanAndAdvanceRepository {
  Future<Result<dynamic>> performAction();
  Future<Result<dynamic>> applyLoan(Map<String, dynamic> body);
}
