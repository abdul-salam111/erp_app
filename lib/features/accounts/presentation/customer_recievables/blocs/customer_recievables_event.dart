import 'package:equatable/equatable.dart';

abstract class CustomerRecievablesEvent extends Equatable {
  const CustomerRecievablesEvent();

  @override
  List<Object> get props => [];
}

class CustomerRecievablesSubmitted extends CustomerRecievablesEvent {
  const CustomerRecievablesSubmitted();
}
