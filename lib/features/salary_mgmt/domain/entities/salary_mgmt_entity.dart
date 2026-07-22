import 'package:equatable/equatable.dart';

class SalaryMgmtEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const SalaryMgmtEntity({required this.id});

  @override
  List<Object> get props => [id];
}
