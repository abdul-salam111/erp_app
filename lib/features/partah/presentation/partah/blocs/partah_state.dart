import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/partah_report_entity.dart';

class PartahState extends Equatable {
  final DateTime fromDate;
  final DateTime toDate;
  final ApiStatus loadStatus;
  final PartahReportEntity? report;
  final String? errorMessage;

  const PartahState({
    required this.fromDate,
    required this.toDate,
    this.loadStatus = ApiStatus.INITIAL,
    this.report,
    this.errorMessage,
  });

  PartahState copyWith({
    DateTime? fromDate,
    DateTime? toDate,
    ApiStatus? loadStatus,
    PartahReportEntity? report,
    String? errorMessage,
  }) {
    return PartahState(
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      loadStatus: loadStatus ?? this.loadStatus,
      report: report ?? this.report,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [fromDate, toDate, loadStatus, report, errorMessage];
}
