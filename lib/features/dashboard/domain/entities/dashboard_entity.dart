import 'package:equatable/equatable.dart';

class DashboardEntity extends Equatable {
  final String id;

  const DashboardEntity({required this.id});

  @override
  List<Object> get props => [id];
}
