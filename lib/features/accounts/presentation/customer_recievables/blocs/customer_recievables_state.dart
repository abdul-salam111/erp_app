import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/customer_recievables/customer_receivable_item_entity.dart';

class CustomerRecievablesState extends Equatable {
  final List<CustomerReceivableItemEntity> items;
  final String? message;
  final ApiStatus apiStatus;

  const CustomerRecievablesState({
    this.items = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  CustomerRecievablesState copyWith({
    List<CustomerReceivableItemEntity>? items,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
  }) {
    return CustomerRecievablesState(
      items: items ?? this.items,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [items, message, apiStatus];
}
