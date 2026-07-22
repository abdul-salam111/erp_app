import 'package:equatable/equatable.dart';

abstract class LeavesEvent extends Equatable {
  const LeavesEvent();

  @override
  List<Object?> get props => [];
}

class LeavesMonthChanged extends LeavesEvent {
  final DateTime month;
  const LeavesMonthChanged(this.month);

  @override
  List<Object?> get props => [month];
}

class LeavesSubmitted extends LeavesEvent {
  const LeavesSubmitted();
}
