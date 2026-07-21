import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/credit_managment/party_credit_monthly_summary_entity.dart';
import '../../../domain/entities/credit_managment/party_revenue_and_recovery_entity.dart';
import '../../../domain/entities/credit_managment/party_top_receipt_entity.dart';
import '../../../domain/entities/credit_managment/party_unpaid_debit_entity.dart';
import '../../../domain/usecases/credit_management/get_party_credit_monthly_summary_usecase.dart';
import '../../../domain/usecases/credit_management/get_party_revenue_and_recovery_usecase.dart';
import '../../../domain/usecases/credit_management/get_party_top_receipts_usecase.dart';
import '../../../domain/usecases/credit_management/get_party_unpaid_debits_usecase.dart';

part 'credit_management_details_state.dart';

class CreditManagementDetailsCubit
    extends Cubit<CreditManagementDetailsState> {
  final GetPartyCreditMonthlySummaryUsecase _summaryUsecase;
  final GetPartyUnpaidDebitsUsecase _unpaidUsecase;
  final GetPartyTopReceiptsUsecase _receiptsUsecase;
  final GetPartyRevenueAndRecoveryUsecase _revenueUsecase;

  CreditManagementDetailsCubit({
    required GetPartyCreditMonthlySummaryUsecase summaryUsecase,
    required GetPartyUnpaidDebitsUsecase unpaidUsecase,
    required GetPartyTopReceiptsUsecase receiptsUsecase,
    required GetPartyRevenueAndRecoveryUsecase revenueUsecase,
  })  : _summaryUsecase = summaryUsecase,
        _unpaidUsecase = unpaidUsecase,
        _receiptsUsecase = receiptsUsecase,
        _revenueUsecase = revenueUsecase,
        super(const CreditManagementDetailsState());

  Future<void> fetch({required String toDate, required int partyId}) async {
    emit(state.copyWith(
      summaryStatus: ApiStatus.LOADING,
      unpaidStatus: ApiStatus.LOADING,
      receiptsStatus: ApiStatus.LOADING,
      revenueStatus: ApiStatus.LOADING,
    ));

    await Future.wait([
      _fetchSummary(toDate: toDate, partyId: partyId),
      _fetchUnpaid(toDate: toDate, partyId: partyId),
      _fetchReceipts(toDate: toDate, partyId: partyId),
      _fetchRevenue(toDate: toDate, partyId: partyId),
    ]);
  }

  Future<void> _fetchSummary({
    required String toDate,
    required int partyId,
  }) async {
    final result = await _summaryUsecase(
      GetPartyCreditMonthlySummaryParams(toDate: toDate, partyId: partyId),
    );
    if (isClosed) return;
    result.when(
      failure: (f) => emit(state.copyWith(
        summaryStatus: ApiStatus.FAILURE,
        summaryMessage: f.message,
        summaryItems: [],
      )),
      success: (items) => emit(state.copyWith(
        summaryStatus: ApiStatus.SUCCESS,
        summaryItems: items,
        clearSummaryMessage: true,
      )),
    );
  }

  Future<void> _fetchUnpaid({
    required String toDate,
    required int partyId,
  }) async {
    final result = await _unpaidUsecase(
      GetPartyUnpaidDebitsParams(toDate: toDate, partyId: partyId),
    );
    if (isClosed) return;
    result.when(
      failure: (f) => emit(state.copyWith(
        unpaidStatus: ApiStatus.FAILURE,
        unpaidMessage: f.message,
        unpaidItems: [],
      )),
      success: (items) => emit(state.copyWith(
        unpaidStatus: ApiStatus.SUCCESS,
        unpaidItems: items,
        clearUnpaidMessage: true,
      )),
    );
  }

  Future<void> _fetchReceipts({
    required String toDate,
    required int partyId,
  }) async {
    final result = await _receiptsUsecase(
      GetPartyTopReceiptsParams(toDate: toDate, partyId: partyId),
    );
    if (isClosed) return;
    result.when(
      failure: (f) => emit(state.copyWith(
        receiptsStatus: ApiStatus.FAILURE,
        receiptsMessage: f.message,
        receiptsItems: [],
      )),
      success: (items) => emit(state.copyWith(
        receiptsStatus: ApiStatus.SUCCESS,
        receiptsItems: items,
        clearReceiptsMessage: true,
      )),
    );
  }

  Future<void> _fetchRevenue({
    required String toDate,
    required int partyId,
  }) async {
    final result = await _revenueUsecase(
      GetPartyRevenueAndRecoveryParams(toDate: toDate, partyId: partyId),
    );
    if (isClosed) return;
    result.when(
      failure: (f) => emit(state.copyWith(
        revenueStatus: ApiStatus.FAILURE,
        revenueMessage: f.message,
      )),
      success: (data) => emit(state.copyWith(
        revenueStatus: ApiStatus.SUCCESS,
        revenueData: data,
        clearRevenueMessage: true,
      )),
    );
  }
}
