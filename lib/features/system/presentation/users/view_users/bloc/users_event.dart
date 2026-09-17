import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UsersListFetched extends UsersEvent {
  const UsersListFetched();
}

class UserDeleteRequested extends UsersEvent {
  final int id;

  const UserDeleteRequested(this.id);

  @override
  List<Object> get props => [id];
}
