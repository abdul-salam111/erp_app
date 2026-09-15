import 'package:flutter/material.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
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
    final resolvedIconColor = iconColor ?? textColor ?? AppColors.white;
    final leading = icon != null
        ? Icon(icon, color: resolvedIconColor)
        : Icon(_iconFor(type), color: resolvedIconColor);

    FloatingSnackBar.show(
      context,
      message,
      title: title,
      type: _typeFor(type),
      position: _positionFor(position),
      duration: duration,
      leading: leading,
      backgroundColor: backgroundColor ?? _backgroundFor(context, type),
      textColor: textColor ?? AppColors.white,
      dismissOnTap: isDismissible,
      showProgress: showProgressIndicator,
    );
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

  // Corner positions are collapsed to top/bottom — floating_snackbar only
  // supports top/bottom anchoring.
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
    FloatingSnackBar.show(
      context,
      message,
      type: _typeFor(type),
      position: _positionFor(position),
      backgroundColor: _backgroundFor(context, type),
      textColor: AppColors.white,
      leading: Icon(_iconFor(type), color: AppColors.white),
      action: FloatingSnackBarAction(
        label: actionText,
        onPressed: onActionPressed,
        textColor: AppColors.white,
      ),
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

  static void dismissCurrent([BuildContext? context]) {
    FloatingSnackBar.dismiss(context);
  }

  static FloatingSnackBarPosition _positionFor(ToastPosition p) {
    switch (p) {
      case ToastPosition.bottom:
      case ToastPosition.bottomLeft:
      case ToastPosition.bottomRight:
        return FloatingSnackBarPosition.bottom;
      case ToastPosition.top:
      case ToastPosition.topLeft:
      case ToastPosition.topRight:
      case ToastPosition.center:
        return FloatingSnackBarPosition.top;
    }
  }

  static FloatingSnackBarType _typeFor(ToastType t) {
    switch (t) {
      case ToastType.success:
        return FloatingSnackBarType.success;
      case ToastType.error:
        return FloatingSnackBarType.error;
      case ToastType.warning:
        return FloatingSnackBarType.warning;
      case ToastType.info:
        return FloatingSnackBarType.info;
      case ToastType.custom:
        return FloatingSnackBarType.normal;
    }
  }

  static Color _backgroundFor(BuildContext context, ToastType t) {
    switch (t) {
      case ToastType.success:
        return AppColors.success;
      case ToastType.error:
        return AppColors.error;
      case ToastType.warning:
        return AppColors.orange;
      case ToastType.info:
        return context.isDark ? AppColors.backgroundDark : AppColors.info;
      case ToastType.custom:
        return AppColors.grey400;
    }
  }

  static IconData _iconFor(ToastType t) {
    switch (t) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
        return Icons.info;
      case ToastType.custom:
        return Icons.notifications;
    }
  }
}
