import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/entities/cost_item_entity.dart';
import '../../../domain/entities/production_entry_entity.dart';

class PartahState extends Equatable {
  final ApiStatus loadStatus;
  final ApiStatus saveStatus;
  final List<ProductTemplateEntity> productTemplates;
  final List<CostItemEntity> lastVariableCosts;
  final List<CostItemEntity> lastFixedCosts;
  final List<ProductionEntryEntity> lastProductionEntries;
  final String? errorMessage;
  final String? savedRecordId;

  const PartahState({
    this.loadStatus = ApiStatus.INITIAL,
    this.saveStatus = ApiStatus.INITIAL,
    this.productTemplates = const [],
    this.lastVariableCosts = const [],
    this.lastFixedCosts = const [],
    this.lastProductionEntries = const [],
    this.errorMessage,
    this.savedRecordId,
  });

  PartahState copyWith({
    ApiStatus? loadStatus,
    ApiStatus? saveStatus,
    List<ProductTemplateEntity>? productTemplates,
    List<CostItemEntity>? lastVariableCosts,
    List<CostItemEntity>? lastFixedCosts,
    List<ProductionEntryEntity>? lastProductionEntries,
    String? errorMessage,
    String? savedRecordId,
  }) {
    return PartahState(
      loadStatus: loadStatus ?? this.loadStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      productTemplates: productTemplates ?? this.productTemplates,
      lastVariableCosts: lastVariableCosts ?? this.lastVariableCosts,
      lastFixedCosts: lastFixedCosts ?? this.lastFixedCosts,
      lastProductionEntries: lastProductionEntries ?? this.lastProductionEntries,
      errorMessage: errorMessage,
      savedRecordId: savedRecordId,
    );
  }

  @override
  List<Object?> get props => [
        loadStatus,
        saveStatus,
        productTemplates,
        lastVariableCosts,
        lastFixedCosts,
        lastProductionEntries,
        errorMessage,
        savedRecordId,
      ];
}
