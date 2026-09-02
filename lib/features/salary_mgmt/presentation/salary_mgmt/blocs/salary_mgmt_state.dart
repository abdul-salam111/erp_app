import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../models/salary_record.dart';

class SalaryMgmtState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final List<SalaryRecord> records;

  SalaryMgmtState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    List<SalaryRecord>? records,
  }) : records = records ?? dummySalaryRecords;

  SalaryMgmtState copyWith({
    dynamic data,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
    List<SalaryRecord>? records,
  }) {
    return SalaryMgmtState(
      data: data ?? this.data,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus, records];
}
