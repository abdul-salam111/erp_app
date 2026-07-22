import 'package:equatable/equatable.dart';

class LoanAndAdvanceEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const LoanAndAdvanceEntity({required this.id});

  @override
  List<Object> get props => [id];
}
