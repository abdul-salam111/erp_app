import 'package:equatable/equatable.dart';

class DashboardEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const DashboardEntity({required this.id});

  @override
  List<Object> get props => [id];
}
