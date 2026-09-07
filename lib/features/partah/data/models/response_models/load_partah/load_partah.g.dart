// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_partah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoadPartah _$LoadPartahFromJson(Map<String, dynamic> json) => _LoadPartah(
  partaDate: json['PartaDate'] == null
      ? null
      : DateTime.parse(json['PartaDate'] as String),
  basePeriod: json['BasePeriod'] == null
      ? null
      : BasePeriod.fromJson(json['BasePeriod'] as Map<String, dynamic>),
  summary: json['Summary'] == null
      ? null
      : Summary.fromJson(json['Summary'] as Map<String, dynamic>),
  salesSummary: json['SalesSummary'] == null
      ? null
      : SalesSummary.fromJson(json['SalesSummary'] as Map<String, dynamic>),
  wheatCost: json['WheatCost'] == null
      ? null
      : WheatCost.fromJson(json['WheatCost'] as Map<String, dynamic>),
  production: json['Production'] == null
      ? null
      : Production.fromJson(json['Production'] as Map<String, dynamic>),
  expensesSummary: json['ExpensesSummary'] == null
      ? null
      : ExpensesSummary.fromJson(
          json['ExpensesSummary'] as Map<String, dynamic>,
        ),
  detailTabs: json['DetailTabs'] == null
      ? null
      : DetailTabs.fromJson(json['DetailTabs'] as Map<String, dynamic>),
  categoryPartaIndex: (json['CategoryPartaIndex'] as List<dynamic>?)
      ?.map((e) => CategoryPartaIndex.fromJson(e as Map<String, dynamic>))
      .toList(),
  unmappedItemWarnings: json['UnmappedItemWarnings'] as List<dynamic>?,
  rawMaterialCategoryName: json['RawMaterialCategoryName'] as String?,
  totalConsumption100KgBags: (json['TotalConsumption100KgBags'] as num?)
      ?.toInt(),
);

Map<String, dynamic> _$LoadPartahToJson(_LoadPartah instance) =>
    <String, dynamic>{
      'PartaDate': instance.partaDate?.toIso8601String(),
      'BasePeriod': instance.basePeriod,
      'Summary': instance.summary,
      'SalesSummary': instance.salesSummary,
      'WheatCost': instance.wheatCost,
      'Production': instance.production,
      'ExpensesSummary': instance.expensesSummary,
      'DetailTabs': instance.detailTabs,
      'CategoryPartaIndex': instance.categoryPartaIndex,
      'UnmappedItemWarnings': instance.unmappedItemWarnings,
      'RawMaterialCategoryName': instance.rawMaterialCategoryName,
      'TotalConsumption100KgBags': instance.totalConsumption100KgBags,
    };

_BasePeriod _$BasePeriodFromJson(Map<String, dynamic> json) => _BasePeriod(
  from: json['From'] == null ? null : DateTime.parse(json['From'] as String),
  to: json['To'] == null ? null : DateTime.parse(json['To'] as String),
);

Map<String, dynamic> _$BasePeriodToJson(_BasePeriod instance) =>
    <String, dynamic>{
      'From': instance.from?.toIso8601String(),
      'To': instance.to?.toIso8601String(),
    };

