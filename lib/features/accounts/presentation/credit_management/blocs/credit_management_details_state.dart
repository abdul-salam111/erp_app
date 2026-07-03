part of 'credit_management_details_cubit.dart';

class CreditManagementDetailsState extends Equatable {
  final ApiStatus summaryStatus;
  final List<PartyCreditMonthlySummaryEntity> summaryItems;
  final String? summaryMessage;

  final ApiStatus unpaidStatus;
  final List<PartyUnpaidDebitEntity> unpaidItems;
  final String? unpaidMessage;

  final ApiStatus receiptsStatus;
  final List<PartyTopReceiptEntity> receiptsItems;
  final String? receiptsMessage;

  final ApiStatus revenueStatus;
  final PartyRevenueAndRecoveryEntity? revenueData;
  final String? revenueMessage;

  const CreditManagementDetailsState({
    this.summaryStatus = ApiStatus.INITIAL,
    this.summaryItems = const [],
    this.summaryMessage,
    this.unpaidStatus = ApiStatus.INITIAL,
    this.unpaidItems = const [],
    this.unpaidMessage,
    this.receiptsStatus = ApiStatus.INITIAL,
    this.receiptsItems = const [],
    this.receiptsMessage,
    this.revenueStatus = ApiStatus.INITIAL,
    this.revenueData,
    this.revenueMessage,
  });

  CreditManagementDetailsState copyWith({
    ApiStatus? summaryStatus,
    List<PartyCreditMonthlySummaryEntity>? summaryItems,
    String? summaryMessage,
    bool clearSummaryMessage = false,
    ApiStatus? unpaidStatus,
    List<PartyUnpaidDebitEntity>? unpaidItems,
    String? unpaidMessage,
    bool clearUnpaidMessage = false,
    ApiStatus? receiptsStatus,
    List<PartyTopReceiptEntity>? receiptsItems,
    String? receiptsMessage,
    bool clearReceiptsMessage = false,
    ApiStatus? revenueStatus,
    PartyRevenueAndRecoveryEntity? revenueData,
    String? revenueMessage,
    bool clearRevenueMessage = false,
  }) {
    return CreditManagementDetailsState(
      summaryStatus: summaryStatus ?? this.summaryStatus,
      summaryItems: summaryItems ?? this.summaryItems,
      summaryMessage: clearSummaryMessage ? null : (summaryMessage ?? this.summaryMessage),
      unpaidStatus: unpaidStatus ?? this.unpaidStatus,
      unpaidItems: unpaidItems ?? this.unpaidItems,
      unpaidMessage: clearUnpaidMessage ? null : (unpaidMessage ?? this.unpaidMessage),
      receiptsStatus: receiptsStatus ?? this.receiptsStatus,
      receiptsItems: receiptsItems ?? this.receiptsItems,
      receiptsMessage: clearReceiptsMessage ? null : (receiptsMessage ?? this.receiptsMessage),
      revenueStatus: revenueStatus ?? this.revenueStatus,
      revenueData: revenueData ?? this.revenueData,
      revenueMessage: clearRevenueMessage ? null : (revenueMessage ?? this.revenueMessage),
    );
  }

  @override
  List<Object?> get props => [
        summaryStatus, summaryItems, summaryMessage,
        unpaidStatus, unpaidItems, unpaidMessage,
        receiptsStatus, receiptsItems, receiptsMessage,
        revenueStatus, revenueData, revenueMessage,
      ];
}
