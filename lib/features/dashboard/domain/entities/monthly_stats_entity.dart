import 'package:equatable/equatable.dart';

class MonthlyStatsEntity extends Equatable {
  final double currentMonthExpense;
  final double expensePercentage;

  final double currentMonthSaleOrders;
  final double saleOrdersPercentage;

  final double currentMonthParties;
  final double partiesPercentage;

  final double currentMonthSales;
  final double salesPercentage;

  final double currentMonthPurchases;
  final double purchasesPercentage;

  final double currentMonthRecoveries;
  final double recoveriesPercentage;

  const MonthlyStatsEntity({
    required this.currentMonthExpense,
    required this.expensePercentage,
    required this.currentMonthSaleOrders,
    required this.saleOrdersPercentage,
    required this.currentMonthParties,
    required this.partiesPercentage,
    required this.currentMonthSales,
    required this.salesPercentage,
    required this.currentMonthPurchases,
    required this.purchasesPercentage,
    required this.currentMonthRecoveries,
    required this.recoveriesPercentage,
  });

  @override
  List<Object?> get props => [
    currentMonthExpense, expensePercentage,
    currentMonthSaleOrders, saleOrdersPercentage,
    currentMonthParties, partiesPercentage,
    currentMonthSales, salesPercentage,
    currentMonthPurchases, purchasesPercentage,
    currentMonthRecoveries, recoveriesPercentage,
  ];
}
