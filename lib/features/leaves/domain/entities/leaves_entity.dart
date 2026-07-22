import 'package:equatable/equatable.dart';

class LeavesEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const LeavesEntity({required this.id});

  @override
  List<Object> get props => [id];
}
