import 'package:equatable/equatable.dart';

class SecurityEntity extends Equatable {
  final String id;

  const SecurityEntity({required this.id});

  @override
  List<Object> get props => [id];
}
