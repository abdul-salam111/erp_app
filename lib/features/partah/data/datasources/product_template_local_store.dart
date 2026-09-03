import 'dart:convert';

import '../../../../core/constants/shared_pref_key.dart';
import '../../../../core/local_storage/storage.dart';
import '../../domain/entities/product_template_entity.dart';

/// Local stand-in for the product-templates backend. Both the Partah
/// calculator (reader) and Product Setup (writer) go through this until a
/// real API exists — swap the read/write bodies for HTTP calls then, this
/// store can stay as an offline cache.
class ProductTemplateLocalStore {
  ProductTemplateLocalStore._();

  static Future<List<ProductTemplateEntity>?> read() async {
    final raw = await storage.readValues(StorageKeys.productTemplates);
    if (raw == null || raw.isEmpty) return null;
    try {
      final list = jsonDecode(raw) as List;
      return list
          .map((e) => ProductTemplateEntity(
                name: e['name'] as String,
                bagSize: (e['bagSize'] as num).toDouble(),
              ))
          .toList();
    } catch (_) {
      return null;
    }
  }

  static Future<void> write(List<ProductTemplateEntity> templates) async {
    final encoded = jsonEncode([
      for (final t in templates) {'name': t.name, 'bagSize': t.bagSize},
    ]);
    await storage.setValues(StorageKeys.productTemplates, encoded);
  }
}
