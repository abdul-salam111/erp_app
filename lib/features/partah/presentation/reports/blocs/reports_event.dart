import 'package:equatable/equatable.dart';

abstract class ReportsEvent extends Equatable {
  const ReportsEvent();

  @override
  List<Object?> get props => [];
}

class ReportsStarted extends ReportsEvent {}

class ReportDeleteRequested extends ReportsEvent {
  final String id;
  const ReportDeleteRequested(this.id);

  @override
  List<Object?> get props => [id];
}
