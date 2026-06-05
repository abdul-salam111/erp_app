import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/ledger_statement_entity.dart';
import '../../../domain/entities/party_list_item_entity.dart';

class PartyLedgerState extends Equatable {
  final List<LedgerStatementEntity> statements;
  final List<int> printableFeatureIds;
  final List<PartyListItemEntity> parties;
  final ApiStatus apiStatus;
  final ApiStatus pdfStatus;
  final ApiStatus partiesStatus;
  final String? message;
  final String? pdfUrl;
  final bool isPrinting;
  final String fromDateDisplay;
  final String toDateDisplay;

  const PartyLedgerState({
    this.statements = const [],
    this.printableFeatureIds = const [],
    this.parties = const [],
    this.apiStatus = ApiStatus.INITIAL,
    this.pdfStatus = ApiStatus.INITIAL,
    this.partiesStatus = ApiStatus.INITIAL,
    this.message,
    this.pdfUrl,
    this.isPrinting = false,
    this.fromDateDisplay = '',
    this.toDateDisplay = '',
  });

  PartyLedgerState copyWith({
    List<LedgerStatementEntity>? statements,
    List<int>? printableFeatureIds,
    List<PartyListItemEntity>? parties,
    ApiStatus? apiStatus,
    ApiStatus? pdfStatus,
    ApiStatus? partiesStatus,
    String? message,
    String? pdfUrl,
    bool? isPrinting,
    String? fromDateDisplay,
    String? toDateDisplay,
  }) {
    return PartyLedgerState(
      statements:          statements          ?? this.statements,
      printableFeatureIds: printableFeatureIds ?? this.printableFeatureIds,
      parties:             parties             ?? this.parties,
      apiStatus:           apiStatus           ?? this.apiStatus,
      pdfStatus:           pdfStatus           ?? this.pdfStatus,
      partiesStatus:       partiesStatus       ?? this.partiesStatus,
      message:             message             ?? this.message,
      pdfUrl:              pdfUrl              ?? this.pdfUrl,
      isPrinting:          isPrinting          ?? this.isPrinting,
      fromDateDisplay:     fromDateDisplay     ?? this.fromDateDisplay,
      toDateDisplay:       toDateDisplay       ?? this.toDateDisplay,
    );
  }

  bool canPrint(int featureId) => printableFeatureIds.contains(featureId);

  @override
  List<Object?> get props => [
        statements,
        printableFeatureIds,
        parties,
        apiStatus,
        pdfStatus,
        partiesStatus,
        message,
        pdfUrl,
        isPrinting,
        fromDateDisplay,
        toDateDisplay,
      ];
}
