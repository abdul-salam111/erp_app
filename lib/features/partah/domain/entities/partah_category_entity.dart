class PartahCategoryEntity {
  final int? id;
  final String categoryKey;
  final String displayName;
  final int standardBagKg;
  final int sortOrder;
  final bool isActive;
  final bool isRawMaterial;
  final int itemCount;
  final bool archived;

  const PartahCategoryEntity({
    this.id,
    required this.categoryKey,
    required this.displayName,
    required this.standardBagKg,
    required this.sortOrder,
    required this.isActive,
    required this.isRawMaterial,
    required this.itemCount,
    required this.archived,
  });

  PartahCategoryEntity copyWith({
    int? id,
    String? categoryKey,
    String? displayName,
    int? standardBagKg,
    int? sortOrder,
    bool? isActive,
    bool? isRawMaterial,
    int? itemCount,
    bool? archived,
  }) {
    return PartahCategoryEntity(
      id: id ?? this.id,
      categoryKey: categoryKey ?? this.categoryKey,
      displayName: displayName ?? this.displayName,
      standardBagKg: standardBagKg ?? this.standardBagKg,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      isRawMaterial: isRawMaterial ?? this.isRawMaterial,
      itemCount: itemCount ?? this.itemCount,
      archived: archived ?? this.archived,
    );
  }
}
