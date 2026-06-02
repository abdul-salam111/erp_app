import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../data/models/response_models/get_due_receipt_count/due_receipt_count_model.dart';

enum FilterType { today, oldest }

class AccountsState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final bool todayOverviewExpanded;
  final FilterType selectedFilter;
  final DueReceiptCountModel? recoveryDue;
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
    DueReceiptCountModel? recoveryDue,
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
    data, message, apiStatus, todayOverviewExpanded,
    selectedFilter, recoveryDue, recoveryDueStatus, recoveryDueError,
  ];
}
