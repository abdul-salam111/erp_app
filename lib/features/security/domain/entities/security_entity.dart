import 'package:equatable/equatable.dart';

class SecurityEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const SecurityEntity({required this.id});

  @override
  List<Object> get props => [id];
}
