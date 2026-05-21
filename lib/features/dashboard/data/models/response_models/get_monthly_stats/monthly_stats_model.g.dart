// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonthlyStatsModel _$MonthlyStatsModelFromJson(
  Map<String, dynamic> json,
) => _MonthlyStatsModel(
  currentMonthExpense: (json['CurrentMonthExpense'] as num).toDouble(),
  previousMonthExpense: (json['PreviousMonthExpense'] as num).toDouble(),
  expensePercentage: (json['ExpensePercentage'] as num).toDouble(),
  currentMonthSaleOrders: (json['CurrentMonthSaleOrders'] as num).toDouble(),
  previousMonthSaleOrders: (json['PreviousMonthSaleOrders'] as num).toDouble(),
  saleOrdersPercentage: (json['SaleOrdersPercentage'] as num).toDouble(),
  currentMonthParties: (json['CurrentMonthParties'] as num).toDouble(),
  previousMonthParties: (json['PreviousMonthParties'] as num).toDouble(),
  partiesPercentage: (json['PartiesPercentage'] as num).toDouble(),
  currentMonthSales: (json['CurrentMonthSales'] as num).toDouble(),
  previousMonthSales: (json['PreviousMonthSales'] as num).toDouble(),
  salesPercentage: (json['SalesPercentage'] as num).toDouble(),
  currentMonthPurchases: (json['CurrentMonthPurchases'] as num).toDouble(),
  previousMonthPurchases: (json['PreviousMonthPurchases'] as num).toDouble(),
  purchasesPercentage: (json['PurchasesPercentage'] as num).toDouble(),
  currentMonthRecoveries: (json['CurrentMonthRecoveries'] as num).toDouble(),
  previousMonthRecoveries: (json['PreviousMonthRecoveries'] as num).toDouble(),
  recoveriesPercentage: (json['RecoveriesPercentage'] as num).toDouble(),
  currentMonthPayables: (json['CurrentMonthPayables'] as num).toDouble(),
  previousMonthPayables: (json['PreviousMonthPayables'] as num).toDouble(),
  payablesPercentage: (json['PayablesPercentage'] as num).toDouble(),
  currentMonthReceivables: (json['CurrentMonthReceivables'] as num).toDouble(),
  previousMonthReceivables: (json['PreviousMonthReceivables'] as num)
      .toDouble(),
  receivablesPercentage: (json['ReceivablesPercentage'] as num).toDouble(),
  currentMonthInventoryTurnover: (json['CurrentMonthInventoryTurnover'] as num)
      .toDouble(),
  previousMonthInventoryTurnover:
      (json['PreviousMonthInventoryTurnover'] as num).toDouble(),
  inventoryTurnoverPercentage: (json['InventoryTurnoverPercentage'] as num)
      .toDouble(),
  currentMonthActiveParties: (json['CurrentMonthActiveParities'] as num)
      .toDouble(),
  previousMonthActiveParties: (json['PreviousMonthActiveParities'] as num)
      .toDouble(),
  activePartiesPercentage: (json['ActivePartiesPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$MonthlyStatsModelToJson(_MonthlyStatsModel instance) =>
    <String, dynamic>{
      'CurrentMonthExpense': instance.currentMonthExpense,
      'PreviousMonthExpense': instance.previousMonthExpense,
      'ExpensePercentage': instance.expensePercentage,
      'CurrentMonthSaleOrders': instance.currentMonthSaleOrders,
      'PreviousMonthSaleOrders': instance.previousMonthSaleOrders,
      'SaleOrdersPercentage': instance.saleOrdersPercentage,
      'CurrentMonthParties': instance.currentMonthParties,
      'PreviousMonthParties': instance.previousMonthParties,
      'PartiesPercentage': instance.partiesPercentage,
      'CurrentMonthSales': instance.currentMonthSales,
      'PreviousMonthSales': instance.previousMonthSales,
      'SalesPercentage': instance.salesPercentage,
      'CurrentMonthPurchases': instance.currentMonthPurchases,
      'PreviousMonthPurchases': instance.previousMonthPurchases,
      'PurchasesPercentage': instance.purchasesPercentage,
      'CurrentMonthRecoveries': instance.currentMonthRecoveries,
      'PreviousMonthRecoveries': instance.previousMonthRecoveries,
      'RecoveriesPercentage': instance.recoveriesPercentage,
      'CurrentMonthPayables': instance.currentMonthPayables,
      'PreviousMonthPayables': instance.previousMonthPayables,
      'PayablesPercentage': instance.payablesPercentage,
      'CurrentMonthReceivables': instance.currentMonthReceivables,
      'PreviousMonthReceivables': instance.previousMonthReceivables,
      'ReceivablesPercentage': instance.receivablesPercentage,
      'CurrentMonthInventoryTurnover': instance.currentMonthInventoryTurnover,
      'PreviousMonthInventoryTurnover': instance.previousMonthInventoryTurnover,
      'InventoryTurnoverPercentage': instance.inventoryTurnoverPercentage,
      'CurrentMonthActiveParities': instance.currentMonthActiveParties,
      'PreviousMonthActiveParities': instance.previousMonthActiveParties,
      'ActivePartiesPercentage': instance.activePartiesPercentage,
    };
