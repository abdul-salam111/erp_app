import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/due_receipt_count_entity.dart';

enum FilterType { today, week, month, oldest }

class AccountsState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final bool todayOverviewExpanded;
  final FilterType selectedFilter;
  final DueReceiptCountEntity? recoveryDue;
  final ApiStatus recoveryDueStatus;
  final String? recoveryDueError;

  const AccountsState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.todayOverviewExpanded,
    this.selectedFilter = FilterType.today,
    this.recoveryDue,
    this.recoveryDueStatus = ApiStatus.INITIAL,
    this.recoveryDueError,
  });

  AccountsState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    bool? todayOverviewExpanded,
    FilterType? selectedFilter,
    DueReceiptCountEntity? recoveryDue,
    ApiStatus? recoveryDueStatus,
    String? recoveryDueError,
  }) {
    return AccountsState(
      data:                  data                  ?? this.data,
      message:               message               ?? this.message,
      apiStatus:             apiStatus             ?? this.apiStatus,
      todayOverviewExpanded: todayOverviewExpanded ?? this.todayOverviewExpanded,
      selectedFilter:        selectedFilter        ?? this.selectedFilter,
      recoveryDue:           recoveryDue           ?? this.recoveryDue,
      recoveryDueStatus:     recoveryDueStatus     ?? this.recoveryDueStatus,
      recoveryDueError:      recoveryDueError      ?? this.recoveryDueError,
    );
  }

  @override
  List<Object?> get props => [
        data,
        message,
        apiStatus,
        todayOverviewExpanded,
        selectedFilter,
        recoveryDue,
        recoveryDueStatus,
        recoveryDueError,
      ];
}
