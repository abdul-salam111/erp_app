import 'package:equatable/equatable.dart';

abstract class OvertimeEvent extends Equatable {
  const OvertimeEvent();

  @override
  List<Object> get props => [];
}

class OvertimeSubmitted extends OvertimeEvent {}
