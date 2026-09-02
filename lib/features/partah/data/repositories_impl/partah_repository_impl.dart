import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/cost_item_entity.dart';
import '../../domain/entities/partah_record_entity.dart';
import '../../domain/entities/production_entry_entity.dart';
import '../../domain/repositories/partah_repository.dart';
import '../datasources/remote_partah_datasource.dart';

class PartahRepositoryImpl extends BaseRepository implements PartahRepository {
  final IRemotePartahDataSource dataSource;

  PartahRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<ProductTemplateEntity>>> getProductTemplates() {
    return execute(call: () => dataSource.getProductTemplates());
  }

  @override
  Future<Result<void>> saveProductTemplates(List<ProductTemplateEntity> templates) {
    return execute(call: () => dataSource.saveProductTemplates(templates));
  }

  @override
  Future<Result<String>> saveRecord(PartahRecordEntity record) {
    return execute(call: () => dataSource.saveRecord(record));
  }

  @override
  Future<Result<(List<CostItemEntity>, List<CostItemEntity>)>> getLastCosts() {
    return execute(call: () => dataSource.getLastCosts());
  }

  @override
  Future<Result<List<ProductionEntryEntity>>> getLastProductionEntries() {
    return execute(call: () => dataSource.getLastProductionEntries());
  }

  @override
  Future<Result<List<PartahRecordEntity>>> getAllRecords() {
    return execute(call: () => dataSource.getAllRecords());
  }

  @override
  Future<Result<void>> deleteRecord(String id) {
    return execute(call: () => dataSource.deleteRecord(id));
  }
}
