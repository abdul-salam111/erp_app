import 'dart:math';

import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/production_entity.dart';

class ProductionState extends Equatable {
  final List<ProductionEntity> orders;
  final String? message;
  final ApiStatus apiStatus;
  final String searchQuery;
  final int currentPage;
  final int pageSize;

  const ProductionState({
    this.orders = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.searchQuery = '',
    this.currentPage = 1,
    this.pageSize = 15,
  });

  List<ProductionEntity> get filteredOrders {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return orders;
    return orders
        .where(
          (o) =>
              o.docNumber.toLowerCase().contains(query) ||
              (o.consumptionDoc?.toLowerCase().contains(query) ?? false) ||
              (o.itemName?.toLowerCase().contains(query) ?? false),
        )
        .toList();
  }

  bool get hasMore => currentPage * pageSize < filteredOrders.length;

  List<ProductionEntity> get pagedOrders {
    final filtered = filteredOrders;
    return filtered.sublist(0, min(currentPage * pageSize, filtered.length));
  }

  ProductionState copyWith({
    List<ProductionEntity>? orders,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
    String? searchQuery,
    int? currentPage,
    int? pageSize,
  }) {
    return ProductionState(
      orders: orders ?? this.orders,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
      searchQuery: searchQuery ?? this.searchQuery,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [
        orders,
        message,
        apiStatus,
        searchQuery,
        currentPage,
        pageSize,
      ];
}
