import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:mantic_erp_app/core/theme/colors.dart';
import 'package:mantic_erp_app/core/theme/theme_utils.dart';

enum ToastPosition {
  top,
  bottom,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
}

enum ToastType { success, error, warning, info, custom }

class AppToastsUtils {
  static OverlayEntry? _entry;
  static Timer? _timer;

  static void show(
    BuildContext context, {
    required String message,
    String? title,
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.top,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Color? iconColor,
    VoidCallback? onTap,
    Widget? mainButton,
    bool isDismissible = true,
    bool showProgressIndicator = false,
    double? maxWidth,
  }) {
    dismissCurrent();

    final overlay = Overlay.of(context, rootOverlay: true);
    final resolvedIcon = icon ?? _iconFor(type);
    final accent = _accentFor(type);
    final isTop = _positionFor(position) == _Anchor.top;

    final entry = OverlayEntry(
      builder: (_) => _GlassToast(
        title: title,
        message: message,
        icon: resolvedIcon,
        accent: accent,
        isTop: isTop,
        dismissible: isDismissible,
        onTap: onTap,
        showProgress: showProgressIndicator,
        onDismiss: dismissCurrent,
      ),
    );
    _entry = entry;
    overlay.insert(entry);

    if (duration.inSeconds < 60 * 60 * 24) {
      _timer = Timer(duration, dismissCurrent);
    }
  }

  static void dismissCurrent([BuildContext? context]) {
    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;
  }

  static void showSuccess(
    BuildContext context,
    String message, {
    String? title,
    ToastPosition position = ToastPosition.top,
    Duration duration = const Duration(seconds: 3),
  }) => show(
    context,
    message: message,
    title: title,
    type: ToastType.success,
    position: position,
    duration: duration,
  );

  static void showError(
    BuildContext context,
    String message, {
    String? title,
    ToastPosition position = ToastPosition.top,
    Duration duration = const Duration(seconds: 3),
  }) => show(
    context,
    message: message,
    title: title,
    type: ToastType.error,
    position: position,
    duration: duration,
  );

  static void showWarning(
    BuildContext context,
    String message, {
    String? title,
    ToastPosition position = ToastPosition.top,
    Duration duration = const Duration(seconds: 3),
  }) => show(
    context,
    message: message,
    title: title,
    type: ToastType.warning,
    position: position,
    duration: duration,
  );

  static void showInfo(
    BuildContext context,
    String message, {
    String? title,
    ToastPosition position = ToastPosition.top,
    Duration duration = const Duration(seconds: 3),
  }) => show(
    context,
    message: message,
    title: title,
    type: ToastType.info,
    position: position,
    duration: duration,
  );

  static void showSuccessTop(BuildContext context, String message) =>
      showSuccess(context, message, position: ToastPosition.top);

  static void showErrorTop(BuildContext context, String message) =>
      showError(context, message, position: ToastPosition.top);

  static void showWarningTop(BuildContext context, String message) =>
      showWarning(context, message, position: ToastPosition.top);

  static void showInfoTop(BuildContext context, String message) =>
      showInfo(context, message, position: ToastPosition.top);

  static void showSuccessBottom(BuildContext context, String message) =>
      showSuccess(context, message, position: ToastPosition.bottom);

  static void showErrorBottom(BuildContext context, String message) =>
      showError(context, message, position: ToastPosition.bottom);

  static void showWarningBottom(BuildContext context, String message) =>
      showWarning(context, message, position: ToastPosition.bottom);

  static void showInfoBottom(BuildContext context, String message) =>
      showInfo(context, message, position: ToastPosition.bottom);

  static void showSuccessTopLeft(BuildContext context, String message) =>
      showSuccess(context, message, position: ToastPosition.top);

  static void showErrorTopLeft(BuildContext context, String message) =>
      showError(context, message, position: ToastPosition.top);

  static void showSuccessTopRight(BuildContext context, String message) =>
      showSuccess(context, message, position: ToastPosition.top);

  static void showErrorTopRight(BuildContext context, String message) =>
      showError(context, message, position: ToastPosition.top);

  static void showSuccessBottomLeft(BuildContext context, String message) =>
      showSuccess(context, message, position: ToastPosition.bottom);

  static void showErrorBottomLeft(BuildContext context, String message) =>
      showError(context, message, position: ToastPosition.bottom);

  static void showSuccessBottomRight(BuildContext context, String message) =>
      showSuccess(context, message, position: ToastPosition.bottom);

  static void showErrorBottomRight(BuildContext context, String message) =>
      showError(context, message, position: ToastPosition.bottom);

