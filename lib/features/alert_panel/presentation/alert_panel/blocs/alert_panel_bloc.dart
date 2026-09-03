import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/alert_panel_usecase.dart';
import 'alert_panel_event.dart';
import 'alert_panel_state.dart';

class AlertPanelBloc extends Bloc<AlertPanelEvent, AlertPanelState>
    with UsecaseExecuterMixin {
  final AlertPanelUsecase alertpanelUsecase;

  AlertPanelBloc({required this.alertpanelUsecase})
      : super(const AlertPanelState()) {
    on<AlertPanelSubmitted>(_onAlertPanelSubmitted, transformer: droppable());
  }

  Future<void> _onAlertPanelSubmitted(
    AlertPanelSubmitted event,
    Emitter<AlertPanelState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => alertpanelUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
