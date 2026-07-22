class SalaryLineItem {
  final String label;
  final double amount;
  const SalaryLineItem({required this.label, required this.amount});
}

class SalaryRecord {
  final DateTime month;
  final double grossPay;
  final double netPay;
  final DateTime disbursed;
  final List<SalaryLineItem> earnings;
  final List<SalaryLineItem> deductions;

  const SalaryRecord({
    required this.month,
    required this.grossPay,
    required this.netPay,
    required this.disbursed,
    this.earnings = const [],
    this.deductions = const [],
  });

  double get totalDeductions => deductions.fold(0.0, (s, d) => s + d.amount);
}

final List<SalaryRecord> dummySalaryRecords = [
  SalaryRecord(
    month: DateTime(2026, 5),
    grossPay: 185000,
    netPay: 162400,
    disbursed: DateTime(2026, 6, 2),
    earnings: const [
      SalaryLineItem(label: 'Basic Salary', amount: 120000),
      SalaryLineItem(label: 'Housing Allowance', amount: 30000),
      SalaryLineItem(label: 'Transport Allowance', amount: 15000),
      SalaryLineItem(label: 'Medical Allowance', amount: 10000),
      SalaryLineItem(label: 'Overtime', amount: 10000),
    ],
    deductions: const [
      SalaryLineItem(label: 'Income Tax', amount: 15000),
      SalaryLineItem(label: 'EOBI', amount: 1600),
      SalaryLineItem(label: 'Loan Deduction', amount: 6000),
    ],
  ),
  SalaryRecord(
    month: DateTime(2026, 4),
    grossPay: 185000,
    netPay: 162400,
    disbursed: DateTime(2026, 5, 2),
    earnings: const [
      SalaryLineItem(label: 'Basic Salary', amount: 120000),
      SalaryLineItem(label: 'Housing Allowance', amount: 30000),
      SalaryLineItem(label: 'Transport Allowance', amount: 15000),
      SalaryLineItem(label: 'Medical Allowance', amount: 10000),
      SalaryLineItem(label: 'Overtime', amount: 10000),
    ],
    deductions: const [
      SalaryLineItem(label: 'Income Tax', amount: 15000),
      SalaryLineItem(label: 'EOBI', amount: 1600),
      SalaryLineItem(label: 'Loan Deduction', amount: 6000),
    ],
  ),
  SalaryRecord(
    month: DateTime(2026, 3),
    grossPay: 185000,
    netPay: 162400,
    disbursed: DateTime(2026, 4, 1),
    earnings: const [
      SalaryLineItem(label: 'Basic Salary', amount: 120000),
      SalaryLineItem(label: 'Housing Allowance', amount: 30000),
      SalaryLineItem(label: 'Transport Allowance', amount: 15000),
      SalaryLineItem(label: 'Medical Allowance', amount: 10000),
      SalaryLineItem(label: 'Overtime', amount: 10000),
    ],
    deductions: const [
      SalaryLineItem(label: 'Income Tax', amount: 15000),
      SalaryLineItem(label: 'EOBI', amount: 1600),
      SalaryLineItem(label: 'Loan Deduction', amount: 6000),
    ],
  ),
  SalaryRecord(
    month: DateTime(2026, 2),
    grossPay: 180000,
    netPay: 158000,
    disbursed: DateTime(2026, 3, 1),
    earnings: const [
      SalaryLineItem(label: 'Basic Salary', amount: 120000),
      SalaryLineItem(label: 'Housing Allowance', amount: 30000),
      SalaryLineItem(label: 'Transport Allowance', amount: 15000),
      SalaryLineItem(label: 'Medical Allowance', amount: 10000),
      SalaryLineItem(label: 'Overtime', amount: 5000),
    ],
    deductions: const [
      SalaryLineItem(label: 'Income Tax', amount: 15000),
      SalaryLineItem(label: 'EOBI', amount: 1600),
      SalaryLineItem(label: 'Loan Deduction', amount: 5400),
    ],
  ),
  SalaryRecord(
    month: DateTime(2026, 1),
    grossPay: 180000,
    netPay: 158000,
    disbursed: DateTime(2026, 2, 1),
    earnings: const [
      SalaryLineItem(label: 'Basic Salary', amount: 120000),
      SalaryLineItem(label: 'Housing Allowance', amount: 30000),
      SalaryLineItem(label: 'Transport Allowance', amount: 15000),
      SalaryLineItem(label: 'Medical Allowance', amount: 10000),
      SalaryLineItem(label: 'Overtime', amount: 5000),
    ],
    deductions: const [
      SalaryLineItem(label: 'Income Tax', amount: 15000),
      SalaryLineItem(label: 'EOBI', amount: 1600),
      SalaryLineItem(label: 'Loan Deduction', amount: 5400),
    ],
  ),
];
