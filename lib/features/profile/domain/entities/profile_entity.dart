import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const ProfileEntity({required this.id});

  @override
  List<Object> get props => [id];
}
