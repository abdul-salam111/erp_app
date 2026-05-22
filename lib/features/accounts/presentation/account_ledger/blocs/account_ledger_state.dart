import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../accounts_exports.dart';


class AccountLedgerState extends Equatable {
  final List<AccountLedgerModel> statements;
  final List<int> printableFeatureIds;
  final ApiStatus apiStatus;
  final ApiStatus pdfStatus;
  final String? message;
  final String? pdfUrl;
  final bool isPrinting;

  const AccountLedgerState({
    this.statements = const [],
    this.printableFeatureIds = const [],
    this.apiStatus = ApiStatus.INITIAL,
    this.pdfStatus = ApiStatus.INITIAL,
    this.message,
    this.pdfUrl,
    this.isPrinting = false,
  });

  AccountLedgerState copyWith({
    List<AccountLedgerModel>? statements,
    List<int>? printableFeatureIds,
    ApiStatus? apiStatus,
    ApiStatus? pdfStatus,
    String? message,
    String? pdfUrl,
    bool? isPrinting,
  }) {
    return AccountLedgerState(
      statements: statements ?? this.statements,
      printableFeatureIds: printableFeatureIds ?? this.printableFeatureIds,
      apiStatus: apiStatus ?? this.apiStatus,
      pdfStatus: pdfStatus ?? this.pdfStatus,
      message: message ?? this.message,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      isPrinting: isPrinting ?? this.isPrinting,
    );
  }

  bool canPrint(int featureId) => printableFeatureIds.contains(featureId);

  @override
  List<Object?> get props => [
    statements,
    printableFeatureIds,
    apiStatus,
    pdfStatus,
    message,
    pdfUrl,
    isPrinting,
  ];
}
