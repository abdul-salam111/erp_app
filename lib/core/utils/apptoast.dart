import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class AppToasts {
  static Flushbar<dynamic>? _currentFlushbar;
  static bool _isDialogShowing = false;

  // ✅ Dismiss any existing toast
  static void _dismissCurrentToast() {
    if (_currentFlushbar != null && _currentFlushbar!.isShowing()) {
      _currentFlushbar!.dismiss();
      _currentFlushbar = null;
    }
  }

  // ✅ SUCCESS TOAST
  static void showSuccessToast(BuildContext context, String message) {
    _dismissCurrentToast();
    _currentFlushbar = Flushbar(
      title: "Success",
      message: message,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle, color: Colors.white),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    )..show(context).then((_) => _currentFlushbar = null);
  }

  // ✅ ERROR TOAST
  static void showErrorToast(BuildContext context, String message) {
    _dismissCurrentToast();
    _currentFlushbar = Flushbar(
      title: "Error",
      message: message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.white),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    )..show(context).then((_) => _currentFlushbar = null);
  }

  // ✅ WARNING TOAST
  static void showWarningToast(BuildContext context, String message) {
    _dismissCurrentToast();
    _currentFlushbar = Flushbar(
      title: "Info",
      message: message,
      backgroundColor: Colors.orange,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.warning, color: Colors.white),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    )..show(context).then((_) => _currentFlushbar = null);
  }

  // ✅ LOADER DIALOG
  static void showLoaderDialog(BuildContext context, String message) {
    if (_isDialogShowing) return;

    _isDialogShowing = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((_) {
      _isDialogShowing = false;
    });
  }

  // ✅ DISMISS SINGLE (toast + dialog)
  static void dismiss(BuildContext context) {
    _dismissCurrentToast();

    if (_isDialogShowing && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      _isDialogShowing = false;
    }
  }

  // ✅ FORCE DISMISS ALL
  static void dismissAll(BuildContext context) {
    _dismissCurrentToast();

    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    _isDialogShowing = false;
  }
}

// ✅ DISMISS KEYBOARD HELPER
void dismissKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild!.unfocus();
  }
  FocusManager.instance.primaryFocus?.unfocus();
}
