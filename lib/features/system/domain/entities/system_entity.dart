import 'package:equatable/equatable.dart';

class SystemEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const SystemEntity({required this.id});

  @override
  List<Object> get props => [id];
}
