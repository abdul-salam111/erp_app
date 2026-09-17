import 'package:equatable/equatable.dart';

abstract class NewUserEvent extends Equatable {
  const NewUserEvent();

  @override
  List<Object?> get props => [];
}

/// Loads reference data (landing pages, roles) plus the user detail when
/// [userId] is provided (edit / view modes).
class NewUserFormLoaded extends NewUserEvent {
  final int? userId;
  final int tenantId;

  const NewUserFormLoaded({required this.tenantId, this.userId});

  @override
  List<Object?> get props => [userId, tenantId];
}
