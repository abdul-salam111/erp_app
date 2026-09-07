class PartahCategoryProductEntity {
  final int itemId;
  final String itemName;
  final String? itemGroupName;
  final bool isAssigned;

  const PartahCategoryProductEntity({
    required this.itemId,
    required this.itemName,
    this.itemGroupName,
    required this.isAssigned,
  });

  PartahCategoryProductEntity copyWith({bool? isAssigned}) {
    return PartahCategoryProductEntity(
      itemId: itemId,
      itemName: itemName,
      itemGroupName: itemGroupName,
      isAssigned: isAssigned ?? this.isAssigned,
    );
  }
}
