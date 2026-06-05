import 'package:equatable/equatable.dart';

class LedgerStatementEntity extends Equatable {
  final int? finYearId;
  final int? ttlDebit;
  final int? ttlCredit;
  final int? balance;
  final LedgerFinYearEntity? finYear;
  final List<LedgerTypeEntity>? ledgerTypes;

  const LedgerStatementEntity({
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

class LedgerFinYearEntity extends Equatable {
  final bool? isClosed;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? name;
  final int? id;

  const LedgerFinYearEntity({
    this.isClosed,
    this.startDate,
    this.endDate,
    this.name,
    this.id,
  });

  @override
  List<Object?> get props => [isClosed, startDate, endDate, name, id];
}

class LedgerTypeEntity extends Equatable {
  final String? type;
  final int? ttlDebit;
  final int? ttlCredit;
  final int? balance;
  final List<LedgerEntryEntity>? ledgers;

  const LedgerTypeEntity({
    this.type,
    this.ttlDebit,
    this.ttlCredit,
    this.balance,
    this.ledgers,
  });

  @override
  List<Object?> get props => [type, ttlDebit, ttlCredit, balance, ledgers];
}

class LedgerEntryEntity extends Equatable {
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
  final LedgerPartyEntity? party;
  final String? featureName;
  final int? parentEntityId;
  final int? childEntityId;

  const LedgerEntryEntity({
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

class LedgerPartyEntity extends Equatable {
  final int? id;
  final String? fullName;
  final int? partyTypeId;
  final int? locationId;

  const LedgerPartyEntity({
    this.id,
    this.fullName,
    this.partyTypeId,
    this.locationId,
  });

  @override
  List<Object?> get props => [id, fullName, partyTypeId, locationId];
}
