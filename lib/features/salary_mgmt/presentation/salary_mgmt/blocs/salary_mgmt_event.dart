import 'package:equatable/equatable.dart';

abstract class SalaryMgmtEvent extends Equatable {
  const SalaryMgmtEvent();

  @override
  List<Object> get props => [];
}

class SalaryMgmtSubmitted extends SalaryMgmtEvent {}
