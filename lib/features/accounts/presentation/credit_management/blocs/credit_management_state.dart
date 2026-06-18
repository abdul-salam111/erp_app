import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';

class CreditManagementState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final DateTime date;
  final String? financialYear;
  final String? customerType;
  final String? groupOn;
  final String? creditRating;
  final bool filterCollapsed;

  const CreditManagementState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.date,
    this.financialYear,
    this.customerType,
    this.groupOn,
    this.creditRating,
    this.filterCollapsed = false,
  });

  CreditManagementState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    DateTime? date,
    String? financialYear,
    String? customerType,
    String? groupOn,
    String? creditRating,
    bool? filterCollapsed,
  }) {
    return CreditManagementState(
      data:             data             ?? this.data,
      message:          message          ?? this.message,
      apiStatus:        apiStatus        ?? this.apiStatus,
      date:             date             ?? this.date,
      financialYear:    financialYear    ?? this.financialYear,
      customerType:     customerType     ?? this.customerType,
      groupOn:          groupOn          ?? this.groupOn,
      creditRating:     creditRating     ?? this.creditRating,
      filterCollapsed:  filterCollapsed  ?? this.filterCollapsed,
    );
  }

  @override
  List<Object?> get props => [
        data,
        message,
        apiStatus,
        date,
        financialYear,
        customerType,
        groupOn,
        creditRating,
        filterCollapsed,
      ];
}
