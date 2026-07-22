class SalaryRecord {
  final DateTime month;
  final double netPay;
  final DateTime disbursed;

  const SalaryRecord({
    required this.month,
    required this.netPay,
    required this.disbursed,
  });
}

final List<SalaryRecord> dummySalaryRecords = [
  SalaryRecord(month: DateTime(2026, 5), netPay: 162400, disbursed: DateTime(2026, 6, 2)),
  SalaryRecord(month: DateTime(2026, 4), netPay: 162400, disbursed: DateTime(2026, 5, 2)),
  SalaryRecord(month: DateTime(2026, 3), netPay: 162400, disbursed: DateTime(2026, 4, 1)),
  SalaryRecord(month: DateTime(2026, 2), netPay: 158000, disbursed: DateTime(2026, 3, 1)),
  SalaryRecord(month: DateTime(2026, 1), netPay: 158000, disbursed: DateTime(2026, 2, 1)),
];
