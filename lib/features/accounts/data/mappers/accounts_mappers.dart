import '../models/response_models/get_accounts_list/account_list_item_model.dart';
import '../models/response_models/get_cash_and_bank_balance/bank_cash_item_model.dart';
import '../models/response_models/get_cashbook/cashbook_model.dart';
import '../models/response_models/get_cashbook_accounts/cashbook_account_model.dart';
import '../models/response_models/get_due_receipt_count/due_receipt_count_model.dart';
import '../models/response_models/get_ledger/get_ledger_model.dart';
import '../models/response_models/get_party_list/party_list_item_model.dart';
import '../../domain/entities/account_list_item_entity.dart';
import '../../domain/entities/bank_cash_item_entity.dart';
import '../../domain/entities/cashbook_account_item_entity.dart';
import '../../domain/entities/cashbook_statement_entity.dart';
import '../../domain/entities/due_receipt_count_entity.dart';
import '../../domain/entities/ledger_statement_entity.dart';
import '../../domain/entities/party_list_item_entity.dart';

extension BankCashItemModelX on BankCashItemModel {
  BankCashItemEntity toEntity() => BankCashItemEntity(
        accountId: accountId,
        accountTitle: accountTitle,
        accountType: accountType,
        accountNbr: accountNbr,
        amount: amount,
      );
}

extension AccountListItemModelX on AccountListItemModel {
  AccountListItemEntity toEntity() => AccountListItemEntity(
        id: id,
        name: name,
        group: group,
        breadcrumb: breadcrumb,
      );
}

extension PartyListItemModelX on PartyListItemModel {
  PartyListItemEntity toEntity() => PartyListItemEntity(
        id: id,
        name: name,
        partyType: partyType,
      );
}

extension DueReceiptCountModelX on DueReceiptCountModel {
  DueReceiptCountEntity toEntity() => DueReceiptCountEntity(
        ttlRecoveryAmount: ttlRecoveryAmount,
        ttlReceivedAmount: ttlReceivedAmount,
        ttlPostponeAmount: ttlPostponeAmount,
      );
}

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

extension LedgerX on Ledger {
  LedgerEntryEntity toEntity() => LedgerEntryEntity(
        type: type,
        featureId: featureId,
        docDate: docDate,
        accountId: accountId,
        finYearId: finYearId,
        currencyId: currencyId,
        drAmount: drAmount,
        crAmount: crAmount,
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

extension PartyX on Party {
  LedgerPartyEntity toEntity() => LedgerPartyEntity(
        id: id,
        fullName: fullName,
        partyTypeId: partyTypeId,
        locationId: locationId,
      );
}

// ─── Cashbook mappers ─────────────────────────────────────────────────────────

extension CashbookAccountModelX on CashbookAccountModel {
  CashbookAccountItemEntity toCashbookEntity() => CashbookAccountItemEntity(
        id: id,
        name: name,
        group: group?.name,
        breadcrumb: accType?.breadcrumb,
        sysKey: accType?.sysKey,
      );
}

extension CashbookModelX on CashbookModel {
  CashbookStatementEntity toCashbookEntity() => CashbookStatementEntity(
        finYearId: finYearId,
        ttlDebit: ttlDebit,
        ttlCredit: ttlCredit,
        balance: balance,
        finYear: finYear?.toCashbookEntity(),
        ledgerTypes: ledgerTypes?.map((lt) => lt.toCashbookEntity()).toList(),
      );
}

extension CashbookFinYearModelX on CashbookFinYearModel {
  CashbookFinYearEntity toCashbookEntity() => CashbookFinYearEntity(
        isClosed: isClosed,
        startDate: startDate,
        endDate: endDate,
        name: name,
        id: id,
      );
}

extension CashbookTypeModelX on CashbookTypeModel {
  CashbookTypeEntity toCashbookEntity() => CashbookTypeEntity(
        type: type,
        ttlDebit: ttlDebit,
        ttlCredit: ttlCredit,
        balance: balance,
        ledgers: ledgers?.map((l) => l.toCashbookEntity()).toList(),
      );
}

extension CashbookEntryModelX on CashbookEntryModel {
  CashbookEntryEntity toCashbookEntity() => CashbookEntryEntity(
        type: type,
        featureId: featureId,
        docDate: docDate,
        accountId: accountId,
        finYearId: finYearId,
        currencyId: currencyId,
        drAmount: drAmount,
        crAmount: crAmount,
        narration: narration,
        isOpening: isOpening,
        balance: balance,
        id: id,
        docNbr: docNbr,
        toAccountId: toAccountId,
        partyId: partyId,
        party: party?.toCashbookEntity(),
        featureName: featureName,
        parentEntityId: parentEntityId,
        childEntityId: childEntityId,
      );
}

extension CashbookPartyModelX on CashbookPartyModel {
  CashbookPartyEntity toCashbookEntity() => CashbookPartyEntity(
        id: id,
        fullName: fullName,
        partyTypeId: partyTypeId,
        locationId: locationId,
      );
}
