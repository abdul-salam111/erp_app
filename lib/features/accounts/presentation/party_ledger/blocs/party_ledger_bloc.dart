import 'package:bloc/bloc.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../accounts_exports.dart';

class PartyLedgerBloc extends Bloc<PartyLedgerEvent, PartyLedgerState> {
  final GetPartyStatementsUsecase getPartyStatementsUsecase;
  final GetInvoicePdfUsecase getInvoicePdfUsecase;

  PartyLedgerBloc({
    required this.getPartyStatementsUsecase,
    required this.getInvoicePdfUsecase,
  }) : super(const PartyLedgerState()) {
    on<PartyLedgerSubmitted>(_onSubmitted);
    on<PartyLedgerPrintRequested>(_onPrintRequested);
  }

  Future<void> _onSubmitted(
    PartyLedgerSubmitted event,
    Emitter<PartyLedgerState> emit,
  ) async {
    emit(state.copyWith(
      apiStatus: ApiStatus.LOADING,
      pdfStatus: ApiStatus.INITIAL,
      pdfUrl: null,
      message: null,
      fromDateDisplay: event.fromDate,
      toDateDisplay: event.toDate,
    ));

    final result = await getPartyStatementsUsecase(
      GetPartyStatementsParams(
        fromDate: event.fromDate,
        toDate: event.toDate,
        partyId: event.partyId,
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
    PartyLedgerPrintRequested event,
    Emitter<PartyLedgerState> emit,
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
}
