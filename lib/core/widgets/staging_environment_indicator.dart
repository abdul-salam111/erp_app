import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../config/app_config.dart';
import '../theme/theme_exports.dart';

/// One-line notice shown only while the app is pointed at the staging
/// environment — a self-contained amber chip, so it stays legible in both
/// light and dark mode without depending on the host screen's theme tokens.
class StagingEnvironmentNotice extends StatelessWidget {
  const StagingEnvironmentNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppEnvironment>(
      valueListenable: AppConfig.instance.environmentNotifier,
      builder: (context, env, _) {
        if (env != AppEnvironment.staging) return const SizedBox.shrink();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.warning.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.warning.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              Icon(Iconsax.warning_2, size: 14, color: AppColors.warningDark),
              const SizedBox(width: 6),
              Text(
                'Staging environment — not production data',
                style: context.labelSmall.copyWith(
                  color: AppColors.warningDark,
                  fontWeight: .w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Pins a slim "STAGING ENVIRONMENT" strip to the very top of [child]
/// (above its app bar) while the app is pointed at the staging environment.
/// Reacts live to [AppConfig.environmentNotifier], so it updates even if
/// the switch happened on another screen (e.g. the sign-in logo or the
/// profile avatar's 5-tap gesture) while this one stayed mounted.
class StagingBannerScope extends StatelessWidget {
  final Widget child;

  const StagingBannerScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppEnvironment>(
      valueListenable: AppConfig.instance.environmentNotifier,
      builder: (context, env, _) {
        if (env != AppEnvironment.staging) return child;
        return Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.warning,
              padding: EdgeInsets.only(
                top: MediaQuery.paddingOf(context).top + 4,
                bottom: 4,
              ),
              child: Text(
                'STAGING ENVIRONMENT',
                textAlign: .center,
                style: context.labelSmall.copyWith(
                  color: AppColors.black,
                  fontWeight: .w700,
                  fontSize: 11,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            Expanded(
              // The banner above already accounts for the status-bar inset,
              // so strip it here or the nested Scaffold's AppBar would add
              // that same top padding a second time.
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
