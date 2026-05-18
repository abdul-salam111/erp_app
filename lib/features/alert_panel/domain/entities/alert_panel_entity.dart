import 'package:equatable/equatable.dart';

class AlertPanelEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const AlertPanelEntity({required this.id});

  @override
  List<Object> get props => [id];
}
