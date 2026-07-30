import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/accounts/due_receipt_count_entity.dart';
import '../../../domain/entities/accounts/recovery_invoice_entity.dart';

enum FilterType { today, week, month, oldest }

class AccountsState extends Equatable {
  static const int pageSize = 10;

  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final bool todayOverviewExpanded;
  final FilterType selectedFilter;
  final DueReceiptCountEntity? recoveryDue;
  final ApiStatus recoveryDueStatus;
  final String? recoveryDueError;
  final int currentPage;
  final String searchQuery;

  const AccountsState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.todayOverviewExpanded,
    this.selectedFilter = FilterType.today,
    this.recoveryDue,
    this.recoveryDueStatus = ApiStatus.INITIAL,
    this.recoveryDueError,
    this.currentPage = 0,
    this.searchQuery = '',
  });

  List<RecoveryInvoiceEntity> get filteredInvoices {
    final all = recoveryDue?.invoices ?? const [];
    if (searchQuery.isEmpty) return all;
    final q = searchQuery.toLowerCase();
    return all
        .where((inv) =>
            inv.party.fullName.toLowerCase().contains(q) ||
            inv.docNbr.toLowerCase().contains(q))
        .toList();
  }

  int get totalPages {
    final count = filteredInvoices.length;
    if (count == 0) return 1;
    return (count / pageSize).ceil();
  }

  List<RecoveryInvoiceEntity> get pagedInvoices {
    final all = filteredInvoices;
    final start = currentPage * pageSize;
    if (start >= all.length) return const [];
    final end = (start + pageSize).clamp(0, all.length);
    return all.sublist(start, end);
  }

  AccountsState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    bool? todayOverviewExpanded,
    FilterType? selectedFilter,
    DueReceiptCountEntity? recoveryDue,
    ApiStatus? recoveryDueStatus,
    String? recoveryDueError,
    int? currentPage,
    String? searchQuery,
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
      currentPage:           currentPage           ?? this.currentPage,
      searchQuery:           searchQuery           ?? this.searchQuery,
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
        currentPage,
        searchQuery,
      ];
}
