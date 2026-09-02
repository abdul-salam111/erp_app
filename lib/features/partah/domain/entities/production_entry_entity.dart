class ProductionEntryEntity {
  final String productName;
  final double bagSize;
  final double percentage;
  final double rate;

  const ProductionEntryEntity({
    required this.productName,
    required this.bagSize,
    required this.percentage,
    required this.rate,
  });

  // Sale amount for [baseWeightKg] of raw input:
  //   ratePerKg × producedKg = (rate / bagSize) × (percentage / 100) × baseWeightKg
  // e.g. rate=2500, bagSize=20, percentage=70, base=100 → 125 × 70 = Rs 8,750
  double amountFor(double baseWeightKg) => (rate / bagSize) * (percentage / 100) * baseWeightKg;

  String get displayName => '$productName ${bagSize.toStringAsFixed(0)}Kg';
}
