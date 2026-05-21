import 'package:flutter/material.dart';

/// Breakpoints (width-based, matches common tablet/iPad sizes)
///   phone  : < 600 px
///   tablet : 600 – 899 px
///   iPad   : ≥ 900 px  (primary target — iPad Air/Pro, large Android tablets)
class Breakpoints {
  const Breakpoints._();

  static const double phone = 600;
  static const double tablet = 900;
}

/// Responsive layout helper.
///
/// Usage:
/// ```dart
/// Responsive.value(
///   context,
///   phone: 2,
///   tablet: 3,
///   ipad: 4,
/// )
/// ```
class Responsive {
  const Responsive._();

  static bool isPhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width < Breakpoints.phone;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= Breakpoints.phone && w < Breakpoints.tablet;
  }

  static bool isIpad(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= Breakpoints.tablet;

  /// Returns one of three values based on the current screen width.
  /// [ipad] falls back to [tablet] if omitted.
  static T value<T>(
    BuildContext context, {
    required T phone,
    required T tablet,
    T? ipad,
  }) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= Breakpoints.tablet) return ipad ?? tablet;
    if (w >= Breakpoints.phone) return tablet;
    return phone;
  }
}

/// Convenience extensions on [BuildContext].
extension ResponsiveContext on BuildContext {
  bool get isPhone => Responsive.isPhone(this);
  bool get isTablet => Responsive.isTablet(this);
  bool get isIpad => Responsive.isIpad(this);

  /// Horizontal page padding — tighter on phones, roomier on iPad.
  EdgeInsets get pagePadding => EdgeInsets.all(
        Responsive.value(this, phone: 10, tablet: 16, ipad: 24),
      );

  /// Spacing between grid/list items.
  double get gridSpacing =>
      Responsive.value<double>(this, phone: 8, tablet: 10, ipad: 14);

  /// Grid column count for overview-style card grids (primary = iPad 4-col).
  int get gridColumnCount =>
      Responsive.value<int>(this, phone: 2, tablet: 3, ipad: 4);

  /// Aspect ratio for overview cards — wider on iPad to avoid excessive height.
  double get overviewCardRatio =>
      Responsive.value<double>(this, phone: 2.4, tablet: 2.6, ipad: 3.0);
}
