import 'package:flutter/material.dart';

import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../domain/entities/product_template_entity.dart';

class ProductEditRow {
  final TextEditingController nameController;
  final TextEditingController bagSizeController;

  ProductEditRow({String name = '', String bagSize = ''})
      : nameController = TextEditingController(text: name),
        bagSizeController = TextEditingController(text: bagSize);

  void dispose() {
    nameController.dispose();
    bagSizeController.dispose();
  }
}

/// Editing state for the Manage Products screen — rows + mill type selection.
/// Mirrors PartahCalculator's shape: a plain ChangeNotifier for the live
/// editing state, with PartahBloc (via ManageProductsBloc) handling only the
/// async edges (load existing templates, save).
class ManageProductsForm extends ChangeNotifier {
  ManageProductsForm({required List<ProductTemplateEntity> templates}) {
    if (templates.isNotEmpty) {
      rows = templates
          .map((t) => ProductEditRow(
                name: t.name,
                bagSize: t.bagSize % 1 == 0 ? t.bagSize.toInt().toString() : t.bagSize.toString(),
              ))
          .toList();
    } else {
      rows = [];
    }
    _loadSelectedMillType();
  }

  List<ProductEditRow> rows = [];
  MillType? selectedMillType;

  static const _flourDefaults = [
    ('Atta', '20'),
    ('Maida', '50'),
    ('Suji', '25'),
    ('Bran', '40'),
    ('Fine', '25'),
  ];

  static const _riceDefaults = [
    ('Basmati', '25'),
    ('Irri-6', '50'),
    ('Rice Bran', '50'),
    ('Broken Rice', '25'),
    ('Husk', '40'),
  ];

  Future<void> _loadSelectedMillType() async {
    selectedMillType = await MillConfigStore.getMillType();
    notifyListeners();
  }

  void selectMillType(MillType type) {
    if (selectedMillType == type) return;
    selectedMillType = type;
    // Replace current rows with the selected mill's default products.
    // Nothing is persisted until Save — backing out keeps the old setup.
    for (final row in rows) {
      row.dispose();
    }
    final defaults = type == MillType.flour ? _flourDefaults : _riceDefaults;
    rows = [for (final (name, bagSize) in defaults) ProductEditRow(name: name, bagSize: bagSize)];
    notifyListeners();
  }

  void addRow() {
    rows.add(ProductEditRow());
    notifyListeners();
  }

  /// Returns an error message if removal isn't allowed (at least one row required).
  String? removeRow(int index) {
    if (rows.length <= 1) return 'At least one product is required';
    rows[index].dispose();
    rows.removeAt(index);
    notifyListeners();
    return null;
  }

  /// Validates the rows and returns either an error message or the built templates.
  (String? error, List<ProductTemplateEntity> templates) buildTemplates() {
    if (rows.isEmpty) return ('Please add at least one product', const []);
    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      if (row.nameController.text.trim().isEmpty) {
        return ('Enter a name for product ${i + 1}', const []);
      }
      final size = double.tryParse(row.bagSizeController.text.trim());
      if (size == null || size <= 0) {
        return ('Enter a valid bag size for product ${i + 1}', const []);
      }
    }
    final templates = rows
        .map((r) => ProductTemplateEntity(
              name: r.nameController.text.trim(),
              bagSize: double.parse(r.bagSizeController.text.trim()),
            ))
        .toList();
    return (null, templates);
  }

  /// Persists the chosen mill type (base bag weight) once save succeeds.
  Future<void> persistSelectedMillType() async {
    final type = selectedMillType;
    if (type != null) await MillConfigStore.setMillType(type);
  }

  @override
  void dispose() {
    for (final row in rows) {
      row.dispose();
    }
    super.dispose();
  }
}
