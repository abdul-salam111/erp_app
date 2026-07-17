import 'dart:math';

import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/purchase_order_entity.dart';

class PurchaseOrderState extends Equatable {
  final List<PurchaseOrderEntity> orders;
  final String? message;
  final ApiStatus apiStatus;
  final int currentPage;
  final int pageSize;

  const PurchaseOrderState({
    this.orders = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.currentPage = 1,
    this.pageSize = 10,
  });

  int get totalPages => max(1, (orders.length / pageSize).ceil());

  List<PurchaseOrderEntity> get pagedOrders {
    final start = (currentPage - 1) * pageSize;
    if (start >= orders.length) return const [];
    return orders.sublist(start, min(start + pageSize, orders.length));
  }

  PurchaseOrderState copyWith({
    List<PurchaseOrderEntity>? orders,
    String? message,
    ApiStatus? apiStatus,
    int? currentPage,
    int? pageSize,
  }) {
    return PurchaseOrderState(
      orders: orders ?? this.orders,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [orders, message, apiStatus, currentPage, pageSize];
}
