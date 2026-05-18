import 'package:bloc/bloc.dart';

import '../../../../core/shared/shared_exports.dart';
import '../../profile_exports.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with UsecaseExecuterMixin {
  // TODO: Inject required usecases here
  // final SomeUsecase someUsecase;

  ProfileBloc(/*{required this.someUsecase}*/)
      : super(const ProfileState()) {
    // on<ProfileSubmitted>(_onProfileSubmitted);
  }

  // Future<void> _onProfileSubmitted(
  //   ProfileSubmitted event,
  //   Emitter<ProfileState> emit,
  // ) async {
  //   await executeUsecase(
  //     emit: emit,
  //     currentState: state,
  //     usecase: () => someUsecase(NoParams()),
  //     stateBuilder: (status, {data, error}) =>
  //         state.copyWith(apiStatus: status, data: data, message: error),
  //   );
  // }
}
