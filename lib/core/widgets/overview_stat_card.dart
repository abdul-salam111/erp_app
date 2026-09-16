import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';

class OverviewStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final bool showBorder;

  const OverviewStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: context.isDark ? _glassCard(context) : _solidCard(context),
    );
  }

  Widget _glassCard(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            gradient: LinearGradient(
              begin: .topLeft,
              end: .bottomRight,
              colors: [
                AppColors.white.withValues(alpha: 0.06),
                AppColors.white.withValues(alpha: 0.02),
              ],
            ),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.10),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: _body(context),
        ),
      ),
    );
  }

  Widget _solidCard(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.surfaceElevated,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      alignment: .centerLeft,
      children: [
        // ── Decorative arcs — top-right corner ────────────
        Positioned(
          top: -18,
          right: -18,
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: context.isDark
                  ? AppColors.navyIconColorDark.withValues(alpha: 0.08)
                  : color.withValues(alpha: 0.08),
              shape: .circle,
            ),
          ),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: context.isDark
                  ? AppColors.navyIconColorDark.withValues(alpha: 0.09)
                  : color.withValues(alpha: 0.09),
              shape: .circle,
            ),
          ),
        ),
        // ── Content ───────────────────────────────────────
        Row(
          crossAxisAlignment: .stretch,
          children: [
            Expanded(
              child: Padding(
                padding: .symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  crossAxisAlignment: .center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: .circular(8),
                        color: context.isDark
                            ? context.navyIconBg
                            : color.withValues(alpha: 0.10),
                      ),
                      child: Icon(icon, color: color, size: 16),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            value,
                            style: context.bodyMedium.copyWith(
                              fontWeight: .w700,
                              color: context.textPrimary,
                              fontSize: 17,
                              height: 1,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            label,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 12,
                              height: 1.1,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OverviewItem {
  final String label;
  final IconData icon;
  final Color color;

  const OverviewItem({
    required this.label,
    required this.icon,
    required this.color,
  });
}
