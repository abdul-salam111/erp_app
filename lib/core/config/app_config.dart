import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AppEnvironment { staging, production }

class AppConfig {
  static final AppConfig instance = AppConfig._();
  AppConfig._();

  static const _rcKeyStagingUrl = 'mantic_erp_staging_base_url';
  static const _rcKeyProductionUrl = 'mantic_erp_production_base_url';
  static const _defaultStagingUrl = 'https://erp30api.manticapps.com/api';
  static const _defaultProductionUrl = 'https://erp30api.manticapps.com/api';
  static const _envStorageKey = 'app_environment';

  static const _storage = FlutterSecureStorage();

  AppEnvironment _environment = AppEnvironment.staging;
  AppEnvironment get environment => _environment;

  String _stagingUrl = _defaultStagingUrl;
  String _productionUrl = _defaultProductionUrl;

  String get baseUrl =>
      _environment == AppEnvironment.staging ? _stagingUrl : _productionUrl;

  Future<void> initialize() async {
    final saved = await _storage.read(key: _envStorageKey);
    if (saved == AppEnvironment.production.name) {
      _environment = AppEnvironment.production;
    }

    final rc = FirebaseRemoteConfig.instance;
    await rc.setDefaults({
      _rcKeyStagingUrl: _defaultStagingUrl,
      _rcKeyProductionUrl: _defaultProductionUrl,
    });
    try {
      await rc.fetchAndActivate();
    } catch (_) {}

    final staging = rc.getString(_rcKeyStagingUrl);
    if (staging.isNotEmpty) _stagingUrl = staging;

    final production = rc.getString(_rcKeyProductionUrl);
    if (production.isNotEmpty) _productionUrl = production;
  }

  Future<void> switchEnvironment() async {
    _environment = _environment == AppEnvironment.staging
        ? AppEnvironment.production
        : AppEnvironment.staging;
    await _storage.write(key: _envStorageKey, value: _environment.name);
  }
}
