import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../domain/entities/partah_category_entity.dart';

class PartahState extends Equatable {
  final ApiStatus loadStatus;
  final MillType? millType;
  final List<PartahCategoryEntity> categories;
  final String? errorMessage;

  const PartahState({
    this.loadStatus = ApiStatus.INITIAL,
    this.millType,
    this.categories = const [],
    this.errorMessage,
  });

  /// Output categories — the Revenue rows in the calculator. Raw-material
  /// categories (e.g. Wheat) aren't sold, so they're excluded here.
  List<PartahCategoryEntity> get outputCategories =>
      categories.where((c) => !c.isRawMaterial).toList();

  /// True once the mill type has been chosen and at least one output
  /// category exists — the minimum needed for the calculator to work.
  bool get isSetupComplete => millType != null && outputCategories.isNotEmpty;

  PartahState copyWith({
    ApiStatus? loadStatus,
    MillType? millType,
    List<PartahCategoryEntity>? categories,
    String? errorMessage,
  }) {
    return PartahState(
      loadStatus: loadStatus ?? this.loadStatus,
      millType: millType ?? this.millType,
      categories: categories ?? this.categories,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [loadStatus, millType, categories, errorMessage];
}
