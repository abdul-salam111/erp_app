import 'package:equatable/equatable.dart';

abstract class PartahEvent extends Equatable {
  const PartahEvent();

  @override
  List<Object> get props => [];
}

class PartahSubmitted extends PartahEvent {}
