import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';

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
        value: firstSegmentAmount.asPrice,
        accentColor: AppColors.grey400,
      ),
      _StatCardData(
        label: '60 Days Total',
        value: secondSegmentAmount.asPrice,
        accentColor: AppColors.primary,
      ),
      _StatCardData(
        label: '90 Days Total',
        value: thirdSegmentAmount.asPrice,
        accentColor: const Color(0xFFFF9800),
      ),
      _StatCardData(
        label: '90+ Days Total',
        value: fourthSegmentAmount.asPrice,
        accentColor: const Color(0xFFE53935),
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
              const SizedBox(width: 6),
              Expanded(child: _StatCard(data: items[1])),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: _StatCard(data: items[2])),
              const SizedBox(width: 6),
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
  final String value;
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
            Container(width: 4, color: data.accentColor),
            Expanded(
              child: Padding(
                padding: .symmetric(horizontal: 10, vertical: 9),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      data.value,
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
                      data.label,
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
