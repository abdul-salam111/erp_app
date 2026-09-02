import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/theme_exports.dart';
import 'force_update_controller.dart';

class ForceUpdateGate extends StatefulWidget {
  final Widget child;
  const ForceUpdateGate({super.key, required this.child});

  @override
  State<ForceUpdateGate> createState() => _ForceUpdateGateState();
}

class _ForceUpdateGateState extends State<ForceUpdateGate>
    with WidgetsBindingObserver {
  final _controller = ForceUpdateController();
  bool _isDialogShowing = false;
  bool _prevShouldShowForce = false;

  // TODO: replace with ManticERP's actual App Store URL once published
  static const _appStoreUrl = 'https://apps.apple.com/us/app/YOUR_ERP_APP_ID';
  static const _playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.manticerp.softronix';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller.addListener(_onControllerUpdate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.checkForUpdates();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() {
    if (!mounted) return;
    final shouldShowForce = _controller.shouldShowForceUpdate;
    if (shouldShowForce != _prevShouldShowForce) {
      _prevShouldShowForce = shouldShowForce;
      setState(() {});
    }
    if (_controller.shouldShowOptionalUpdate &&
        !_isDialogShowing &&
        !_controller.isChecking) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted &&
            _controller.shouldShowOptionalUpdate &&
            !_isDialogShowing) {
          _showOptionalUpdateDialog();
        }
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _controller.refresh();
  }

  Future<void> _launchStore() async {
    final url = Uri.parse(Platform.isIOS ? _appStoreUrl : _playStoreUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _showOptionalUpdateDialog() {
    if (_isDialogShowing) return;
    _isDialogShowing = true;
    _controller.markOptionalDialogShown();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
        backgroundColor: context.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: context.black.withValues(alpha: 0.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: context.white.withValues(alpha: 0.2),
                        shape: .circle,
                      ),
                      child: Icon(Icons.system_update_rounded,
                          size: 36, color: context.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _controller.config?.updateTitle ?? 'Update Available',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .bold,
                        color: context.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                child: Column(
                  children: [
                    Text(
                      _controller.config?.updateMessage ??
                          'A new version is available. Update now for the best experience.',
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          _isDialogShowing = false;
                          _launchStore();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(Platform.isIOS
                            ? 'Update on App Store'
                            : 'Update on Play Store'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          _controller.dismissOptionalUpdate();
                          _isDialogShowing = false;
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Text('Maybe Later'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((_) => _isDialogShowing = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.shouldShowForceUpdate) {
      return PopScope(
        canPop: false,
        child: _ForceUpdateScreen(
          title: _controller.config?.updateTitle ?? 'Update Required',
          message: _controller.config?.updateMessage ??
              'Please update the app to continue using all features.',
          onUpdate: _launchStore,
        ),
      );
    }
    return widget.child;
  }
}

class _ForceUpdateScreen extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onUpdate;

  const _ForceUpdateScreen({
    required this.title,
    required this.message,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Spacer(),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: .circle,
                ),
                child: Icon(Icons.system_update_rounded,
                    size: 32, color: context.white),
              ),
              const SizedBox(height: 36),
              Text(
                title,
                textAlign: .center,
                style: const TextStyle(
                    fontSize: 26, fontWeight: .bold),
              ),
              const SizedBox(height: 14),
              Text(
                message,
                textAlign: .center,
                style: const TextStyle(fontSize: 15, height: 1.6),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onUpdate,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(Platform.isIOS
                      ? 'Update on App Store'
                      : 'Update on Play Store'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'You must update to continue using the app.',
                textAlign: .center,
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
