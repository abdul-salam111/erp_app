import 'package:bloc/bloc.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';


class AccountLedgerBloc extends Bloc<AccountLedgerEvent, AccountLedgerState> {
  final GetAccountStatementsUsecase getAccountStatementsUsecase;
  final GetInvoicePdfUsecase getInvoicePdfUsecase;
  final GetPrintableFeaturesUsecase getPrintableFeaturesUsecase;

  AccountLedgerBloc({
    required this.getAccountStatementsUsecase,
    required this.getInvoicePdfUsecase,
    required this.getPrintableFeaturesUsecase,
  }) : super(const AccountLedgerState()) {
    on<AccountLedgerSubmitted>(_onSubmitted);
    on<AccountLedgerPrintRequested>(_onPrintRequested);
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
    ));

    // Fetch statements and printable features in parallel
    final results = await Future.wait([
      getAccountStatementsUsecase(
        GetAccountStatementsParams(
          fromDate: event.fromDate,
          toDate: event.toDate,
        ),
      ),
      getPrintableFeaturesUsecase(NoParams()),
    ]);

    final statementsResult =
        results[0] as dynamic; // Either<Failure, List<GetAccountStatementsModel>>
    final featuresResult =
        results[1] as dynamic; // Either<Failure, List<int>>

    // Handle statements result
    String? error;
    List<AccountLedgerModel> statements = [];
    List<int> featureIds = state.printableFeatureIds;

    statementsResult.fold(
      (failure) => error = failure.message as String?,
      (data) => statements = data as List<AccountLedgerModel>,
    );

    if (error != null) {
      emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: error,
        statements: [],
      ));
      return;
    }

    // Handle printable features (non-fatal — keep old value on failure)
    featuresResult.fold(
      (_) {},
      (data) => featureIds = data as List<int>,
    );

    emit(state.copyWith(
      apiStatus: ApiStatus.SUCCESS,
      statements: statements,
      printableFeatureIds: featureIds,
    ));
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
}
