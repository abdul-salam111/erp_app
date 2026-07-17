import 'dart:math';

import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/sale_order_entity.dart';

class SaleOrderState extends Equatable {
  final List<SaleOrderEntity> orders;
  final String? message;
  final ApiStatus apiStatus;
  final String searchQuery;
  final int currentPage;
  final int pageSize;

  const SaleOrderState({
    this.orders = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.searchQuery = '',
    this.currentPage = 1,
    this.pageSize = 15,
  });

  List<SaleOrderEntity> get filteredOrders {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return orders;
    return orders
        .where((o) =>
            o.docNumber.toLowerCase().contains(query) ||
            (o.refNo?.toLowerCase().contains(query) ?? false))
        .toList();
  }

  bool get hasMore => currentPage * pageSize < filteredOrders.length;

  List<SaleOrderEntity> get pagedOrders {
    final filtered = filteredOrders;
    return filtered.sublist(0, min(currentPage * pageSize, filtered.length));
  }

  SaleOrderState copyWith({
    List<SaleOrderEntity>? orders,
    String? message,
    ApiStatus? apiStatus,
    String? searchQuery,
    int? currentPage,
    int? pageSize,
  }) {
    return SaleOrderState(
      orders: orders ?? this.orders,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      searchQuery: searchQuery ?? this.searchQuery,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props =>
      [orders, message, apiStatus, searchQuery, currentPage, pageSize];
}
