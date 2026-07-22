import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object?> get props => [];
}

class AttendanceMonthChanged extends AttendanceEvent {
  final DateTime month;
  const AttendanceMonthChanged(this.month);

  @override
  List<Object?> get props => [month];
}

class AttendanceSubmitted extends AttendanceEvent {
  const AttendanceSubmitted();
}
