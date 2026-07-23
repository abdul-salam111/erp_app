import 'package:equatable/equatable.dart';

abstract class ApplyLoanEvent extends Equatable {
  const ApplyLoanEvent();
  @override
  List<Object?> get props => [];
}

class ApplyLoanSubmitted extends ApplyLoanEvent {
  final String loanType;
  final double amount;
  final int tenureMonths;
  final String reason;

  const ApplyLoanSubmitted({
    required this.loanType,
    required this.amount,
    required this.tenureMonths,
    required this.reason,
  });

  @override
  List<Object?> get props => [loanType, amount, tenureMonths, reason];
}
