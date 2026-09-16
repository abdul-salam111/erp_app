import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class CreditStatCards extends StatelessWidget {
  final double firstSegmentAmount;
  final double secondSegmentAmount;
  final double thirdSegmentAmount;
  final double fourthSegmentAmount;

  const CreditStatCards({
    super.key,
    required this.firstSegmentAmount,
    required this.secondSegmentAmount,
    required this.thirdSegmentAmount,
    required this.fourthSegmentAmount,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _StatCardData(
        label: '30 Days Total',
        value: firstSegmentAmount,
        accentColor: AppColors.grey400,
      ),
      _StatCardData(
        label: '60 Days Total',
        value: secondSegmentAmount,
        accentColor: AppColors.primary,
      ),
      _StatCardData(
        label: '90 Days Total',
        value: thirdSegmentAmount,
        accentColor: AppColors.orange,
      ),
      _StatCardData(
        label: '90+ Days Total',
        value: fourthSegmentAmount,
        accentColor: AppColors.errorBright,
      ),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        0,
        context.pagePadding.right,
        8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _StatCard(data: items[0])),
              const SizedBox(width: 8),
              Expanded(child: _StatCard(data: items[1])),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _StatCard(data: items[2])),
              const SizedBox(width: 8),
              Expanded(child: _StatCard(data: items[3])),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCardData {
  final String label;
  final double value;
  final Color accentColor;

  const _StatCardData({
    required this.label,
    required this.value,
    required this.accentColor,
  });
}

class _StatCard extends StatelessWidget {
  final _StatCardData data;
  const _StatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: GlassSurface(
        radius: 10,
        clipBehavior: .hardEdge,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            Container(width: 4, color: data.accentColor),
            Expanded(
              child: Padding(
                padding: .fromLTRB(14, 12, 12, 12),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      tween: Tween(begin: 0.0, end: data.value),
                      builder: (context, v, _) => Text(
                        v.toCompact(decimals: 2),
                        style: context.titleMedium.copyWith(
                          fontWeight: .w800,
                          color: context.textPrimary,
                          fontSize: 20,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.label.toUpperCase(),
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 10,
                        fontWeight: .w700,
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
