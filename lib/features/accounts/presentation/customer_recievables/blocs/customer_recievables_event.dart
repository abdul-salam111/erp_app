import 'package:equatable/equatable.dart';

abstract class CustomerRecievablesEvent extends Equatable {
  const CustomerRecievablesEvent();

  @override
  List<Object?> get props => [];
}

class CustomerRecievablesSubmitted extends CustomerRecievablesEvent {
  final String fromDate;
  final String toDate;

  const CustomerRecievablesSubmitted({
    required this.fromDate,
    required this.toDate,
  });

  @override
  List<Object?> get props => [fromDate, toDate];
}

class CustomerRecievablesPartiesFetched extends CustomerRecievablesEvent {
  const CustomerRecievablesPartiesFetched();
}
