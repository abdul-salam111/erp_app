import 'package:equatable/equatable.dart';

class RevenueAndRecoverySummaryEntity extends Equatable {
  final String monthName;
  final int year;
  final int month;
  final double totalRevenueAmount;
  final double totalRecoveryAmount;

  const RevenueAndRecoverySummaryEntity({
    required this.monthName,
    required this.year,
    required this.month,
    required this.totalRevenueAmount,
    required this.totalRecoveryAmount,
  });

  @override
  List<Object?> get props => [
        monthName,
        year,
        month,
        totalRevenueAmount,
        totalRecoveryAmount,
      ];
}

class PartyRevenueAndRecoveryEntity extends Equatable {
  final double totalRevenueAmount;
  final double averageRecoveryAmount;
  final double averageRevenueAmount;
  final List<RevenueAndRecoverySummaryEntity> summaries;

  const PartyRevenueAndRecoveryEntity({
    required this.totalRevenueAmount,
    required this.averageRecoveryAmount,
    required this.averageRevenueAmount,
    required this.summaries,
  });

  @override
  List<Object?> get props => [
        totalRevenueAmount,
        averageRecoveryAmount,
        averageRevenueAmount,
        summaries,
      ];
}
