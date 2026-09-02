import '../constants/shared_pref_key.dart';
import 'storage.dart';

enum MillType { flour, rice, maund }

extension MillTypeDisplay on MillType {
  String get label => switch (this) {
        MillType.flour => 'Flour Mill',
        MillType.rice => 'Rice Mill',
        MillType.maund => 'Maund',
      };

  double get displayKg => MillConfigStore.baseWeightFor(this);

  /// Weight formatted without a trailing ".0" for whole numbers, e.g. "100"
  /// for flour but "37.324" for maund.
  String get displayKgLabel => displayKg % 1 == 0 ? displayKg.toInt().toString() : displayKg.toString();
}

/// Which mill type the org is set up for, and the base bag weight that
/// implies for Partah calculations. Local-only for now — once product setup
/// has a backend, this should move server-side alongside the saved products.
class MillConfigStore {
  MillConfigStore._();

  static double baseWeightFor(MillType type) => switch (type) {
        MillType.flour => 100,
        MillType.rice => 40,
        MillType.maund => 37.324,
      };

  static Future<MillType?> getMillType() async {
    final raw = await storage.readValues(StorageKeys.millType);
    return switch (raw) {
      'flour' => MillType.flour,
      'rice' => MillType.rice,
      'maund' => MillType.maund,
      _ => null,
    };
  }

  static Future<void> setMillType(MillType type) async {
    await storage.setValues(StorageKeys.millType, type.name);
  }

  /// Defaults to 100kg (flour) when no mill type has been chosen yet.
  static Future<double> getBaseWeightKg() async {
    final type = await getMillType();
    return type != null ? baseWeightFor(type) : 100;
  }
}
