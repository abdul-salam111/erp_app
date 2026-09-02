import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../models/overtime_record.dart';

class OvertimeState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final List<OvertimeRecord> records;

  OvertimeState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    List<OvertimeRecord>? records,
  }) : records = records ?? dummyOvertimeRecords;

  OvertimeState copyWith({
    dynamic data,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
    List<OvertimeRecord>? records,
  }) {
    return OvertimeState(
      data: data ?? this.data,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus, records];
}
