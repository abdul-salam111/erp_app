import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_stats_model.freezed.dart';
part 'monthly_stats_model.g.dart';

@freezed
abstract class MonthlyStatsModel with _$MonthlyStatsModel {
  const factory MonthlyStatsModel({
    @JsonKey(name: 'CurrentMonthExpense') required double currentMonthExpense,
    @JsonKey(name: 'PreviousMonthExpense') required double previousMonthExpense,
    @JsonKey(name: 'ExpensePercentage') required double expensePercentage,

    @JsonKey(name: 'CurrentMonthSaleOrders') required double currentMonthSaleOrders,
    @JsonKey(name: 'PreviousMonthSaleOrders') required double previousMonthSaleOrders,
    @JsonKey(name: 'SaleOrdersPercentage') required double saleOrdersPercentage,

    @JsonKey(name: 'CurrentMonthParties') required double currentMonthParties,
    @JsonKey(name: 'PreviousMonthParties') required double previousMonthParties,
    @JsonKey(name: 'PartiesPercentage') required double partiesPercentage,

    @JsonKey(name: 'CurrentMonthSales') required double currentMonthSales,
    @JsonKey(name: 'PreviousMonthSales') required double previousMonthSales,
    @JsonKey(name: 'SalesPercentage') required double salesPercentage,

    @JsonKey(name: 'CurrentMonthPurchases') required double currentMonthPurchases,
    @JsonKey(name: 'PreviousMonthPurchases') required double previousMonthPurchases,
    @JsonKey(name: 'PurchasesPercentage') required double purchasesPercentage,

    @JsonKey(name: 'CurrentMonthRecoveries') required double currentMonthRecoveries,
    @JsonKey(name: 'PreviousMonthRecoveries') required double previousMonthRecoveries,
    @JsonKey(name: 'RecoveriesPercentage') required double recoveriesPercentage,

    @JsonKey(name: 'CurrentMonthPayables') required double currentMonthPayables,
    @JsonKey(name: 'PreviousMonthPayables') required double previousMonthPayables,
    @JsonKey(name: 'PayablesPercentage') required double payablesPercentage,

    @JsonKey(name: 'CurrentMonthReceivables') required double currentMonthReceivables,
    @JsonKey(name: 'PreviousMonthReceivables') required double previousMonthReceivables,
    @JsonKey(name: 'ReceivablesPercentage') required double receivablesPercentage,

    @JsonKey(name: 'CurrentMonthInventoryTurnover') required double currentMonthInventoryTurnover,
    @JsonKey(name: 'PreviousMonthInventoryTurnover') required double previousMonthInventoryTurnover,
    @JsonKey(name: 'InventoryTurnoverPercentage') required double inventoryTurnoverPercentage,

    @JsonKey(name: 'CurrentMonthActiveParities') required double currentMonthActiveParties,
    @JsonKey(name: 'PreviousMonthActiveParities') required double previousMonthActiveParties,
    @JsonKey(name: 'ActivePartiesPercentage') required double activePartiesPercentage,
  }) = _MonthlyStatsModel;

  factory MonthlyStatsModel.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatsModelFromJson(json);
}