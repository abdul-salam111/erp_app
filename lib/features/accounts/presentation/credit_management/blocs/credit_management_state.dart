import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/credit_managment/customer_receivable_aging_entity.dart';
import '../../../domain/entities/party_ledger/party_list_item_entity.dart';

class CreditManagementState extends Equatable {
  final CustomerReceivableAgingEntity? agingData;
  final String? message;
  final ApiStatus apiStatus;
  final DateTime date;
  final List<PartyListItemEntity> parties;
  final ApiStatus partiesStatus;
  final int? selectedPartyId;
  final bool filterCollapsed;

  const CreditManagementState({
    this.agingData,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.date,
    this.parties = const [],
    this.partiesStatus = ApiStatus.INITIAL,
    this.selectedPartyId,
    this.filterCollapsed = false,
  });

  CreditManagementState copyWith({
    CustomerReceivableAgingEntity? agingData,
    String? message,
    ApiStatus? apiStatus,
    DateTime? date,
    List<PartyListItemEntity>? parties,
    ApiStatus? partiesStatus,
    int? selectedPartyId,
    bool clearSelectedPartyId = false,
    bool clearMessage = false,
    bool? filterCollapsed,
  }) {
    return CreditManagementState(
      agingData:       agingData       ?? this.agingData,
      message:         clearMessage ? null : (message ?? this.message),
      apiStatus:       apiStatus       ?? this.apiStatus,
      date:            date            ?? this.date,
      parties:         parties         ?? this.parties,
      partiesStatus:   partiesStatus   ?? this.partiesStatus,
      selectedPartyId: clearSelectedPartyId ? null : (selectedPartyId ?? this.selectedPartyId),
      filterCollapsed: filterCollapsed ?? this.filterCollapsed,
    );
  }

  @override
  List<Object?> get props => [
        agingData,
        message,
        apiStatus,
        date,
        parties,
        partiesStatus,
        selectedPartyId,
        filterCollapsed,
      ];
}
