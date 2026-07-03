import 'package:equatable/equatable.dart';

class PartyCreditMonthlySummaryEntity extends Equatable {
  final String monthName;
  final int year;
  final double totalAmount;
  final int month;

  const PartyCreditMonthlySummaryEntity({
    required this.monthName,
    required this.year,
    required this.totalAmount,
    required this.month,
  });

  @override
  List<Object?> get props => [monthName, year, totalAmount, month];
}
