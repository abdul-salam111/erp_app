import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/partah_usecase.dart';
import 'partah_event.dart';
import 'partah_state.dart';

class PartahBloc extends Bloc<PartahEvent, PartahState>
    with UsecaseExecuterMixin {
  final PartahUsecase partahUsecase;

  PartahBloc({required this.partahUsecase})
      : super(const PartahState()) {
    on<PartahSubmitted>(_onPartahSubmitted);
  }

  Future<void> _onPartahSubmitted(
    PartahSubmitted event,
    Emitter<PartahState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => partahUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
