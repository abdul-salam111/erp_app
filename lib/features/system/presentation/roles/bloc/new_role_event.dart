import 'package:equatable/equatable.dart';

abstract class NewRoleEvent extends Equatable {
  const NewRoleEvent();

  @override
  List<Object?> get props => [];
}

class NewRoleFormLoaded extends NewRoleEvent {
  final int? roleId;

  const NewRoleFormLoaded({this.roleId});

  @override
  List<Object?> get props => [roleId];
}

class NewRoleSubmitted extends NewRoleEvent {
  final Map<String, dynamic> payload;

  const NewRoleSubmitted(this.payload);

  @override
  List<Object?> get props => [payload];
}
