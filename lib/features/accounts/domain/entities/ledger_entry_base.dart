abstract interface class LedgerEntryBase {
  bool? get isOpening;
  int? get drAmount;
  int? get crAmount;
  DateTime? get docDate;
  String? get featureName;
  String? get docNbr;
  int? get balance;
  int? get featureId;
  int? get parentEntityId;
  String? get narration;
  String? get partyFullName;
}
