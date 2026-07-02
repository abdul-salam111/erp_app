import '../../accounts_exports.dart';

//! ─── Position Mappers ───────────────────────────────────────────────────────

extension BankCashItemModelX on BankCashItemModel {
  BankCashItemEntity toEntity() => BankCashItemEntity(
    accountTitle: accountTitle,
    accountType: accountType,
    accountNbr: accountNbr,
    amount: amount,
  );
}

extension DueReceiptCountModelX on DueReceiptCountModel {
  DueReceiptCountEntity toEntity() => DueReceiptCountEntity(
    ttlRecoveryAmount: ttlRecoveryAmount,
    ttlReceivedAmount: ttlReceivedAmount,
    ttlPostponeAmount: ttlPostponeAmount,
    invoices: invoices.map((i) => i.toEntity()).toList(),
  );
}

extension RecoveryInvoiceModelX on RecoveryInvoiceModel {
  RecoveryInvoiceEntity toEntity() => RecoveryInvoiceEntity(
    id: id,
    docNbr: docNbr,
    docDate: docDate,
    docAmount: docAmount,
    remainingAmount: remainingAmount,
    party: RecoveryInvoicePartyEntity(
      id: party.id,
      fullName: party.fullName,
      partyTypeId: party.partyTypeId,
      locationId: party.locationId,
    ),
    status: status,
    overDueDays: overDueDays,
    flgPostpone: flgPostpone,
  );
}

//! ─── Account Mappers ────────────────────────────────────────────────────────

extension AccountListItemModelX on AccountListItemModel {
  AccountListItemEntity toEntity() =>
      AccountListItemEntity(id: id, name: name, group: group);
}

//! ─── Party Mappers ──────────────────────────────────────────────────────────

extension PartyListItemModelX on PartyListItemModel {
  PartyListItemEntity toEntity() =>
      PartyListItemEntity(id: id, name: name, partyType: partyType);
}

extension PartyX on Party {
  LedgerPartyEntity toEntity() => LedgerPartyEntity(
    id: id,
    fullName: fullName,
    partyTypeId: partyTypeId,
    locationId: locationId,
  );
}

//! ─── Ledger Mappers ─────────────────────────────────────────────────────────

extension GetLedgerModelX on GetLedgerModel {
  LedgerStatementEntity toEntity() => LedgerStatementEntity(
    finYearId: finYearId,
    ttlDebit: ttlDebit,
    ttlCredit: ttlCredit,
    balance: balance,
    finYear: finYear?.toEntity(),
    ledgerTypes: ledgerTypes?.map((lt) => lt.toEntity()).toList(),
  );
}

extension FinYearX on FinYear {
  LedgerFinYearEntity toEntity() => LedgerFinYearEntity(
    isClosed: isClosed,
    startDate: startDate,
    endDate: endDate,
    name: name,
    id: id,
  );
}

extension LedgerTypeX on LedgerType {
  LedgerTypeEntity toEntity() => LedgerTypeEntity(
    type: type,
    ttlDebit: ttlDebit,
    ttlCredit: ttlCredit,
    balance: balance,
    ledgers: ledgers?.map((l) => l.toEntity()).toList(),
  );
}

extension LedgerFeatureModelX on LedgerFeatureModel {
  LedgerFeatureEntity toEntity() => LedgerFeatureEntity(
    id: id,
    name: name,
    sysKey: sysKey,
    flgLandingPage: flgLandingPage,
  );
}

extension LedgerX on Ledger {
  LedgerEntryEntity toEntity() => LedgerEntryEntity(
    type: type,
    featureId: featureId,
    feature: feature?.toEntity(),
    docDate: docDate,
    accountId: accountId,
    finYearId: finYearId,
    currencyId: currencyId,
    drAmount: drAmount,
    crAmount: crAmount,
    taxAmount: taxAmount,
    narration: narration,
    isOpening: isOpening,
    balance: balance,
    id: id,
    docNbr: docNbr,
    toAccountId: toAccountId,
    partyId: partyId,
    party: party?.toEntity(),
    featureName: featureName,
    parentEntityId: parentEntityId,
    childEntityId: childEntityId,
  );
}

//! ─── Cashbook Mappers ───────────────────────────────────────────────────────

extension CashbookAccountModelX on CashbookAccountModel {
  CashbookAccountItemEntity toCashbookEntity() => CashbookAccountItemEntity(
    id: id,
    name: name,
    group: group?.name,
    sysKey: accType?.sysKey,
  );
}