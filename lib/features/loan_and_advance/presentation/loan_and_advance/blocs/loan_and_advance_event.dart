import 'package:equatable/equatable.dart';

abstract class LoanAndAdvanceEvent extends Equatable {
  const LoanAndAdvanceEvent();

  @override
  List<Object> get props => [];
}

class LoanAndAdvanceFetched extends LoanAndAdvanceEvent {
  const LoanAndAdvanceFetched();
}
