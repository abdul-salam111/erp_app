import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/customer_receivable_item_entity.dart';
import '../../../domain/entities/party_list_item_entity.dart';

class CustomerRecievablesState extends Equatable {
  final List<CustomerReceivableItemEntity> items;
  final List<PartyListItemEntity> parties;
  final String? message;
  final ApiStatus apiStatus;
  final ApiStatus partiesStatus;

  const CustomerRecievablesState({
    this.items = const [],
    this.parties = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.partiesStatus = ApiStatus.INITIAL,
  });

  CustomerRecievablesState copyWith({
    List<CustomerReceivableItemEntity>? items,
    List<PartyListItemEntity>? parties,
    String? message,
    ApiStatus? apiStatus,
    ApiStatus? partiesStatus,
  }) {
    return CustomerRecievablesState(
      items: items ?? this.items,
      parties: parties ?? this.parties,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      partiesStatus: partiesStatus ?? this.partiesStatus,
    );
  }

  @override
  List<Object?> get props => [items, parties, message, apiStatus, partiesStatus];
}
