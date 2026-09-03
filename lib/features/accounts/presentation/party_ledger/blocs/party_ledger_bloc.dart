import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class PartyLedgerBloc extends Bloc<PartyLedgerEvent, PartyLedgerState> {
  final GetPartyStatementsUsecase getPartyStatementsUsecase;
  final GetInvoicePdfUsecase getInvoicePdfUsecase;
  final GetPartyListUsecase getPartyListUsecase;

  PartyLedgerBloc({
    required this.getPartyStatementsUsecase,
    required this.getInvoicePdfUsecase,
    required this.getPartyListUsecase,
  }) : super(const PartyLedgerState()) {
    on<PartyLedgerSubmitted>(_onSubmitted, transformer: restartable());
    on<PartyLedgerPrintRequested>(_onPrintRequested, transformer: droppable());
    on<PartyLedgerPartiesFetched>(_onPartiesFetched, transformer: droppable());

    add(const PartyLedgerPartiesFetched());
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

    result.when(
      failure: (failure) => emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: failure.message,
        statements: [],
      )),
      success: (statements) => emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        statements: statements,
      )),
    );
  }

  Future<void> _onPartiesFetched(
    PartyLedgerPartiesFetched event,
    Emitter<PartyLedgerState> emit,
  ) async {
    emit(state.copyWith(partiesStatus: ApiStatus.LOADING));
    final result = await getPartyListUsecase(NoParams());
    result.when(
      failure: (failure) => emit(state.copyWith(
        partiesStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      success: (parties) => emit(state.copyWith(
        partiesStatus: ApiStatus.SUCCESS,
        parties: parties,
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

    result.when(
      failure: (failure) => emit(state.copyWith(
        isPrinting: false,
        pdfStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      success: (url) => emit(state.copyWith(
        isPrinting: false,
        pdfStatus: ApiStatus.SUCCESS,
        pdfUrl: url,
      )),
    );
  }
}
