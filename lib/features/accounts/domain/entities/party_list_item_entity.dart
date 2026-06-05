import 'package:equatable/equatable.dart';

class PartyListItemEntity extends Equatable {
  final int id;
  final String name;
  final String partyType;

  const PartyListItemEntity({
    required this.id,
    required this.name,
    required this.partyType,
  });

  @override
  List<Object> get props => [id, name, partyType];
}
