import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/cost_item_entity.dart';
import '../../domain/entities/partah_category_entity.dart';
import '../../domain/entities/partah_category_product_entity.dart';
import '../../domain/entities/partah_report_entity.dart';
import '../../domain/repositories/partah_repository.dart';
import '../datasources/remote_partah_datasource.dart';
import '../models/request_models/create_partah_category/create_partah_category.dart';
import '../models/response_models/created_partah_category/created_partah_category.dart';
import '../models/response_models/load_partah/load_partah.dart' as report_model;
import '../models/response_models/partah_categories_list/partah_categories_list.dart' as list_model;
import '../models/response_models/partah_category_products/partah_category_products.dart';

class PartahRepositoryImpl extends BaseRepository implements PartahRepository {
  final IRemotePartahDataSource dataSource;

  PartahRepositoryImpl({required this.dataSource});

  @override
  Future<Result<PartahReportEntity>> loadReport({
    required String fromDate,
    required String toDate,
  }) {
    return execute(
      call: () async {
        final report = await dataSource.getReport(fromDate: fromDate, toDate: toDate);
        return _toReportEntity(report);
      },
    );
  }

  @override
  Future<Result<({List<PartahCategoryEntity> categories, int unassignedCount})>>
      getCategories() {
    return execute(
      call: () async {
        final response = await dataSource.getCategories();
        final categories = (response.categories ?? []).map(_toEntity).toList();
        return (
          categories: categories,
          unassignedCount: response.unassignedItemCount ?? 0,
        );
      },
    );
  }

  @override
  Future<Result<List<PartahCategoryProductEntity>>> searchCategoryProducts({
    int? categoryId,
    String? query,
  }) {
    return execute(
      call: () async {
        final all = await dataSource.searchCategoryItems(categoryId: categoryId);

        final assignedIds = categoryId == null
            ? const <int>{}
            : (await dataSource.getCategoryItems(categoryId))
                .map((p) => p.itemId)
                .whereType<int>()
                .toSet();

        return all
            .where((p) => p.itemId != null)
            .map((p) => _toProductEntity(p, isAssigned: assignedIds.contains(p.itemId)))
            .toList();
      },
    );
  }

  @override
  Future<Result<PartahCategoryEntity>> saveCategory(PartahCategoryEntity category) {
    return execute(
      call: () async {
        final saved = await dataSource.saveCategory(
          CreatePartahCategory(
            id: category.id,
            categoryKey: category.categoryKey,
            displayName: category.displayName,
            isActive: category.isActive,
            isRawMaterial: category.isRawMaterial,
            sortOrder: category.sortOrder,
            standardBagKg: category.standardBagKg,
          ),
        );
        return _createdToEntity(saved);
      },
    );
  }

  @override
  Future<Result<void>> saveCategoryItems({
    required int categoryId,
    required List<int> itemIds,
  }) {
    return execute(
      call: () => dataSource.saveCategoryItems(categoryId: categoryId, itemIds: itemIds),
    );
  }

  PartahReportEntity _toReportEntity(report_model.LoadPartah r) {
    final summary = r.summary;
    final sales = r.salesSummary;
    final wheat = r.wheatCost;
    final production = r.production;
    final expenses = r.expensesSummary;

    return PartahReportEntity(
      partaDate: r.partaDate,
      periodFrom: r.basePeriod?.from,
      periodTo: r.basePeriod?.to,
      summary: PartahSummaryEntity(
        totalRevenuePer100Kg: (summary?.totalRevenuePer100Kg ?? 0).toDouble(),
        totalCostPer100Kg: (summary?.totalCostPer100Kg ?? 0).toDouble(),
        profitPer100Kg: (summary?.profitPer100Kg ?? 0).toDouble(),
        totalProfit: (summary?.totalProfit ?? 0).toDouble(),
      ),
      salesSummary: PartahSalesSummaryEntity(
        totalSaleAmount: (sales?.totalSaleAmount ?? 0).toDouble(),
        totalWeightKg: (sales?.totalWeightKg ?? 0).toDouble(),
        saleRateIndexPer100Kg: (sales?.saleRateIndexPer100Kg ?? 0).toDouble(),
      ),
      wheatCost: PartahWheatCostEntity(
        quantity: (wheat?.quantity ?? 0).toDouble(),
        rate: (wheat?.rate ?? 0).toDouble(),
        amount: (wheat?.amount ?? 0).toDouble(),
      ),
      production: PartahProductionEntity(
        totalGrinding: (production?.totalGrinding ?? 0).toDouble(),
        gainPercent: (production?.gainPercent ?? 0).toDouble(),
      ),
      expensesSummary: PartahExpensesSummaryEntity(
        variableTotal: (expenses?.variableTotal ?? 0).toDouble(),
        fixedTotal: (expenses?.fixedTotal ?? 0).toDouble(),
        includedExpensesTotal: (expenses?.includedExpensesTotal ?? 0).toDouble(),
        costs: (expenses?.variableCosts ?? [])
            .map((c) => CostItemEntity(
                  description: c.name ?? '',
                  amount: (c.amount ?? 0).toDouble(),
                  type: (c.isFixedCost ?? false) ? CostType.fixed : CostType.variable,
                ))
            .toList(),
      ),
      categoryIndex: (r.categoryPartaIndex ?? [])
          .map((c) => PartahCategoryIndexEntity(
                categoryKey: c.categoryKey ?? '',
                displayName: c.displayName ?? '',
                qty: (c.qty ?? 0).toDouble(),
                weightKg: (c.weightKg ?? 0).toDouble(),
                amount: (c.amount ?? 0).toDouble(),
                avgRatePerKg: (c.avgRatePerKg ?? 0).toDouble(),
                standardBagKg: c.standardBagKg ?? 0,
                perBagRate: (c.perBagRate ?? 0).toDouble(),
                mixPercent: (c.mixPercent ?? 0).toDouble(),
                categoryParta: (c.categoryParta ?? 0).toDouble(),
              ))
          .toList(),
      rawMaterialCategoryName: r.rawMaterialCategoryName,
      totalConsumption100KgBags: r.totalConsumption100KgBags ?? 0,
    );
  }

  PartahCategoryEntity _toEntity(list_model.Category c) {
    return PartahCategoryEntity(
      id: c.id,
      categoryKey: c.categoryKey ?? '',
      displayName: c.displayName ?? '',
      standardBagKg: c.standardBagKg ?? 0,
      sortOrder: c.sortOrder ?? 0,
      isActive: c.isActive ?? true,
      isRawMaterial: c.isRawMaterial ?? false,
      itemCount: c.itemCount ?? 0,
      archived: c.archived ?? false,
    );
  }

  PartahCategoryEntity _createdToEntity(CreatedPartahCategory c) {
    return PartahCategoryEntity(
      id: c.id,
      categoryKey: c.categoryKey ?? '',
      displayName: c.displayName ?? '',
      standardBagKg: c.standardBagKg ?? 0,
      sortOrder: c.sortOrder ?? 0,
      isActive: c.isActive ?? true,
      isRawMaterial: c.isRawMaterial ?? false,
      itemCount: c.itemCount ?? 0,
      archived: c.archived ?? false,
    );
  }

  PartahCategoryProductEntity _toProductEntity(
    PartahCategoryProducts p, {
    required bool isAssigned,
  }) {
    return PartahCategoryProductEntity(
      itemId: p.itemId ?? 0,
      itemName: p.itemName ?? '',
      itemGroupName: p.itemGroupName,
      isAssigned: isAssigned,
    );
  }
}
