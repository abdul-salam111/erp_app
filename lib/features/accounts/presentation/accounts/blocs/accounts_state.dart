import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

enum FilterType { today, oldest }

class AccountsState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final bool todayOverviewExpanded;
  final FilterType selectedFilter;

  const AccountsState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.todayOverviewExpanded,
    this.selectedFilter = FilterType.today,
  });

  AccountsState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    bool? todayOverviewExpanded,
    FilterType? selectedFilter,
  }) {
    return AccountsState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      todayOverviewExpanded:
          todayOverviewExpanded ?? this.todayOverviewExpanded,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props =>
      [data, message, apiStatus, todayOverviewExpanded, selectedFilter];
}
