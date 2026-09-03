class ProductTemplateEntity {
  final String name;
  final double bagSize; // e.g. 20.0 for "Maida 20Kg"

  const ProductTemplateEntity({
    required this.name,
    required this.bagSize,
  });

  String get displayName => '$name ${bagSize.toStringAsFixed(0)}Kg';
}
