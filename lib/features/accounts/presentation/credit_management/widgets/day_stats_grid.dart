import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class DayStatsGrid extends StatelessWidget {
  final String firstSegment;
  final String secondSegment;
  final String thirdSegment;
  final String fourthSegment;

  const DayStatsGrid({
    super.key,
    required this.firstSegment,
    required this.secondSegment,
    required this.thirdSegment,
    required this.fourthSegment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _DayStatCard(
                label: '30 Days',
                value: firstSegment,
                accentColor: AppColors.grey400,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _DayStatCard(
                label: '60 Days',
                value: secondSegment,
                accentColor: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _DayStatCard(
                label: '90 Days',
                value: thirdSegment,
                accentColor: AppColors.orange,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _DayStatCard(
                label: '90+ Days',
                value: fourthSegment,
                accentColor: AppColors.errorBright,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DayStatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color accentColor;
  const _DayStatCard({
    required this.label,
    required this.value,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: .all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            Container(width: 4, color: accentColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      value,
                      style: context.bodyMedium.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 13,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 10,
                        height: 1.1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
