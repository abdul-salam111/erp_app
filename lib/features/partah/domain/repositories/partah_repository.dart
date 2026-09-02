import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/cost_item_entity.dart';
import '../entities/partah_record_entity.dart';
import '../entities/production_entry_entity.dart';

abstract interface class PartahRepository {
  Future<Result<List<ProductTemplateEntity>>> getProductTemplates();

  Future<Result<void>> saveProductTemplates(List<ProductTemplateEntity> templates);

  Future<Result<String>> saveRecord(PartahRecordEntity record);

  /// Returns (variableCosts, fixedCosts) from the most recent saved record —
  /// used to prefill the Costs step for a new entry.
  Future<Result<(List<CostItemEntity>, List<CostItemEntity>)>> getLastCosts();

  /// Returns production entries from the most recent saved record — used to
  /// prefill rate/yield on the Sale step for a new entry.
  Future<Result<List<ProductionEntryEntity>>> getLastProductionEntries();

  Future<Result<List<PartahRecordEntity>>> getAllRecords();

  Future<Result<void>> deleteRecord(String id);
}
