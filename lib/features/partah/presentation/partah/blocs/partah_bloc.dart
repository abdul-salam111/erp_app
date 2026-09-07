import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/usecases/load_partah_report_usecase.dart';
import 'partah_event.dart';
import 'partah_state.dart';

class PartahBloc extends Bloc<PartahEvent, PartahState> {
  final LoadPartahReportUsecase loadReport;

  PartahBloc({required this.loadReport})
      : super(PartahState(
          fromDate: DateTime.now(),
          toDate: DateTime.now(),
        )) {
    on<PartahFromDateChanged>(_onFromDateChanged);
    on<PartahToDateChanged>(_onToDateChanged);
    on<PartahReportRequested>(_onReportRequested, transformer: droppable());
  }

  void _onFromDateChanged(PartahFromDateChanged event, Emitter<PartahState> emit) {
    emit(state.copyWith(fromDate: event.date));
  }

  void _onToDateChanged(PartahToDateChanged event, Emitter<PartahState> emit) {
    emit(state.copyWith(toDate: event.date));
  }

  Future<void> _onReportRequested(
    PartahReportRequested event,
    Emitter<PartahState> emit,
  ) async {
    emit(state.copyWith(loadStatus: ApiStatus.LOADING));

    final result = await loadReport(LoadPartahReportParams(
      fromDate: state.fromDate.format('yyyy-MM-dd'),
      toDate: state.toDate.format('yyyy-MM-dd'),
    ));

    result.when(
      failure: (failure) => emit(state.copyWith(
        loadStatus: ApiStatus.FAILURE,
        errorMessage: failure.message,
      )),
      success: (report) => emit(state.copyWith(
        loadStatus: ApiStatus.SUCCESS,
        report: report,
      )),
    );
  }
}
