import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/usecases/delete_report_usecase.dart';
import '../../../domain/usecases/get_all_reports_usecase.dart';
import 'reports_event.dart';
import 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> with UsecaseExecuterMixin {
  final GetAllReportsUsecase getAllReports;
  final DeleteReportUsecase deleteReport;

  ReportsBloc({required this.getAllReports, required this.deleteReport}) : super(const ReportsState()) {
    on<ReportsStarted>(_onStarted, transformer: droppable());
    on<ReportDeleteRequested>(_onDeleteRequested, transformer: droppable());
  }

  Future<void> _onStarted(ReportsStarted event, Emitter<ReportsState> emit) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getAllReports(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        loadStatus: status,
        records: data,
        errorMessage: error,
      ),
    );
  }

  Future<void> _onDeleteRequested(ReportDeleteRequested event, Emitter<ReportsState> emit) async {
    emit(state.copyWith(deleteStatus: ApiStatus.LOADING));
    final result = await deleteReport(event.id);
    result.when(
      success: (_) {
        emit(state.copyWith(
          deleteStatus: ApiStatus.SUCCESS,
          deletedId: event.id,
          records: state.records.where((r) => r.id != event.id).toList(),
        ));
      },
      failure: (f) => emit(state.copyWith(deleteStatus: ApiStatus.FAILURE, errorMessage: f.message)),
    );
  }
}
