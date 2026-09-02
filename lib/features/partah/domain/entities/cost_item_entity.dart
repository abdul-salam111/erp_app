enum CostType { variable, fixed }

class CostItemEntity {
  final String description;
  final double amount;
  final CostType type;

  const CostItemEntity({
    required this.description,
    required this.amount,
    required this.type,
  });
}
