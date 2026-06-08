class CashbookModel {
  final int? finYearId;
  final int? ttlDebit;
  final int? ttlCredit;
  final int? balance;
  final CashbookFinYearModel? finYear;
  final List<CashbookTypeModel>? ledgerTypes;

  const CashbookModel({
    this.finYearId,
    this.ttlDebit,
    this.ttlCredit,
    this.balance,
    this.finYear,
    this.ledgerTypes,
  });

  factory CashbookModel.fromJson(Map<String, dynamic> json) => CashbookModel(
        finYearId: json['FinYearId'] as int?,
        ttlDebit: json['TTLDebit'] as int?,
        ttlCredit: json['TTLCredit'] as int?,
        balance: json['Balance'] as int?,
        finYear: json['FinYear'] == null
            ? null
            : CashbookFinYearModel.fromJson(
                json['FinYear'] as Map<String, dynamic>),
        ledgerTypes: (json['LedgerTypes'] as List<dynamic>?)
            ?.map((e) =>
                CashbookTypeModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class CashbookFinYearModel {
  final bool? isClosed;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? name;
  final int? id;

  const CashbookFinYearModel({
    this.isClosed,
    this.startDate,
    this.endDate,
    this.name,
    this.id,
  });

  factory CashbookFinYearModel.fromJson(Map<String, dynamic> json) =>
      CashbookFinYearModel(
        isClosed: json['IsClosed'] as bool?,
        startDate: json['StartDate'] == null
            ? null
            : DateTime.tryParse(json['StartDate'] as String),
        endDate: json['EndDate'] == null
            ? null
            : DateTime.tryParse(json['EndDate'] as String),
        name: json['Name'] as String?,
        id: json['Id'] as int?,
      );
}

class CashbookTypeModel {
  final String? type;
  final int? ttlDebit;
  final int? ttlCredit;
  final int? balance;
  final List<CashbookEntryModel>? ledgers;

  const CashbookTypeModel({
    this.type,
    this.ttlDebit,
    this.ttlCredit,
    this.balance,
    this.ledgers,
  });

  factory CashbookTypeModel.fromJson(Map<String, dynamic> json) =>
      CashbookTypeModel(
        type: json['Type'] as String?,
        ttlDebit: json['TTLDebit'] as int?,
        ttlCredit: json['TTLCredit'] as int?,
        balance: json['Balance'] as int?,
        ledgers: (json['Ledgers'] as List<dynamic>?)
            ?.map((e) =>
                CashbookEntryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class CashbookEntryModel {
  final String? type;
  final int? featureId;
  final DateTime? docDate;
  final int? accountId;
  final int? finYearId;
  final int? currencyId;
  final int? drAmount;
  final int? crAmount;
  final String? narration;
  final bool? isOpening;
  final int? balance;
  final int? id;
  final String? docNbr;
  final int? toAccountId;
  final int? partyId;
  final CashbookPartyModel? party;
  final String? featureName;
  final int? parentEntityId;
  final int? childEntityId;

  const CashbookEntryModel({
    this.type,
    this.featureId,
    this.docDate,
    this.accountId,
    this.finYearId,
    this.currencyId,
    this.drAmount,
    this.crAmount,
    this.narration,
    this.isOpening,
    this.balance,
    this.id,
    this.docNbr,
    this.toAccountId,
    this.partyId,
    this.party,
    this.featureName,
    this.parentEntityId,
    this.childEntityId,
  });

  factory CashbookEntryModel.fromJson(Map<String, dynamic> json) =>
      CashbookEntryModel(
        type: json['Type'] as String?,
        featureId: json['FeatureId'] as int?,
        docDate: json['DocDate'] == null
            ? null
            : DateTime.tryParse(json['DocDate'] as String),
        accountId: json['AccountId'] as int?,
        finYearId: json['FinYearId'] as int?,
        currencyId: json['CurrencyId'] as int?,
        drAmount: json['DrAmount'] as int?,
        crAmount: json['CrAmount'] as int?,
        narration: json['Narration'] as String?,
        isOpening: json['IsOpening'] as bool?,
        balance: json['Balance'] as int?,
        id: json['Id'] as int?,
        docNbr: json['DocNbr'] as String?,
        toAccountId: json['ToAccountId'] as int?,
        partyId: json['PartyId'] as int?,
        party: json['Party'] == null
            ? null
            : CashbookPartyModel.fromJson(
                json['Party'] as Map<String, dynamic>),
        featureName: json['FeatureName'] as String?,
        parentEntityId: json['ParentEntityId'] as int?,
        childEntityId: json['ChildEntityId'] as int?,
      );
}

class CashbookPartyModel {
  final int? id;
  final String? fullName;
  final int? partyTypeId;
  final int? locationId;

  const CashbookPartyModel({
    this.id,
    this.fullName,
    this.partyTypeId,
    this.locationId,
  });

  factory CashbookPartyModel.fromJson(Map<String, dynamic> json) =>
      CashbookPartyModel(
        id: json['Id'] as int?,
        fullName: json['FullName'] as String?,
        partyTypeId: json['PartyTypeId'] as int?,
        locationId: json['LocationId'] as int?,
      );
}
