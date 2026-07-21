import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/attendance_usecase.dart';
import 'attendance_event.dart';
import 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState>
    with UsecaseExecuterMixin {
  final AttendanceUsecase attendanceUsecase;

  AttendanceBloc({required this.attendanceUsecase})
      : super(const AttendanceState()) {
    on<AttendanceSubmitted>(_onAttendanceSubmitted);
  }

  Future<void> _onAttendanceSubmitted(
    AttendanceSubmitted event,
    Emitter<AttendanceState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => attendanceUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
