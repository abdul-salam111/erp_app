import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/loan_and_advance_repository.dart';

class ApplyLoanParams {
  final String loanType;
  final double amount;
  final int tenureMonths;
  final String reason;

  const ApplyLoanParams({
    required this.loanType,
    required this.amount,
    required this.tenureMonths,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        'loanType': loanType,
        'amount': amount,
        'tenureMonths': tenureMonths,
        'reason': reason,
      };
}

class ApplyLoanUsecase implements Usecase<dynamic, ApplyLoanParams> {
  final LoanAndAdvanceRepository repository;
  const ApplyLoanUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(ApplyLoanParams params) {
    return repository.applyLoan(params.toJson());
  }
}
