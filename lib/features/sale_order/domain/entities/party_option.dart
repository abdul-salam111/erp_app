import 'package:equatable/equatable.dart';

class PartyOption extends Equatable {
  final int id;
  final String name;

  const PartyOption({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
