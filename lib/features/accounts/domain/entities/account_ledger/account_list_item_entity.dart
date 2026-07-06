import 'package:equatable/equatable.dart';

class AccountListItemEntity extends Equatable {
  final int id;
  final String name;
  final String group;
 

  const AccountListItemEntity({
    required this.id,
    required this.name,
    required this.group,
  
  });

  @override
  List<Object> get props => [id, name, group];
}
