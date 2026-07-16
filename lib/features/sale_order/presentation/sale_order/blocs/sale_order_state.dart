import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/sale_order_entity.dart';

class SaleOrderState extends Equatable {
  final List<SaleOrderEntity> orders;
  final String? message;
  final ApiStatus apiStatus;

  const SaleOrderState({
    this.orders = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  SaleOrderState copyWith({
    List<SaleOrderEntity>? orders,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return SaleOrderState(
      orders: orders ?? this.orders,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [orders, message, apiStatus];
}
