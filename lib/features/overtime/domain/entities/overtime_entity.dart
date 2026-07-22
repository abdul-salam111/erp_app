import 'package:equatable/equatable.dart';

class OvertimeEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const OvertimeEntity({required this.id});

  @override
  List<Object> get props => [id];
}
