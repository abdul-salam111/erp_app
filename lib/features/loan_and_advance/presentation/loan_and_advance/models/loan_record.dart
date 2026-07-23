import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';

enum LoanStatus { active, closed, overdue }

extension LoanStatusX on LoanStatus {
  String get label => switch (this) {
        LoanStatus.active => 'Active',
        LoanStatus.closed => 'Closed',
        LoanStatus.overdue => 'Overdue',
      };

  Color get color => switch (this) {
        LoanStatus.active => AppColors.creditGreen,
        LoanStatus.closed => AppColors.grey500,
        LoanStatus.overdue => AppColors.debitRed,
      };

  Color get bgColor => switch (this) {
        LoanStatus.active => AppColors.creditContainer,
        LoanStatus.closed => AppColors.grey50,
        LoanStatus.overdue => AppColors.debitContainer,
      };
}

class LoanRecord {
  final String type;
  final DateTime date;
  final DateTime endDate;
  final double principal;
  final LoanStatus status;
  final int tenureMonths;
  final double monthlyInstallment;
  final double totalPaid;

  const LoanRecord({
    required this.type,
    required this.date,
    required this.endDate,
    required this.principal,
    required this.status,
    required this.tenureMonths,
    required this.monthlyInstallment,
    required this.totalPaid,
  });

  double get remaining => (principal - totalPaid).clamp(0, principal);
  double get repaidFraction => (totalPaid / principal).clamp(0.0, 1.0);
}

final List<LoanRecord> dummyLoanRecords = [
  LoanRecord(
    type: 'Personal Loan',
    date: DateTime(2025, 8, 15),
    endDate: DateTime(2027, 8, 15),
    principal: 150000,
    status: LoanStatus.active,
    tenureMonths: 24,
    monthlyInstallment: 6875,
    totalPaid: 55000,
  ),
  LoanRecord(
    type: 'Emergency Advance',
    date: DateTime(2025, 3, 1),
    endDate: DateTime(2025, 9, 1),
    principal: 25000,
    status: LoanStatus.closed,
    tenureMonths: 6,
    monthlyInstallment: 4167,
    totalPaid: 25000,
  ),
  LoanRecord(
    type: 'Festival Advance',
    date: DateTime(2024, 12, 10),
    endDate: DateTime(2025, 3, 10),
    principal: 10000,
    status: LoanStatus.closed,
    tenureMonths: 3,
    monthlyInstallment: 3334,
    totalPaid: 10000,
  ),
  LoanRecord(
    type: 'Medical Advance',
    date: DateTime(2024, 9, 20),
    endDate: DateTime(2025, 9, 20),
    principal: 50000,
    status: LoanStatus.overdue,
    tenureMonths: 12,
    monthlyInstallment: 4167,
    totalPaid: 16668,
  ),
];
