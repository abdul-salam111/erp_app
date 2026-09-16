import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/widgets/widgets.dart';

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
            const SizedBox(width: 10),
            Expanded(
              child: _DayStatCard(
                label: '60 Days',
                value: secondSegment,
                accentColor: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _DayStatCard(
                label: '90 Days',
                value: thirdSegment,
                accentColor: AppColors.orange,
              ),
            ),
            const SizedBox(width: 10),
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
    return SizedBox(
      height: 68,
      child: GlassSurface(
        radius: 10,
        clipBehavior: .hardEdge,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            Container(width: 4, color: accentColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      value,
                      style: context.bodyMedium.copyWith(
                        fontWeight: .w800,
                        color: context.textPrimary,
                        fontSize: 17,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      label.toUpperCase(),
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontWeight: .w700,
                        fontSize: 9.5,
                        letterSpacing: 0.7,
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
