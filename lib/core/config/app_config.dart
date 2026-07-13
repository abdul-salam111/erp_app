import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConfig {
  static final AppConfig instance = AppConfig._();
  AppConfig._();

  static const _rcKeyBaseUrl = 'mantic_erp_base_url';
  static const _defaultBaseUrl = 'https://erpstagingapi.manticapps.com/api';

  String _baseUrl = _defaultBaseUrl;
  String get baseUrl => _baseUrl;

  Future<void> initialize() async {
    final rc = FirebaseRemoteConfig.instance;
    await rc.setDefaults({_rcKeyBaseUrl: _defaultBaseUrl});
    try {
      await rc.fetchAndActivate();
      
    } catch (_) {}
    final fetched = rc.getString(_rcKeyBaseUrl);
    if (fetched.isNotEmpty) _baseUrl = fetched;
  }
}
