import 'cost_item_entity.dart';

class PartahReportEntity {
  final DateTime? partaDate;
  final DateTime? periodFrom;
  final DateTime? periodTo;
  final PartahSummaryEntity summary;
  final PartahSalesSummaryEntity salesSummary;
  final PartahWheatCostEntity wheatCost;
  final PartahProductionEntity production;
  final PartahExpensesSummaryEntity expensesSummary;
  final List<PartahCategoryIndexEntity> categoryIndex;
  final String? rawMaterialCategoryName;
  final int totalConsumption100KgBags;

  const PartahReportEntity({
    this.partaDate,
    this.periodFrom,
    this.periodTo,
    required this.summary,
    required this.salesSummary,
    required this.wheatCost,
    required this.production,
    required this.expensesSummary,
    required this.categoryIndex,
    this.rawMaterialCategoryName,
    required this.totalConsumption100KgBags,
  });
}

class PartahSummaryEntity {
  final double totalRevenuePer100Kg;
  final double totalCostPer100Kg;
  final double profitPer100Kg;
  final double totalProfit;

  const PartahSummaryEntity({
    required this.totalRevenuePer100Kg,
    required this.totalCostPer100Kg,
    required this.profitPer100Kg,
    required this.totalProfit,
  });
}

class PartahSalesSummaryEntity {
  final double totalSaleAmount;
  final double totalWeightKg;
  final double saleRateIndexPer100Kg;

  const PartahSalesSummaryEntity({
    required this.totalSaleAmount,
    required this.totalWeightKg,
    required this.saleRateIndexPer100Kg,
  });
}

class PartahWheatCostEntity {
  final double quantity;
  final double rate;
  final double amount;

  const PartahWheatCostEntity({
    required this.quantity,
    required this.rate,
    required this.amount,
  });
}

class PartahProductionEntity {
  final double totalGrinding;
  final double gainPercent;

  const PartahProductionEntity({
    required this.totalGrinding,
    required this.gainPercent,
  });
}

class PartahExpensesSummaryEntity {
  final double variableTotal;
  final double fixedTotal;
  final double includedExpensesTotal;
  final List<CostItemEntity> costs;

  const PartahExpensesSummaryEntity({
    required this.variableTotal,
    required this.fixedTotal,
    required this.includedExpensesTotal,
    required this.costs,
  });
}

class PartahCategoryIndexEntity {
  final String categoryKey;
  final String displayName;
  final double qty;
  final double weightKg;
  final double amount;
  final double avgRatePerKg;
  final int standardBagKg;
  final double perBagRate;
  final double mixPercent;
  final double categoryParta;

  const PartahCategoryIndexEntity({
    required this.categoryKey,
    required this.displayName,
    required this.qty,
    required this.weightKg,
    required this.amount,
    required this.avgRatePerKg,
    required this.standardBagKg,
    required this.perBagRate,
    required this.mixPercent,
    required this.categoryParta,
  });
}
