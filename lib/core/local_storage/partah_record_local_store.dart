import 'dart:convert';

import '../constants/shared_pref_key.dart';
import '../../features/partah/domain/entities/cost_item_entity.dart';
import '../../features/partah/domain/entities/partah_record_entity.dart';
import '../../features/partah/domain/entities/production_entry_entity.dart';
import 'storage.dart';

/// Local stand-in for the Partah reports backend. Saved reports are stored
/// as JSON in LocalStorage until a real API exists — swap `RemotePartahDataSourceImpl`'s
/// save/list/delete bodies for HTTP calls then; this store can stay as an offline cache.
class PartahRecordLocalStore {
  PartahRecordLocalStore._();

  static Future<List<PartahRecordEntity>> readAll() async {
    final raw = await storage.readValues(StorageKeys.partahRecords);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map(_recordFromJson).toList();
    } catch (_) {
      return [];
    }
  }

  /// Appends [record] with a freshly generated id and persists it. Returns the id.
  static Future<String> append(PartahRecordEntity record) async {
    final id = 'local-${DateTime.now().microsecondsSinceEpoch}';
    final saved = record.copyWith(id: id);
    final all = await readAll();
    all.insert(0, saved);
    await _writeAll(all);
    return id;
  }

  static Future<void> remove(String id) async {
    final all = await readAll();
    all.removeWhere((r) => r.id == id);
    await _writeAll(all);
  }

  static Future<void> _writeAll(List<PartahRecordEntity> records) async {
    final encoded = jsonEncode(records.map(_recordToJson).toList());
    await storage.setValues(StorageKeys.partahRecords, encoded);
  }

  static Map<String, dynamic> _recordToJson(PartahRecordEntity r) => {
        'id': r.id,
        'purchasePrice': r.purchasePrice,
        'totalGrindingKg': r.totalGrindingKg,
        'gainPercentage': r.gainPercentage,
        'purchaseAmountPer100Kg': r.purchaseAmountPer100Kg,
        'baseWeightKg': r.baseWeightKg,
        'productionEntries': r.productionEntries.map(_entryToJson).toList(),
        'variableCosts': r.variableCosts.map(_costToJson).toList(),
        'fixedCosts': r.fixedCosts.map(_costToJson).toList(),
        'createdAt': r.createdAt.toIso8601String(),
        'updatedAt': r.updatedAt.toIso8601String(),
      };

  static PartahRecordEntity _recordFromJson(dynamic json) => PartahRecordEntity(
        id: json['id'] as String?,
        purchasePrice: (json['purchasePrice'] as num).toDouble(),
        totalGrindingKg: (json['totalGrindingKg'] as num).toDouble(),
        gainPercentage: (json['gainPercentage'] as num).toDouble(),
        purchaseAmountPer100Kg: (json['purchaseAmountPer100Kg'] as num).toDouble(),
        baseWeightKg: (json['baseWeightKg'] as num).toDouble(),
        productionEntries: (json['productionEntries'] as List).map(_entryFromJson).toList(),
        variableCosts: (json['variableCosts'] as List).map(_costFromJson).toList(),
        fixedCosts: (json['fixedCosts'] as List).map(_costFromJson).toList(),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  static Map<String, dynamic> _entryToJson(ProductionEntryEntity e) => {
        'productName': e.productName,
        'bagSize': e.bagSize,
        'percentage': e.percentage,
        'rate': e.rate,
      };

  static ProductionEntryEntity _entryFromJson(dynamic json) => ProductionEntryEntity(
        productName: json['productName'] as String,
        bagSize: (json['bagSize'] as num).toDouble(),
        percentage: (json['percentage'] as num).toDouble(),
        rate: (json['rate'] as num).toDouble(),
      );

  static Map<String, dynamic> _costToJson(CostItemEntity c) => {
        'description': c.description,
        'amount': c.amount,
        'type': c.type.name,
      };

  static CostItemEntity _costFromJson(dynamic json) => CostItemEntity(
        description: json['description'] as String,
        amount: (json['amount'] as num).toDouble(),
        type: CostType.values.byName(json['type'] as String),
      );
}
