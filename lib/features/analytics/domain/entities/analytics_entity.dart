import 'package:equatable/equatable.dart';

class AnalyticsEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const AnalyticsEntity({required this.id});

  @override
  List<Object> get props => [id];
}
