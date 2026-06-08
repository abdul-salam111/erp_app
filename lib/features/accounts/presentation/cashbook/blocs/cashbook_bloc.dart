import 'package:bloc/bloc.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/get_cashbook_accounts_usecase.dart';
import '../../../domain/usecases/get_cashbook_statements_usecase.dart';
import '../../../domain/usecases/get_invoice_pdf_usecase.dart';
import 'cashbook_event.dart';
import 'cashbook_state.dart';

class CashbookBloc extends Bloc<CashbookEvent, CashbookState> {
  final GetCashbookStatementsUsecase getCashbookStatementsUsecase;
  final GetInvoicePdfUsecase getInvoicePdfUsecase;
  final GetCashbookAccountsUsecase getCashbookAccountsUsecase;

  CashbookBloc({
    required this.getCashbookStatementsUsecase,
    required this.getInvoicePdfUsecase,
    required this.getCashbookAccountsUsecase,
  }) : super(const CashbookState()) {
    on<CashbookSubmitted>(_onSubmitted);
    on<CashbookPrintRequested>(_onPrintRequested);
    on<CashbookAccountsFetched>(_onAccountsFetched);

    add(const CashbookAccountsFetched());
  }

  Future<void> _onSubmitted(
    CashbookSubmitted event,
    Emitter<CashbookState> emit,
  ) async {
    emit(state.copyWith(
      apiStatus: ApiStatus.LOADING,
      pdfStatus: ApiStatus.INITIAL,
      pdfUrl: null,
      message: null,
      fromDateDisplay: event.fromDate,
      toDateDisplay: event.toDate,
    ));

    final result = await getCashbookStatementsUsecase(
      GetCashbookStatementsParams(
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
    CashbookPrintRequested event,
    Emitter<CashbookState> emit,
  ) async {
    emit(state.copyWith(
      isPrinting: true,
      pdfStatus: ApiStatus.LOADING,
      pdfUrl: null,
    ));

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
    CashbookAccountsFetched event,
    Emitter<CashbookState> emit,
  ) async {
    emit(state.copyWith(accountsStatus: ApiStatus.LOADING));
    final result = await getCashbookAccountsUsecase(NoParams());
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
