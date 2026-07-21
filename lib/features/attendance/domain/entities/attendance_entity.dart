import 'package:equatable/equatable.dart';

class AttendanceEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const AttendanceEntity({required this.id});

  @override
  List<Object> get props => [id];
}
