import 'package:flutter_bloc/flutter_bloc.dart';
import 'system_event.dart';
import 'system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  SystemBloc() : super(const SystemState());
}
