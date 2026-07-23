import 'package:equatable/equatable.dart';

abstract class ApplyOvertimeEvent extends Equatable {
  const ApplyOvertimeEvent();
  @override
  List<Object?> get props => [];
}

class ApplyOvertimeSubmitted extends ApplyOvertimeEvent {
  final String date;
  final double hours;
  final String overtimeType;
  final String reason;

  const ApplyOvertimeSubmitted({
    required this.date,
    required this.hours,
    required this.overtimeType,
    required this.reason,
  });

  @override
  List<Object?> get props => [date, hours, overtimeType, reason];
}
