import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'force_update_service.dart';

class ForceUpdateController extends ChangeNotifier {
  static final ForceUpdateController _instance = ForceUpdateController._internal();
  factory ForceUpdateController() => _instance;
  ForceUpdateController._internal();

  static const _prefKeyLastShownDate = 'erp_optional_update_last_shown';
  static const _prefKeyDailyShowCount = 'erp_optional_update_show_count';
  static const _maxShowsPerCycle = 7;
  static const _cooldownDays = 2;

  final _storage = const FlutterSecureStorage();

  UpdateType _updateType = UpdateType.none;
  ForceUpdateConfig? _config;
  bool _isChecking = true;
  bool _optionalDismissed = false;
  bool _isUpdating = false;
  bool _hasShownOptionalDialog = false;

  UpdateType get updateType => _updateType;
  ForceUpdateConfig? get config => _config;
  bool get isChecking => _isChecking;
  bool get shouldShowForceUpdate => _updateType == UpdateType.force;
  bool get shouldShowOptionalUpdate =>
      _updateType == UpdateType.optional &&
      !_optionalDismissed &&
      !_hasShownOptionalDialog;

  Future<bool> _canShowOptionalDialog() async {
    final showCountRaw = await _storage.read(key: _prefKeyDailyShowCount);
    int showCount = int.tryParse(showCountRaw ?? '0') ?? 0;
    if (showCount < _maxShowsPerCycle) return true;

    final lastShownRaw = await _storage.read(key: _prefKeyLastShownDate);
    if (lastShownRaw == null) {
      await _resetCycle();
      return true;
    }

    final lastDate = DateTime.fromMillisecondsSinceEpoch(
      int.tryParse(lastShownRaw) ?? 0,
    );
    if (DateTime.now().difference(lastDate).inDays >= _cooldownDays) {
      await _resetCycle();
      return true;
    }
    return false;
  }

  Future<void> _resetCycle() async {
    await _storage.write(key: _prefKeyDailyShowCount, value: '0');
    await _storage.write(
      key: _prefKeyLastShownDate,
      value: DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  Future<void> markOptionalDialogShown() async {
    _hasShownOptionalDialog = true;
    final raw = await _storage.read(key: _prefKeyDailyShowCount);
    int count = (int.tryParse(raw ?? '0') ?? 0) + 1;
    await _storage.write(key: _prefKeyDailyShowCount, value: count.toString());
    await _storage.write(
      key: _prefKeyLastShownDate,
      value: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  Future<void> dismissOptionalUpdate() async {
    _optionalDismissed = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  Future<void> checkForUpdates() async {
    if (_isUpdating) return;
    _isUpdating = true;
    _isChecking = true;
    _optionalDismissed = false;
    _hasShownOptionalDialog = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    try {
      _config = await ForceUpdateService().getConfig();
      _updateType = await ForceUpdateService().checkUpdateTypeFromConfig(_config!);
      if (_updateType == UpdateType.optional) {
        final canShow = await _canShowOptionalDialog();
        if (!canShow) _updateType = UpdateType.none;
      }
    } catch (_) {
      _updateType = UpdateType.none;
    } finally {
      _isChecking = false;
      _isUpdating = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    }
  }

  Future<void> refresh() async {
    if (_hasShownOptionalDialog && _updateType == UpdateType.optional) return;
    await checkForUpdates();
  }
}
