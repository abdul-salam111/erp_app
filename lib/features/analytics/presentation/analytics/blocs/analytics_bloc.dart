import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/analytics_usecase.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState>
    with UsecaseExecuterMixin {
  final AnalyticsUsecase analyticsUsecase;

  AnalyticsBloc({required this.analyticsUsecase})
    : super(const AnalyticsState()) {
    on<AnalyticsSubmitted>(_onAnalyticsSubmitted);
  }

  Future<void> _onAnalyticsSubmitted(
    AnalyticsSubmitted event,
    Emitter<AnalyticsState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => analyticsUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
