import 'cost_item_entity.dart';
import 'production_entry_entity.dart';

class PartahRecordEntity {
  final String? id;
  final double purchasePrice;
  final double totalGrindingKg;
  final double gainPercentage;
  final double purchaseAmountPer100Kg;

  /// Raw bag weight the record was calculated on (flour 100, rice 40)
  final double baseWeightKg;
  final List<ProductionEntryEntity> productionEntries;
  final List<CostItemEntity> variableCosts;
  final List<CostItemEntity> fixedCosts;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PartahRecordEntity({
    this.id,
    required this.purchasePrice,
    required this.totalGrindingKg,
    required this.gainPercentage,
    required this.purchaseAmountPer100Kg,
    required this.baseWeightKg,
    required this.productionEntries,
    required this.variableCosts,
    required this.fixedCosts,
    required this.createdAt,
    required this.updatedAt,
  });

  PartahRecordEntity copyWith({String? id}) {
    return PartahRecordEntity(
      id: id ?? this.id,
      purchasePrice: purchasePrice,
      totalGrindingKg: totalGrindingKg,
      gainPercentage: gainPercentage,
      purchaseAmountPer100Kg: purchaseAmountPer100Kg,
      baseWeightKg: baseWeightKg,
      productionEntries: productionEntries,
      variableCosts: variableCosts,
      fixedCosts: fixedCosts,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // ── Calculated fields ──────────────────────────────────────────────────────

  /// Total sale price per base bag = sum of all production entry amounts
  /// computed against this record's base weight
  double get salePricePer100Kg =>
      productionEntries.fold(0, (sum, e) => sum + e.amountFor(baseWeightKg));

  /// Total yield percentage — must equal 100
  double get totalPercentage => productionEntries.fold(0, (sum, e) => sum + e.percentage);

  /// Gain Amount = Purchase Price × Gain%/100
  double get gainAmount => purchasePrice * gainPercentage / 100;

  /// Gross Profit = (Sale Price + Gain) / 100Kg − Wheat Cost / 100Kg
  double get grossProfit =>
      salePricePer100Kg + gainAmount - (purchaseAmountPer100Kg > 0 ? purchaseAmountPer100Kg : purchasePrice);

  /// Total Variable Cost per 100 Kg
  double get totalVariableCostPer100Kg => variableCosts.fold(0, (sum, c) => sum + c.amount);

  /// Total Fixed Cost per 100 Kg
  double get totalFixedCostPer100Kg => fixedCosts.fold(0.0, (sum, c) => sum + c.amount);

  /// Profit per 100 Kg = Gross Profit − Variable Cost − Fixed Cost
  double get profitPer100Kg => grossProfit - totalVariableCostPer100Kg - totalFixedCostPer100Kg;

  /// Number of base bags ground (totalGrindingKg expressed in bags)
  double get grindingBags => totalGrindingKg / (baseWeightKg > 0 ? baseWeightKg : 100);

  /// Net Profit = Profit per base bag × number of base bags ground
  double get netProfit => profitPer100Kg * totalGrindingKg / (baseWeightKg > 0 ? baseWeightKg : 100);

  bool get isProfit => netProfit >= 0;
}
