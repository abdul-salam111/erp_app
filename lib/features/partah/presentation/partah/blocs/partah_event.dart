import 'package:equatable/equatable.dart';

abstract class PartahEvent extends Equatable {
  const PartahEvent();

  @override
  List<Object?> get props => [];
}

class PartahFromDateChanged extends PartahEvent {
  final DateTime date;
  const PartahFromDateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class PartahToDateChanged extends PartahEvent {
  final DateTime date;
  const PartahToDateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class PartahReportRequested extends PartahEvent {
  const PartahReportRequested();
}
