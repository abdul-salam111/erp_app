import 'package:flutter/material.dart';

import 'theme_exports.dart';

/// Extension to provide quick access to theme properties
extension ThemeExtension on BuildContext {
  // ============ TEXT STYLES ============

  /// Display styles (largest)
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  /// Headline styles
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  /// Title styles
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  /// Body styles (most common)
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  /// Label styles (smallest)
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
}

extension AppColorExtension on BuildContext {
  // Brand Colors
  Color get primary => AppColors.primary;
  Color get primaryDark => AppColors.primaryDark;
  Color get primaryLight => AppColors.primaryLight;

  Color get secondary => AppColors.secondary;
  Color get secondaryDark => AppColors.secondaryDark;
  Color get secondaryLight => AppColors.secondaryLight;

  Color get tertiary => AppColors.tertiary;
  Color get tertiaryDark => AppColors.tertiaryDark;
  Color get tertiaryLight => AppColors.tertiaryLight;

  // Semantic Colors
  Color get success => AppColors.success;
  Color get error => AppColors.error;
  Color get warning => AppColors.warning;
  Color get info => AppColors.info;
  Color get critical => AppColors.critical;

  // Background (theme-aware)
  Color get background =>
      isDark ? AppColors.backgroundDark : AppColors.backgroundLight;
  Color get surface => isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
  Color get surfaceElevated =>
      isDark ? AppColors.surfaceElevatedDark : AppColors.surfaceElevatedLight;

  // Text (theme-aware)
  Color get textPrimary =>
      isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
  Color get textSecondary =>
      isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
  Color get textDisabled =>
      isDark ? AppColors.textDisabledDark : AppColors.textDisabledLight;

  // Borders (theme-aware)
  Color get border => isDark ? AppColors.borderDark : AppColors.borderLight;
  Color get divider => isDark ? AppColors.dividerDark : AppColors.dividerLight;

  // Financial semantic colors (theme-aware) — bright variants in dark mode
  // stay legible on navy backgrounds.
  Color get debitColor =>
      isDark ? const Color(0xFFF87171) : AppColors.debitRed;
  Color get creditColor =>
      isDark ? const Color(0xFF34D399) : AppColors.creditGreen;

  // Flat surface fills (theme-aware)
  Color get tableRowAlt =>
      isDark ? AppColors.tableRowAltDark : AppColors.tableRowAlt;
  Color get shimmerBase =>
      isDark ? AppColors.shimmerBaseDark : AppColors.shimmerBase;
  Color get surfaceHeader =>
      isDark ? AppColors.surfaceHeaderDark : AppColors.surfaceHeader;
  Color get loginBackground =>
      isDark ? AppColors.loginBackgroundDark : AppColors.loginBackground;
  Color get debitContainer =>
      isDark ? AppColors.debitContainerDark : AppColors.debitContainer;
  Color get creditContainer =>
      isDark ? AppColors.creditContainerDark : AppColors.creditContainer;

  // Navy accent surfaces (theme-aware) — reusable dark elevated look for
  // hero headers, cards and icon chips; falls back to the regular
  // surface/border/primary tokens in light mode.
  Color get navyCard => isDark ? AppColors.navyCardDark : surfaceElevated;
  Color get navyBorder => isDark ? AppColors.navyBorderDark : border;
  Color get navyIconBg =>
      isDark ? AppColors.navyIconBgDark : primary.withValues(alpha: 0.10);
  Color get navyIconColor => isDark ? AppColors.navyIconColorDark : primary;

  // Grey Scale
  Color get grey50 => AppColors.grey50;
  Color get grey100 => AppColors.grey100;
  Color get grey200 => AppColors.grey200;
  Color get grey300 => AppColors.grey300;
  Color get grey400 => AppColors.grey400;
  Color get grey500 => AppColors.grey500;
  Color get grey600 => AppColors.grey600;
  Color get grey700 => AppColors.grey700;
  Color get grey800 => AppColors.grey800;
  Color get grey900 => AppColors.grey900;

  // Utilities
  Color get white => AppColors.white;
  Color get black => AppColors.black;
  Color get transparent => AppColors.transparent;
  Color get overlay => isDark ? AppColors.overlayDark : AppColors.overlayLight;
  Color get scrim => AppColors.scrim;
  Color get shadow => isDark ? AppColors.shadowDark : AppColors.shadow;

  // Theme check
  bool get isDark => Theme.of(this).brightness == .dark;
}
