import '../../../../domain/entities/monthly_stats_entity.dart';
import 'monthly_stats_model.dart';

extension MonthlyStatsModelMapper on MonthlyStatsModel {
  MonthlyStatsEntity toEntity() => MonthlyStatsEntity(
    currentMonthExpense:    currentMonthExpense,
    expensePercentage:      expensePercentage,
    currentMonthSaleOrders: currentMonthSaleOrders,
    saleOrdersPercentage:   saleOrdersPercentage,
    currentMonthParties:    currentMonthParties,
    partiesPercentage:      partiesPercentage,
    currentMonthSales:      currentMonthSales,
    salesPercentage:        salesPercentage,
    currentMonthPurchases:  currentMonthPurchases,
    purchasesPercentage:    purchasesPercentage,
    currentMonthRecoveries: currentMonthRecoveries,
    recoveriesPercentage:   recoveriesPercentage,
  );
}
