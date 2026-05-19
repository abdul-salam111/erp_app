import 'package:equatable/equatable.dart';

class AccountsEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const AccountsEntity({required this.id});

  @override
  List<Object> get props => [id];
}
