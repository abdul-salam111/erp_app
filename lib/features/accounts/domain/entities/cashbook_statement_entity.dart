import 'package:equatable/equatable.dart';

class CashbookStatementEntity extends Equatable {
  final int? finYearId;
  final int? ttlDebit;
  final int? ttlCredit;
  final int? balance;
  final CashbookFinYearEntity? finYear;
  final List<CashbookTypeEntity>? ledgerTypes;

  const CashbookStatementEntity({
    this.finYearId,
    this.ttlDebit,
    this.ttlCredit,
    this.balance,
    this.finYear,
    this.ledgerTypes,
  });

  @override
  List<Object?> get props => [
        finYearId,
        ttlDebit,
        ttlCredit,
        balance,
        finYear,
        ledgerTypes,
      ];
}

class CashbookFinYearEntity extends Equatable {
  final bool? isClosed;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? name;
  final int? id;

  const CashbookFinYearEntity({
    this.isClosed,
    this.startDate,
    this.endDate,
    this.name,
    this.id,
  });

  @override
  List<Object?> get props => [isClosed, startDate, endDate, name, id];
}

class CashbookTypeEntity extends Equatable {
  final String? type;
  final int? ttlDebit;
  final int? ttlCredit;
  final int? balance;
  final List<CashbookEntryEntity>? ledgers;

  const CashbookTypeEntity({
    this.type,
    this.ttlDebit,
    this.ttlCredit,
    this.balance,
    this.ledgers,
  });

  @override
  List<Object?> get props => [type, ttlDebit, ttlCredit, balance, ledgers];
}

class CashbookEntryEntity extends Equatable {
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
  final CashbookPartyEntity? party;
  final String? featureName;
  final int? parentEntityId;
  final int? childEntityId;

  const CashbookEntryEntity({
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

  @override
  List<Object?> get props => [
        type,
        featureId,
        docDate,
        accountId,
        finYearId,
        currencyId,
        drAmount,
        crAmount,
        narration,
        isOpening,
        balance,
        id,
        docNbr,
        toAccountId,
        partyId,
        party,
        featureName,
        parentEntityId,
        childEntityId,
      ];
}

class CashbookPartyEntity extends Equatable {
  final int? id;
  final String? fullName;
  final int? partyTypeId;
  final int? locationId;

  const CashbookPartyEntity({
    this.id,
    this.fullName,
    this.partyTypeId,
    this.locationId,
  });

  @override
  List<Object?> get props => [id, fullName, partyTypeId, locationId];
}
