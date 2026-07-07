import 'dart:convert';
import 'dart:io';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum UpdateType { none, optional, force }

class ForceUpdateConfig {
  final bool forceUpdateEnabled;
  final bool optionalUpdateEnabled;
  final String minVersion;
  final String latestVersion;
  final String updateMessage;
  final String updateTitle;

  const ForceUpdateConfig({
    required this.forceUpdateEnabled,
    required this.optionalUpdateEnabled,
    required this.minVersion,
    required this.latestVersion,
    required this.updateMessage,
    required this.updateTitle,
  });

  factory ForceUpdateConfig.fromJson(Map<String, dynamic> json) {
    return ForceUpdateConfig(
      forceUpdateEnabled: json['force_update_enabled'] as bool? ?? false,
      optionalUpdateEnabled: json['optional_update_enabled'] as bool? ?? false,
      minVersion: json['min_version'] as String? ?? '1.0.0',
      latestVersion: json['latest_version'] as String? ?? '1.0.0',
      updateTitle: json['title'] as String? ?? 'Update Required',
      updateMessage: json['message'] as String? ?? 'Please update the app to continue.',
    );
  }

  static ForceUpdateConfig get _defaults => const ForceUpdateConfig(
        forceUpdateEnabled: false,
        optionalUpdateEnabled: false,
        minVersion: '1.0.0',
        latestVersion: '1.0.0',
        updateTitle: 'Update Required',
        updateMessage: 'Please update the app to continue.',
      );
}

class ForceUpdateService {
  static final ForceUpdateService _instance = ForceUpdateService._internal();
  factory ForceUpdateService() => _instance;
  ForceUpdateService._internal();

  // ManticERP uses its own RC key — different from the Partah app key
  static const _rcKey = 'mantic_erp_update_config';

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: kDebugMode ? Duration.zero : const Duration(hours: 1),
      ),
    );

    await _remoteConfig.setDefaults({
      _rcKey: jsonEncode({
        'android': {
          'force_update_enabled': false,
          'optional_update_enabled': false,
          'min_version': '1.0.0',
          'latest_version': '1.0.0',
          'title': 'Update Required',
          'message': 'Please update the app to continue.',
        },
        'ios': {
          'force_update_enabled': false,
          'optional_update_enabled': false,
          'min_version': '1.0.0',
          'latest_version': '1.0.0',
          'title': 'Update Required',
          'message': 'Please update the app to continue.',
        },
      }),
    });

    await _remoteConfig.fetchAndActivate();
  }

  Future<ForceUpdateConfig> getConfig() async {
    await _remoteConfig.fetchAndActivate();
    try {
      final raw = _remoteConfig.getString(_rcKey);
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final platform = Platform.isIOS ? 'ios' : 'android';
      final platformMap = map[platform] as Map<String, dynamic>?;
      if (platformMap == null) return ForceUpdateConfig._defaults;
      return ForceUpdateConfig.fromJson(platformMap);
    } catch (_) {
      return ForceUpdateConfig._defaults;
    }
  }

  Future<UpdateType> checkUpdateTypeFromConfig(ForceUpdateConfig config) async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      if (config.forceUpdateEnabled && _isOutdated(currentVersion, config.minVersion)) {
        return UpdateType.force;
      }
      if (config.optionalUpdateEnabled && _isOutdated(currentVersion, config.latestVersion)) {
        return UpdateType.optional;
      }
      return UpdateType.none;
    } catch (_) {
      return UpdateType.none;
    }
  }

  bool _isOutdated(String current, String minimum) {
    final cur = current.split('.').map(int.tryParse).toList();
    final min = minimum.split('.').map(int.tryParse).toList();
    while (cur.length < 3) {
      cur.add(0);
    }
    while (min.length < 3) {
      min.add(0);
    }
    for (int i = 0; i < 3; i++) {
      final c = cur[i] ?? 0;
      final m = min[i] ?? 0;
      if (c < m) return true;
      if (c > m) return false;
    }
    return false;
  }
}
