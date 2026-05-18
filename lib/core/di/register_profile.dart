import 'package:get_it/get_it.dart';
import '../../features/profile/profile_exports.dart';

final _sl = GetIt.instance;

Future<void> profileDependencies() async {
  // BLoC — Profile screen
  _sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(/* inject usecases */),
  );
}
