import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../debug/dev_flags.dart';

class EnvSwitchDetector extends StatefulWidget {
  final Widget child;
  const EnvSwitchDetector({super.key, required this.child});

  @override
  State<EnvSwitchDetector> createState() => _EnvSwitchDetectorState();
}

class _EnvSwitchDetectorState extends State<EnvSwitchDetector> {
  int _tapCount = 0;
  DateTime? _lastTap;

  Future<void> _onTap() async {
    final now = DateTime.now();
    if (_lastTap != null &&
        now.difference(_lastTap!) > const Duration(seconds: 2)) {
      _tapCount = 0;
    }
    _lastTap = now;
    _tapCount++;

    if (_tapCount >= 5) {
      _tapCount = 0;
      await AppConfig.instance.switchEnvironment();
      if (!mounted) return;
      final env = AppConfig.instance.environment;
      final label =
          env == AppEnvironment.staging ? 'Staging' : 'Production';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Switched to $label environment'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!kDevTools) return widget.child;
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: widget.child,
    );
  }
}
