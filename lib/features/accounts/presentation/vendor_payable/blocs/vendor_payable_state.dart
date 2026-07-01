import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/customer_receivable_item_entity.dart';

class VendorPayableState extends Equatable {
  final List<CustomerReceivableItemEntity> items;
  final String? message;
  final ApiStatus apiStatus;

  const VendorPayableState({
    this.items = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  VendorPayableState copyWith({
    List<CustomerReceivableItemEntity>? items,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return VendorPayableState(
      items:     items     ?? this.items,
      message:   message   ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [items, message, apiStatus];
}
