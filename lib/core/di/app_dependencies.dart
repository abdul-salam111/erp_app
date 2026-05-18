import 'package:get_it/get_it.dart';
import 'register_network.dart';
import 'register_core.dart';
import 'register_auth.dart';
import 'register_profile.dart';
import 'register_alert_panel.dart';


/// Global service locator instance.
/// Import this file wherever [sl] or [setupLocator] is needed.
final sl = GetIt.instance;

Future<void> setupLocator() async {
  await registerNetwork();
  await registerCore();
  await registerAuth();

  await profileDependencies();
  await registerAlertPanel();
}
