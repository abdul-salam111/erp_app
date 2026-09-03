import '../../../../core/local_storage/partah_record_local_store.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/cost_item_entity.dart';
import '../../domain/entities/production_entry_entity.dart';
import '../../domain/entities/partah_record_entity.dart';
import '../../domain/entities/product_template_entity.dart';
import 'product_template_local_store.dart';

abstract interface class IRemotePartahDataSource {
  Future<List<ProductTemplateEntity>> getProductTemplates();
  Future<void> saveProductTemplates(List<ProductTemplateEntity> templates);
  Future<String> saveRecord(PartahRecordEntity record);
  Future<(List<CostItemEntity>, List<CostItemEntity>)> getLastCosts();
  Future<List<ProductionEntryEntity>> getLastProductionEntries();
  Future<List<PartahRecordEntity>> getAllRecords();
  Future<void> deleteRecord(String id);
}

// TODO(backend): No API exists for Partah yet. Every method below returns
// mocked data instead of calling `dioHelper` so the frontend is fully usable
// ahead of the backend. Once `ApiEndPoints.partah` has real endpoints, replace
// each method body with the commented-out `dioHelper` call and delete the mock.
class RemotePartahDataSourceImpl extends BaseRemoteDatasource
    implements IRemotePartahDataSource {
  RemotePartahDataSourceImpl({required super.dioHelper});

  @override
  Future<List<ProductTemplateEntity>> getProductTemplates() async {
    // return getList(
    //   url: ApiEndPoints.partah.productTemplates,
    //   parser: (json) => ProductTemplateEntity(name: json['name'], bagSize: (json['bag_size'] as num).toDouble()),
    // );
    await Future.delayed(const Duration(milliseconds: 300));
    final saved = await ProductTemplateLocalStore.read();
    return saved ?? const [];
  }

  @override
  Future<void> saveProductTemplates(List<ProductTemplateEntity> templates) async {
    // return post(
    //   url: ApiEndPoints.partah.productTemplates,
    //   parser: (_) {},
    //   body: {'templates': templates.map((t) => {'name': t.name, 'bag_size': t.bagSize}).toList()},
    // );
    await Future.delayed(const Duration(milliseconds: 200));
    await ProductTemplateLocalStore.write(templates);
  }

  @override
  Future<String> saveRecord(PartahRecordEntity record) async {
    // return post(
    //   url: ApiEndPoints.partah.performAction,
    //   parser: (json) => json['id'] as String,
    //   body: {...},
    // );
    await Future.delayed(const Duration(milliseconds: 300));
    return PartahRecordLocalStore.append(record);
  }

  @override
  Future<(List<CostItemEntity>, List<CostItemEntity>)> getLastCosts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final records = await PartahRecordLocalStore.readAll();
    if (records.isEmpty) return (<CostItemEntity>[], <CostItemEntity>[]);
    return (records.first.variableCosts, records.first.fixedCosts);
  }

  @override
  Future<List<ProductionEntryEntity>> getLastProductionEntries() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final records = await PartahRecordLocalStore.readAll();
    return records.isEmpty ? const <ProductionEntryEntity>[] : records.first.productionEntries;
  }

  @override
  Future<List<PartahRecordEntity>> getAllRecords() async {
    // return getList(url: ApiEndPoints.partah.reports, parser: (json) => ...);
    await Future.delayed(const Duration(milliseconds: 300));
    return PartahRecordLocalStore.readAll();
  }

  @override
  Future<void> deleteRecord(String id) async {
    // return delete(url: '${ApiEndPoints.partah.reports}/$id', parser: (_) {});
    await Future.delayed(const Duration(milliseconds: 200));
    await PartahRecordLocalStore.remove(id);
  }
}
