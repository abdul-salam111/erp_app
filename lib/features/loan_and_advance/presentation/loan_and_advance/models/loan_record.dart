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
        LoanStatus.closed => const Color(0xFF6B7280),
        LoanStatus.overdue => AppColors.debitRed,
      };

  Color get bgColor => switch (this) {
        LoanStatus.active => const Color(0xFFECFDF5),
        LoanStatus.closed => const Color(0xFFF3F4F6),
        LoanStatus.overdue => const Color(0xFFFEF2F2),
      };
}

class LoanRecord {
  final String type;
  final DateTime date;
  final double principal;
  final LoanStatus status;

  const LoanRecord({
    required this.type,
    required this.date,
    required this.principal,
    required this.status,
  });
}

final List<LoanRecord> dummyLoanRecords = [
  LoanRecord(
    type: 'Personal Loan',
    date: DateTime(2025, 8, 15),
    principal: 150000,
    status: LoanStatus.active,
  ),
  LoanRecord(
    type: 'Emergency Advance',
    date: DateTime(2025, 3, 1),
    principal: 25000,
    status: LoanStatus.closed,
  ),
  LoanRecord(
    type: 'Festival Advance',
    date: DateTime(2024, 12, 10),
    principal: 10000,
    status: LoanStatus.closed,
  ),
  LoanRecord(
    type: 'Medical Advance',
    date: DateTime(2024, 9, 20),
    principal: 50000,
    status: LoanStatus.overdue,
  ),
];
