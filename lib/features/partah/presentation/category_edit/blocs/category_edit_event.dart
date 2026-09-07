import 'package:equatable/equatable.dart';
import '../../../domain/entities/partah_category_entity.dart';

abstract class CategoryEditEvent extends Equatable {
  const CategoryEditEvent();

  @override
  List<Object?> get props => [];
}

class CategoryEditStarted extends CategoryEditEvent {
  final PartahCategoryEntity? initial;
  const CategoryEditStarted(this.initial);

  @override
  List<Object?> get props => [initial];
}

class CategoryEditNameChanged extends CategoryEditEvent {
  final String name;
  const CategoryEditNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class CategoryEditRawMaterialToggled extends CategoryEditEvent {
  final bool isRawMaterial;
  const CategoryEditRawMaterialToggled(this.isRawMaterial);

  @override
  List<Object?> get props => [isRawMaterial];
}

class CategoryEditBagWeightChanged extends CategoryEditEvent {
  final int standardBagKg;
  const CategoryEditBagWeightChanged(this.standardBagKg);

  @override
  List<Object?> get props => [standardBagKg];
}

class CategoryEditSearchChanged extends CategoryEditEvent {
  final String query;
  const CategoryEditSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class CategoryEditProductToggled extends CategoryEditEvent {
  final int itemId;
  const CategoryEditProductToggled(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class CategoryEditSaveRequested extends CategoryEditEvent {
  const CategoryEditSaveRequested();
}
