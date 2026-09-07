import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/partah_category_entity.dart';

class PartahCategoriesState extends Equatable {
  final ApiStatus loadStatus;
  final List<PartahCategoryEntity> categories;
  final int unassignedCount;
  final String? errorMessage;

  const PartahCategoriesState({
    this.loadStatus = ApiStatus.INITIAL,
    this.categories = const [],
    this.unassignedCount = 0,
    this.errorMessage,
  });

  PartahCategoriesState copyWith({
    ApiStatus? loadStatus,
    List<PartahCategoryEntity>? categories,
    int? unassignedCount,
    String? errorMessage,
  }) {
    return PartahCategoriesState(
      loadStatus: loadStatus ?? this.loadStatus,
      categories: categories ?? this.categories,
      unassignedCount: unassignedCount ?? this.unassignedCount,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [loadStatus, categories, unassignedCount, errorMessage];
}
