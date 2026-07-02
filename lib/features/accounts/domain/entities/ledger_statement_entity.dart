import 'package:equatable/equatable.dart';
import 'ledger_entry_base.dart';

class LedgerStatementEntity extends Equatable {
  final int? finYearId;
  final double? ttlDebit;
  final double? ttlCredit;
  final double? balance;
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
  final double? ttlDebit;
  final double? ttlCredit;
  final double? balance;
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

class LedgerEntryEntity extends Equatable implements LedgerEntryBase {
  final String? type;
  @override final int? featureId;
  final LedgerFeatureEntity? feature;
  @override final DateTime? docDate;
  final int? accountId;
  final int? finYearId;
  final int? currencyId;
  @override final double? drAmount;
  @override final double? crAmount;
  final double? taxAmount;
  @override final String? narration;
  @override final bool? isOpening;
  @override final double? balance;
  final int? id;
  @override final String? docNbr;
  final int? toAccountId;
  final int? partyId;
  final LedgerPartyEntity? party;
  @override final String? featureName;
  @override final int? parentEntityId;
  final int? childEntityId;
  @override String? get partyFullName => party?.fullName;

  const LedgerEntryEntity({
    this.type,
    this.featureId,
    this.feature,
    this.docDate,
    this.accountId,
    this.finYearId,
    this.currencyId,
    this.drAmount,
    this.crAmount,
    this.taxAmount,
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
        feature,
        docDate,
        accountId,
        finYearId,
        currencyId,
        drAmount,
        crAmount,
        taxAmount,
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

class LedgerFeatureEntity extends Equatable {
  final int? id;
  final String? name;
  final String? sysKey;
  final bool? flgLandingPage;

  const LedgerFeatureEntity({
    this.id,
    this.name,
    this.sysKey,
    this.flgLandingPage,
  });

  @override
  List<Object?> get props => [id, name, sysKey, flgLandingPage];
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
