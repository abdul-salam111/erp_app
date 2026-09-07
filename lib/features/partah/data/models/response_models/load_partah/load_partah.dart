import 'package:freezed_annotation/freezed_annotation.dart';
part 'load_partah.freezed.dart';
part 'load_partah.g.dart';

@freezed
abstract class LoadPartah with _$LoadPartah {
    const factory LoadPartah({
        @JsonKey(name: "PartaDate")
        DateTime? partaDate,
        @JsonKey(name: "BasePeriod")
        BasePeriod? basePeriod,
        @JsonKey(name: "Summary")
        Summary? summary,
        @JsonKey(name: "SalesSummary")
        SalesSummary? salesSummary,
        @JsonKey(name: "WheatCost")
        WheatCost? wheatCost,
        @JsonKey(name: "Production")
        Production? production,
        @JsonKey(name: "ExpensesSummary")
        ExpensesSummary? expensesSummary,
        @JsonKey(name: "DetailTabs")
        DetailTabs? detailTabs,
        @JsonKey(name: "CategoryPartaIndex")
        List<CategoryPartaIndex>? categoryPartaIndex,
        @JsonKey(name: "UnmappedItemWarnings")
        List<dynamic>? unmappedItemWarnings,
        @JsonKey(name: "RawMaterialCategoryName")
        String? rawMaterialCategoryName,
        @JsonKey(name: "TotalConsumption100KgBags")
        int? totalConsumption100KgBags,
    }) = _LoadPartah;

    factory LoadPartah.fromJson(Map<String, dynamic> json) =>
        _$LoadPartahFromJson(json);
}

@freezed
abstract class BasePeriod with _$BasePeriod {
    const factory BasePeriod({
        @JsonKey(name: "From")
        DateTime? from,
        @JsonKey(name: "To")
        DateTime? to,
    }) = _BasePeriod;

    factory BasePeriod.fromJson(Map<String, dynamic> json) =>
        _$BasePeriodFromJson(json);
}

@freezed
abstract class CategoryPartaIndex with _$CategoryPartaIndex {
    const factory CategoryPartaIndex({
        @JsonKey(name: "CategoryKey")
        String? categoryKey,
        @JsonKey(name: "DisplayName")
        String? displayName,
        @JsonKey(name: "Qty")
        int? qty,
        @JsonKey(name: "WeightKg")
        int? weightKg,
        @JsonKey(name: "Amount")
        int? amount,
        @JsonKey(name: "AvgRatePerKg")
        int? avgRatePerKg,
        @JsonKey(name: "StandardBagKg")
        int? standardBagKg,
        @JsonKey(name: "PerBagRate")
        int? perBagRate,
        @JsonKey(name: "MixPercent")
        int? mixPercent,
        @JsonKey(name: "CategoryParta")
        int? categoryParta,
    }) = _CategoryPartaIndex;

    factory CategoryPartaIndex.fromJson(Map<String, dynamic> json) =>
        _$CategoryPartaIndexFromJson(json);
}

@freezed
abstract class DetailTabs with _$DetailTabs {
    const factory DetailTabs({
        @JsonKey(name: "Sale")
        List<dynamic>? sale,
        @JsonKey(name: "Purchase")
        List<dynamic>? purchase,
        @JsonKey(name: "Production")
        List<dynamic>? production,
        @JsonKey(name: "Expenses")
        List<Expense>? expenses,
        @JsonKey(name: "Consumption")
        List<dynamic>? consumption,
    }) = _DetailTabs;

    factory DetailTabs.fromJson(Map<String, dynamic> json) =>
        _$DetailTabsFromJson(json);
}

@freezed
abstract class Expense with _$Expense {
    const factory Expense({
        @JsonKey(name: "AccountId")
        int? accountId,
        @JsonKey(name: "AccountName")
        String? accountName,
        @JsonKey(name: "Amount")
        int? amount,
        @JsonKey(name: "IsFixedCost")
        bool? isFixedCost,
    }) = _Expense;

    factory Expense.fromJson(Map<String, dynamic> json) =>
        _$ExpenseFromJson(json);
}

@freezed
abstract class ExpensesSummary with _$ExpensesSummary {
    const factory ExpensesSummary({
        @JsonKey(name: "VariableTotal")
        int? variableTotal,
        @JsonKey(name: "FixedTotal")
        int? fixedTotal,
        @JsonKey(name: "VariableCosts")
        List<VariableCost>? variableCosts,
        @JsonKey(name: "FixedCosts")
        List<dynamic>? fixedCosts,
        @JsonKey(name: "IncludedExpensesTotal")
        int? includedExpensesTotal,
    }) = _ExpensesSummary;

    factory ExpensesSummary.fromJson(Map<String, dynamic> json) =>
        _$ExpensesSummaryFromJson(json);
}

@freezed
abstract class VariableCost with _$VariableCost {
    const factory VariableCost({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Amount")
        int? amount,
        @JsonKey(name: "IsFixedCost")
        bool? isFixedCost,
    }) = _VariableCost;

    factory VariableCost.fromJson(Map<String, dynamic> json) =>
        _$VariableCostFromJson(json);
}

@freezed
abstract class Production with _$Production {
    const factory Production({
        @JsonKey(name: "Categories")
        List<dynamic>? categories,
        @JsonKey(name: "TotalGrinding")
        int? totalGrinding,
        @JsonKey(name: "GainPercent")
        int? gainPercent,
        @JsonKey(name: "ProductionYields")
        List<dynamic>? productionYields,
    }) = _Production;

    factory Production.fromJson(Map<String, dynamic> json) =>
        _$ProductionFromJson(json);
}

@freezed
abstract class SalesSummary with _$SalesSummary {
    const factory SalesSummary({
        @JsonKey(name: "Categories")
        List<dynamic>? categories,
        @JsonKey(name: "TotalSaleAmount")
        int? totalSaleAmount,
        @JsonKey(name: "TotalWeightKg")
        int? totalWeightKg,
        @JsonKey(name: "SaleRateIndexPer100Kg")
        int? saleRateIndexPer100Kg,
    }) = _SalesSummary;

    factory SalesSummary.fromJson(Map<String, dynamic> json) =>
        _$SalesSummaryFromJson(json);
}

@freezed
abstract class Summary with _$Summary {
    const factory Summary({
        @JsonKey(name: "TotalRevenuePer100Kg")
        int? totalRevenuePer100Kg,
        @JsonKey(name: "TotalCostPer100Kg")
        int? totalCostPer100Kg,
        @JsonKey(name: "ProfitPer100Kg")
        int? profitPer100Kg,
        @JsonKey(name: "TotalProfit")
        int? totalProfit,
    }) = _Summary;

    factory Summary.fromJson(Map<String, dynamic> json) =>
        _$SummaryFromJson(json);
}

@freezed
abstract class WheatCost with _$WheatCost {
    const factory WheatCost({
        @JsonKey(name: "Quantity")
        int? quantity,
        @JsonKey(name: "Rate")
        int? rate,
        @JsonKey(name: "Amount")
        int? amount,
    }) = _WheatCost;

    factory WheatCost.fromJson(Map<String, dynamic> json) =>
        _$WheatCostFromJson(json);
}
