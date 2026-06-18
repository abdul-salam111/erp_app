import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class DayStatsGrid extends StatelessWidget {
  const DayStatsGrid({super.key});

  static const _stats = [
    ('30 Days', 'Rs 0', AppColors.grey400),
    ('60 Days', 'Rs 1,000', AppColors.primary),
    ('90 Days', 'Rs 0', Color(0xFFFF9800)),
    ('90+ Days', 'Rs 0', Color(0xFFE53935)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _DayStatCard(
                label: _stats[0].$1,
                value: _stats[0].$2,
                accentColor: _stats[0].$3,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _DayStatCard(
                label: _stats[1].$1,
                value: _stats[1].$2,
                accentColor: _stats[1].$3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _DayStatCard(
                label: _stats[2].$1,
                value: _stats[2].$2,
                accentColor: _stats[2].$3,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _DayStatCard(
                label: _stats[3].$1,
                value: _stats[3].$2,
                accentColor: _stats[3].$3,
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
