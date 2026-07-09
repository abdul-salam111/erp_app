import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/purchase_order_entity.dart';

class PurchaseOrderState extends Equatable {
  final List<PurchaseOrderEntity> orders;
  final String? message;
  final ApiStatus apiStatus;

  const PurchaseOrderState({
    this.orders = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  PurchaseOrderState copyWith({
    List<PurchaseOrderEntity>? orders,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return PurchaseOrderState(
      orders: orders ?? this.orders,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [orders, message, apiStatus];
}
