import 'package:bloc/bloc.dart';
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
  }) : super(const AccountLedgerState()) {
    on<AccountLedgerSubmitted>(_onSubmitted);
    on<AccountLedgerPrintRequested>(_onPrintRequested);
    on<AccountLedgerAccountsFetched>(_onAccountsFetched);

    add(const AccountLedgerAccountsFetched());
  }

  Future<void> _onSubmitted(
    AccountLedgerSubmitted event,
    Emitter<AccountLedgerState> emit,
  ) async {
    emit(state.copyWith(
      apiStatus: ApiStatus.LOADING,
      pdfStatus: ApiStatus.INITIAL,
      pdfUrl: null,
      message: null,
      fromDateDisplay: event.fromDate,
      toDateDisplay: event.toDate,
    ));

    final result = await getAccountStatementsUsecase(
      GetAccountStatementsParams(
        fromDate: event.fromDate,
        toDate: event.toDate,
        accountId: event.accountId,
      ),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: failure.message,
        statements: [],
      )),
      (statements) => emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        statements: statements,
      )),
    );
  }

  Future<void> _onPrintRequested(
    AccountLedgerPrintRequested event,
    Emitter<AccountLedgerState> emit,
  ) async {
    emit(state.copyWith(isPrinting: true, pdfStatus: ApiStatus.LOADING, pdfUrl: null));

    final result = await getInvoicePdfUsecase(
      GetInvoicePdfParams(
        featureId: event.featureId,
        parentEntityId: event.parentEntityId,
      ),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isPrinting: false,
        pdfStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      (url) => emit(state.copyWith(
        isPrinting: false,
        pdfStatus: ApiStatus.SUCCESS,
        pdfUrl: url,
      )),
    );
  }

  Future<void> _onAccountsFetched(
    AccountLedgerAccountsFetched event,
    Emitter<AccountLedgerState> emit,
  ) async {
    emit(state.copyWith(accountsStatus: ApiStatus.LOADING));
    final result = await getAccountsListUsecase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        accountsStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      (accounts) => emit(state.copyWith(
        accountsStatus: ApiStatus.SUCCESS,
        accounts: accounts,
      )),
    );
  }
}
