import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/attendance_usecase.dart';
import '../views/widgets/attendance_types.dart';
import 'attendance_event.dart';
import 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState>
    with UsecaseExecuterMixin {
  final AttendanceUsecase attendanceUsecase;

  AttendanceBloc({required this.attendanceUsecase})
      : super(AttendanceState(
          attendanceData: attendanceDataFor(
            DateTime(DateTime.now().year, DateTime.now().month),
          ),
        )) {
    on<AttendanceMonthChanged>(_onMonthChanged);
    on<AttendanceSubmitted>(_onAttendanceSubmitted, transformer: droppable());
  }

  void _onMonthChanged(
    AttendanceMonthChanged event,
    Emitter<AttendanceState> emit,
  ) {
    emit(state.copyWith(
      selectedMonth: event.month,
      attendanceData: attendanceDataFor(event.month),
    ));
  }

  Future<void> _onAttendanceSubmitted(
    AttendanceSubmitted event,
    Emitter<AttendanceState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => attendanceUsecase.call(
        GetMonthParams(
          year: state.selectedMonth.year,
          month: state.selectedMonth.month,
        ),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
