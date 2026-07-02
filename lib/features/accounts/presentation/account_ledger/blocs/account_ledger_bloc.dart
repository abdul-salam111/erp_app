import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class AccountLedgerBloc extends Bloc<AccountLedgerEvent, AccountLedgerState> {
  final GetAccountStatementsUsecase getAccountStatementsUsecase;
  final GetInvoicePdfUsecase getInvoicePdfUsecase;
  final GetAccountsListUsecase getAccountsListUsecase;

  AccountLedgerBloc({
    required this.getAccountStatementsUsecase,
    required this.getInvoicePdfUsecase,
    required this.getAccountsListUsecase,
  }) : super(_initialState()) {
    on<AccountLedgerSubmitted>(_onSubmitted);
    on<AccountLedgerPrintRequested>(_onPrintRequested);
    on<AccountLedgerAccountsFetched>(_onAccountsFetched);
    on<AccountLedgerFromDateChanged>(
        (e, emit) => emit(state.copyWith(fromDate: e.date)));
    on<AccountLedgerToDateChanged>(
        (e, emit) => emit(state.copyWith(toDate: e.date)));
    on<AccountLedgerAccountSelected>(
        (e, emit) => emit(state.copyWith(selectedAccountId: e.accountId)));
    on<AccountLedgerFilterCollapsed>(
        (e, emit) => emit(state.copyWith(filterCollapsed: e.collapsed)));

    add(const AccountLedgerAccountsFetched());
  }

  static AccountLedgerState _initialState() {
    final now = DateTime.now();
    return AccountLedgerState(
      toDate: now,
      fromDate: DateTime(now.year, now.month - 1, now.day),
    );
  }

  Future<void> _onSubmitted(
    AccountLedgerSubmitted event,
    Emitter<AccountLedgerState> emit,
  ) async {
    emit(state.copyWith(
      apiStatus: ApiStatus.LOADING,
      pdfStatus: ApiStatus.INITIAL,
      message: null,
      filterCollapsed: false,
    ));

    final result = await getAccountStatementsUsecase(
      GetAccountStatementsParams(
        fromDate: event.fromDate,
        toDate: event.toDate,
        accountId: event.accountId,
      ),
    );

    result.fold(
      (failure) {
        debugPrint('[AccountLedger] _onSubmitted FAILURE: ${failure.message}');
        emit(state.copyWith(
          apiStatus: ApiStatus.FAILURE,
          message: failure.message,
          statements: [],
        ));
      },
      (statements) {
        debugPrint('[AccountLedger] _onSubmitted SUCCESS: ${statements.length} statement(s)');
        emit(state.copyWith(
          apiStatus: ApiStatus.SUCCESS,
          statements: statements,
        ));
      },
    );
  }

  Future<void> _onPrintRequested(
    AccountLedgerPrintRequested event,
    Emitter<AccountLedgerState> emit,
  ) async {
    emit(state.copyWith(isPrinting: true, pdfStatus: ApiStatus.LOADING));

    final result = await getInvoicePdfUsecase(
      GetInvoicePdfParams(
        featureId: event.featureId,
        parentEntityId: event.parentEntityId,
      ),
    );

    result.fold(
      (failure) {
        debugPrint('[AccountLedger] _onPrintRequested FAILURE: ${failure.message}');
        emit(state.copyWith(
          isPrinting: false,
          pdfStatus: ApiStatus.FAILURE,
          message: failure.message,
        ));
      },
      (url) {
        debugPrint('[AccountLedger] _onPrintRequested SUCCESS: $url');
        emit(state.copyWith(
          isPrinting: false,
          pdfStatus: ApiStatus.SUCCESS,
          pdfUrl: url,
        ));
      },
    );
  }

  Future<void> _onAccountsFetched(
    AccountLedgerAccountsFetched event,
    Emitter<AccountLedgerState> emit,
  ) async {
    emit(state.copyWith(accountsStatus: ApiStatus.LOADING));
    final result = await getAccountsListUsecase(NoParams());
    result.fold(
      (failure) {
        debugPrint('[AccountLedger] _onAccountsFetched FAILURE: ${failure.message}');
        emit(state.copyWith(
          accountsStatus: ApiStatus.FAILURE,
          message: failure.message,
        ));
      },
      (accounts) {
        debugPrint('[AccountLedger] _onAccountsFetched SUCCESS: ${accounts.length} account(s)');
        emit(state.copyWith(
          accountsStatus: ApiStatus.SUCCESS,
          accounts: accounts,
        ));
      },
    );
  }
}
