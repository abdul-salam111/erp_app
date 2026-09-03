import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../domain/entities/cost_item_entity.dart';
import '../../../domain/entities/product_template_entity.dart';
import '../../../domain/entities/production_entry_entity.dart';

class PartahState extends Equatable {
  final ApiStatus loadStatus;
  final ApiStatus saveStatus;
  final MillType? millType;
  final List<ProductTemplateEntity> productTemplates;
  final List<CostItemEntity> lastVariableCosts;
  final List<CostItemEntity> lastFixedCosts;
  final List<ProductionEntryEntity> lastProductionEntries;
  final String? errorMessage;
  final String? savedRecordId;

  const PartahState({
    this.loadStatus = ApiStatus.INITIAL,
    this.saveStatus = ApiStatus.INITIAL,
    this.millType,
    this.productTemplates = const [],
    this.lastVariableCosts = const [],
    this.lastFixedCosts = const [],
    this.lastProductionEntries = const [],
    this.errorMessage,
    this.savedRecordId,
  });

  /// True once the mill type has been chosen and at least one product
  /// template has been saved — the minimum needed for the calculator to work.
  bool get isSetupComplete => millType != null && productTemplates.isNotEmpty;

  PartahState copyWith({
    ApiStatus? loadStatus,
    ApiStatus? saveStatus,
    MillType? millType,
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
      millType: millType ?? this.millType,
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
        millType,
        productTemplates,
        lastVariableCosts,
        lastFixedCosts,
        lastProductionEntries,
        errorMessage,
        savedRecordId,
      ];
}
