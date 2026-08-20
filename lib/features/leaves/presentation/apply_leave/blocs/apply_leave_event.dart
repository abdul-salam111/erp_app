import 'package:equatable/equatable.dart';

abstract class ApplyLeaveEvent extends Equatable {
  const ApplyLeaveEvent();

  @override
  List<Object?> get props => [];
}

class ApplyLeaveSubmitted extends ApplyLeaveEvent {
  final String fromDate;
  final String toDate;
  final int? leavePolicyId;
  final String reason;
  final List<int> attachmentFileIds;

  const ApplyLeaveSubmitted({
    required this.fromDate,
    required this.toDate,
    required this.leavePolicyId,
    required this.reason,
    this.attachmentFileIds = const [],
  });

  @override
  List<Object?> get props =>
      [fromDate, toDate, leavePolicyId, reason, attachmentFileIds];
}
