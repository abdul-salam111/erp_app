abstract interface class LedgerEntryBase {
  bool? get isOpening;
  double? get drAmount;
  double? get crAmount;
  DateTime? get docDate;
  String? get featureName;
  String? get docNbr;
  double? get balance;
  int? get featureId;
  int? get parentEntityId;
  String? get narration;
  String? get partyFullName;
}