  static void showCenter(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
  }) => show(context, message: message, type: type, position: ToastPosition.top);

  static void showLoading(
    BuildContext context,
    String message, {
    ToastPosition position = ToastPosition.top,
  }) => show(
    context,
    message: message,
    title: 'Loading',
    type: ToastType.info,
    position: position,
    duration: const Duration(days: 1),
    showProgressIndicator: true,
    isDismissible: false,
  );

  static void showWithAction(
    BuildContext context, {
    required String message,
    required String actionText,
    required VoidCallback onActionPressed,
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      context,
      message: message,
      type: type,
      position: position,
      onTap: onActionPressed,
      mainButton: null,
    );
  }

  static void showPersistent(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.top,
  }) => show(
    context,
    message: message,
    type: type,
    position: position,
    duration: const Duration(days: 1),
  );

  static void showLong(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.top,
  }) => show(
    context,
    message: message,
    type: type,
    position: position,
    duration: const Duration(seconds: 5),
  );

  static void showShort(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.top,
  }) => show(
    context,
    message: message,
    type: type,
    position: position,
    duration: const Duration(seconds: 1),
  );

  static _Anchor _positionFor(ToastPosition p) {
    switch (p) {
      case ToastPosition.bottom:
      case ToastPosition.bottomLeft:
      case ToastPosition.bottomRight:
        return _Anchor.bottom;
      case ToastPosition.top:
      case ToastPosition.topLeft:
      case ToastPosition.topRight:
      case ToastPosition.center:
        return _Anchor.top;
    }
  }

  static Color _accentFor(ToastType t) {
    switch (t) {
      case ToastType.success:
        return AppColors.success;
      case ToastType.error:
        return AppColors.error;
      case ToastType.warning:
        return AppColors.orange;
      case ToastType.info:
        return AppColors.info;
      case ToastType.custom:
        return AppColors.grey400;
    }
  }

  static IconData _iconFor(ToastType t) {
    switch (t) {
      case ToastType.success:
        return Icons.check_circle_rounded;
      case ToastType.error:
        return Icons.error_rounded;
      case ToastType.warning:
        return Icons.warning_rounded;
      case ToastType.info:
        return Icons.info_rounded;
      case ToastType.custom:
        return Icons.notifications_rounded;
    }
  }
}

enum _Anchor { top, bottom }

class _GlassToast extends StatefulWidget {
  final String? title;
  final String message;
  final IconData icon;
  final Color accent;
  final bool isTop;
  final bool dismissible;
  final bool showProgress;
  final VoidCallback? onTap;
  final VoidCallback onDismiss;

  const _GlassToast({
    required this.title,
    required this.message,
    required this.icon,
    required this.accent,
    required this.isTop,
    required this.dismissible,
    required this.showProgress,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  State<_GlassToast> createState() => _GlassToastState();
}

class _GlassToastState extends State<_GlassToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _offset;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _offset = Tween<Offset>(
      begin: Offset(0, widget.isTop ? -1.0 : 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final child = SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _opacity,
        child: SafeArea(
          minimum: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 6,
          ),
          child: GestureDetector(
            onTap: widget.dismissible
                ? () {
                    widget.onTap?.call();
                    widget.onDismiss();
                  }
                : widget.onTap,
            child: _card(context),
          ),
        ),
      ),
    );

    return Positioned(
      top: widget.isTop ? media.padding.top : null,
      bottom: widget.isTop ? null : media.padding.bottom,
      left: 0,
      right: 0,
      child: Material(color: AppColors.transparent, child: child),
    );
  }

  Widget _card(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: RadialGradient(
                colors: [
                  widget.accent.withValues(alpha: 0.35),
                  widget.accent.withValues(alpha: 0.08),
                ],
              ),
            ),
            child: Icon(widget.icon, color: widget.accent, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                if (widget.title != null) ...[
                  Text(
                    widget.title!,
                    style: context.labelMedium.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w700,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  const SizedBox(height: 2),
                ],
                Text(
                  widget.message,
                  style: context.labelSmall.copyWith(
                    color: widget.title == null
                        ? context.textPrimary
                        : context.textSecondary,
                    fontSize: 12.5,
                    fontWeight: widget.title == null ? .w600 : .w500,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: .ellipsis,
                ),
                if (widget.showProgress) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      minHeight: 3,
                      backgroundColor: widget.accent.withValues(alpha: 0.12),
                      valueColor: AlwaysStoppedAnimation<Color>(widget.accent),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.dismissible) ...[
            const SizedBox(width: 8),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onDismiss,
              child: Icon(
                Icons.close_rounded,
                size: 16,
                color: context.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );

    if (context.isDark) {
      return GlassContainer(
        shape: const LiquidRoundedSuperellipse(borderRadius: 14),
        child: content,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: context.surfaceElevated,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: content,
    );
  }
}
