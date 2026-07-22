import 'package:equatable/equatable.dart';

abstract class LeavesEvent extends Equatable {
  const LeavesEvent();

  @override
  List<Object> get props => [];
}

class LeavesSubmitted extends LeavesEvent {}
