import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable {
  const RolesEvent();

  @override
  List<Object?> get props => [];
}

class RolesListFetched extends RolesEvent {
  const RolesListFetched();
}