_CategoryPartaIndex _$CategoryPartaIndexFromJson(Map<String, dynamic> json) =>
    _CategoryPartaIndex(
      categoryKey: json['CategoryKey'] as String?,
      displayName: json['DisplayName'] as String?,
      qty: (json['Qty'] as num?)?.toInt(),
      weightKg: (json['WeightKg'] as num?)?.toInt(),
      amount: (json['Amount'] as num?)?.toInt(),
      avgRatePerKg: (json['AvgRatePerKg'] as num?)?.toInt(),
      standardBagKg: (json['StandardBagKg'] as num?)?.toInt(),
      perBagRate: (json['PerBagRate'] as num?)?.toInt(),
      mixPercent: (json['MixPercent'] as num?)?.toInt(),
      categoryParta: (json['CategoryParta'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryPartaIndexToJson(_CategoryPartaIndex instance) =>
    <String, dynamic>{
      'CategoryKey': instance.categoryKey,
      'DisplayName': instance.displayName,
      'Qty': instance.qty,
      'WeightKg': instance.weightKg,
      'Amount': instance.amount,
      'AvgRatePerKg': instance.avgRatePerKg,
      'StandardBagKg': instance.standardBagKg,
      'PerBagRate': instance.perBagRate,
      'MixPercent': instance.mixPercent,
      'CategoryParta': instance.categoryParta,
    };

_DetailTabs _$DetailTabsFromJson(Map<String, dynamic> json) => _DetailTabs(
  sale: json['Sale'] as List<dynamic>?,
  purchase: json['Purchase'] as List<dynamic>?,
  production: json['Production'] as List<dynamic>?,
  expenses: (json['Expenses'] as List<dynamic>?)
      ?.map((e) => Expense.fromJson(e as Map<String, dynamic>))
      .toList(),
  consumption: json['Consumption'] as List<dynamic>?,
);

Map<String, dynamic> _$DetailTabsToJson(_DetailTabs instance) =>
    <String, dynamic>{
      'Sale': instance.sale,
      'Purchase': instance.purchase,
      'Production': instance.production,
      'Expenses': instance.expenses,
      'Consumption': instance.consumption,
    };

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  accountId: (json['AccountId'] as num?)?.toInt(),
  accountName: json['AccountName'] as String?,
  amount: (json['Amount'] as num?)?.toInt(),
  isFixedCost: json['IsFixedCost'] as bool?,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'AccountId': instance.accountId,
  'AccountName': instance.accountName,
  'Amount': instance.amount,
  'IsFixedCost': instance.isFixedCost,
};

_ExpensesSummary _$ExpensesSummaryFromJson(Map<String, dynamic> json) =>
    _ExpensesSummary(
      variableTotal: (json['VariableTotal'] as num?)?.toInt(),
      fixedTotal: (json['FixedTotal'] as num?)?.toInt(),
      variableCosts: (json['VariableCosts'] as List<dynamic>?)
          ?.map((e) => VariableCost.fromJson(e as Map<String, dynamic>))
          .toList(),
      fixedCosts: json['FixedCosts'] as List<dynamic>?,
      includedExpensesTotal: (json['IncludedExpensesTotal'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExpensesSummaryToJson(_ExpensesSummary instance) =>
    <String, dynamic>{
      'VariableTotal': instance.variableTotal,
      'FixedTotal': instance.fixedTotal,
      'VariableCosts': instance.variableCosts,
      'FixedCosts': instance.fixedCosts,
      'IncludedExpensesTotal': instance.includedExpensesTotal,
    };

_VariableCost _$VariableCostFromJson(Map<String, dynamic> json) =>
    _VariableCost(
      name: json['Name'] as String?,
      amount: (json['Amount'] as num?)?.toInt(),
      isFixedCost: json['IsFixedCost'] as bool?,
    );

Map<String, dynamic> _$VariableCostToJson(_VariableCost instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Amount': instance.amount,
      'IsFixedCost': instance.isFixedCost,
    };

_Production _$ProductionFromJson(Map<String, dynamic> json) => _Production(
  categories: json['Categories'] as List<dynamic>?,
  totalGrinding: (json['TotalGrinding'] as num?)?.toInt(),
  gainPercent: (json['GainPercent'] as num?)?.toInt(),
  productionYields: json['ProductionYields'] as List<dynamic>?,
);

Map<String, dynamic> _$ProductionToJson(_Production instance) =>
    <String, dynamic>{
      'Categories': instance.categories,
      'TotalGrinding': instance.totalGrinding,
      'GainPercent': instance.gainPercent,
      'ProductionYields': instance.productionYields,
    };

_SalesSummary _$SalesSummaryFromJson(Map<String, dynamic> json) =>
    _SalesSummary(
      categories: json['Categories'] as List<dynamic>?,
      totalSaleAmount: (json['TotalSaleAmount'] as num?)?.toInt(),
      totalWeightKg: (json['TotalWeightKg'] as num?)?.toInt(),
      saleRateIndexPer100Kg: (json['SaleRateIndexPer100Kg'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SalesSummaryToJson(_SalesSummary instance) =>
    <String, dynamic>{
      'Categories': instance.categories,
      'TotalSaleAmount': instance.totalSaleAmount,
      'TotalWeightKg': instance.totalWeightKg,
      'SaleRateIndexPer100Kg': instance.saleRateIndexPer100Kg,
    };

_Summary _$SummaryFromJson(Map<String, dynamic> json) => _Summary(
  totalRevenuePer100Kg: (json['TotalRevenuePer100Kg'] as num?)?.toInt(),
  totalCostPer100Kg: (json['TotalCostPer100Kg'] as num?)?.toInt(),
  profitPer100Kg: (json['ProfitPer100Kg'] as num?)?.toInt(),
  totalProfit: (json['TotalProfit'] as num?)?.toInt(),
);

Map<String, dynamic> _$SummaryToJson(_Summary instance) => <String, dynamic>{
  'TotalRevenuePer100Kg': instance.totalRevenuePer100Kg,
  'TotalCostPer100Kg': instance.totalCostPer100Kg,
  'ProfitPer100Kg': instance.profitPer100Kg,
  'TotalProfit': instance.totalProfit,
};

_WheatCost _$WheatCostFromJson(Map<String, dynamic> json) => _WheatCost(
  quantity: (json['Quantity'] as num?)?.toInt(),
  rate: (json['Rate'] as num?)?.toInt(),
  amount: (json['Amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$WheatCostToJson(_WheatCost instance) =>
    <String, dynamic>{
      'Quantity': instance.quantity,
      'Rate': instance.rate,
      'Amount': instance.amount,
    };
