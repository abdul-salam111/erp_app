import 'package:equatable/equatable.dart';
import 'accounts_state.dart';

abstract class AccountsEvent extends Equatable {
  const AccountsEvent();

  @override
  List<Object> get props => [];
}

class AccountsSubmitted extends AccountsEvent {}

final class TodayOverviewExpansionToggled extends AccountsEvent {
  const TodayOverviewExpansionToggled();
}

final class RecoveryFilterChanged extends AccountsEvent {
  final FilterType filter;
  const RecoveryFilterChanged(this.filter);

  @override
  List<Object> get props => [filter];
}

final class RecoveryDueFetched extends AccountsEvent {
  final FilterType filter;
  const RecoveryDueFetched({this.filter = FilterType.today});

  @override
  List<Object> get props => [filter];
}
