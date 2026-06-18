import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/cashbook_account_item_entity.dart';
import '../../../domain/entities/cashbook_statement_entity.dart';

class CashbookState extends Equatable {
  final List<CashbookStatementEntity> statements;
  final List<int> printableFeatureIds;
  final List<CashbookAccountItemEntity> accounts;
  final ApiStatus apiStatus;
  final ApiStatus pdfStatus;
  final ApiStatus accountsStatus;
  final String? message;
  final String? pdfUrl;
  final bool isPrinting;
  final DateTime fromDate;
  final DateTime toDate;
  final int? selectedAccountId;
  final bool filterCollapsed;

  const CashbookState({
    this.statements = const [],
    this.printableFeatureIds = const [],
    this.accounts = const [],
    this.apiStatus = ApiStatus.INITIAL,
    this.pdfStatus = ApiStatus.INITIAL,
    this.accountsStatus = ApiStatus.INITIAL,
    this.message,
    this.pdfUrl,
    this.isPrinting = false,
    required this.fromDate,
    required this.toDate,
    this.selectedAccountId,
    this.filterCollapsed = false,
  });

  CashbookState copyWith({
    List<CashbookStatementEntity>? statements,
    List<int>? printableFeatureIds,
    List<CashbookAccountItemEntity>? accounts,
    ApiStatus? apiStatus,
    ApiStatus? pdfStatus,
    ApiStatus? accountsStatus,
    String? message,
    String? pdfUrl,
    bool? isPrinting,
    DateTime? fromDate,
    DateTime? toDate,
    int? selectedAccountId,
    bool? filterCollapsed,
  }) {
    return CashbookState(
      statements:          statements          ?? this.statements,
      printableFeatureIds: printableFeatureIds ?? this.printableFeatureIds,
      accounts:            accounts            ?? this.accounts,
      apiStatus:           apiStatus           ?? this.apiStatus,
      pdfStatus:           pdfStatus           ?? this.pdfStatus,
      accountsStatus:      accountsStatus      ?? this.accountsStatus,
      message:             message             ?? this.message,
      pdfUrl:              pdfUrl              ?? this.pdfUrl,
      isPrinting:          isPrinting          ?? this.isPrinting,
      fromDate:            fromDate            ?? this.fromDate,
      toDate:              toDate              ?? this.toDate,
      selectedAccountId:   selectedAccountId   ?? this.selectedAccountId,
      filterCollapsed:     filterCollapsed     ?? this.filterCollapsed,
    );
  }

  bool canPrint(int featureId) => printableFeatureIds.contains(featureId);

  @override
  List<Object?> get props => [
        statements,
        printableFeatureIds,
        accounts,
        apiStatus,
        pdfStatus,
        accountsStatus,
        message,
        pdfUrl,
        isPrinting,
        fromDate,
        toDate,
        selectedAccountId,
        filterCollapsed,
      ];
}
