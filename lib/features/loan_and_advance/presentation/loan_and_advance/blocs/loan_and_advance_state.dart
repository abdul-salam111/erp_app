import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../models/loan_record.dart';

class LoanAndAdvanceState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final List<LoanRecord> records;

  LoanAndAdvanceState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    List<LoanRecord>? records,
  }) : records = records ?? dummyLoanRecords;

  LoanAndAdvanceState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    List<LoanRecord>? records,
  }) {
    return LoanAndAdvanceState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus, records];
}
