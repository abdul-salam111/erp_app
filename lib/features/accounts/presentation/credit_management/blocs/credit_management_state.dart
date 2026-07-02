import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/party_list_item_entity.dart';

class CreditManagementState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final DateTime date;
  final List<PartyListItemEntity> parties;
  final ApiStatus partiesStatus;
  final int? selectedPartyId;
  final bool filterCollapsed;

  const CreditManagementState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.date,
    this.parties = const [],
    this.partiesStatus = ApiStatus.INITIAL,
    this.selectedPartyId,
    this.filterCollapsed = false,
  });

  CreditManagementState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    DateTime? date,
    List<PartyListItemEntity>? parties,
    ApiStatus? partiesStatus,
    int? selectedPartyId,
    bool? filterCollapsed,
  }) {
    return CreditManagementState(
      data:            data            ?? this.data,
      message:         message         ?? this.message,
      apiStatus:       apiStatus       ?? this.apiStatus,
      date:            date            ?? this.date,
      parties:         parties         ?? this.parties,
      partiesStatus:   partiesStatus   ?? this.partiesStatus,
      selectedPartyId: selectedPartyId ?? this.selectedPartyId,
      filterCollapsed: filterCollapsed ?? this.filterCollapsed,
    );
  }

  @override
  List<Object?> get props => [
        data,
        message,
        apiStatus,
        date,
        parties,
        partiesStatus,
        selectedPartyId,
        filterCollapsed,
      ];
}
