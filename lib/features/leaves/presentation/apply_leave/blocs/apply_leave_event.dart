import 'package:equatable/equatable.dart';

abstract class ApplyLeaveEvent extends Equatable {
  const ApplyLeaveEvent();

  @override
  List<Object?> get props => [];
}

class ApplyLeaveSubmitted extends ApplyLeaveEvent {
  final String requestDate;
  final String fromDate;
  final String toDate;
  final String leaveType;
  final String detail;

  const ApplyLeaveSubmitted({
    required this.requestDate,
    required this.fromDate,
    required this.toDate,
    required this.leaveType,
    required this.detail,
  });

  @override
  List<Object?> get props => [requestDate, fromDate, toDate, leaveType, detail];
}
