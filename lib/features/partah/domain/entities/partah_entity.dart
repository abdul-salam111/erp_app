import 'package:equatable/equatable.dart';

class PartahEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const PartahEntity({required this.id});

  @override
  List<Object> get props => [id];
}
