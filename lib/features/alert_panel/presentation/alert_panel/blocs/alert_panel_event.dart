import 'package:equatable/equatable.dart';


abstract class AlertPanelEvent extends Equatable {
  const AlertPanelEvent();

  @override
  List<Object> get props => [];
}

class AlertPanelSubmitted extends AlertPanelEvent {}
