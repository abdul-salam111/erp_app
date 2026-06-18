import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';

class CreditStatCards extends StatelessWidget {
  const CreditStatCards({super.key});

  static const _items = [
    _StatCardData(
      label: '30 Days Total',
      value: '0',
      accentColor: AppColors.grey400,
    ),
    _StatCardData(
      label: '60 Days Total',
      value: '2,000',
      accentColor: AppColors.primary,
    ),
    _StatCardData(
      label: '90+ Days Total',
      value: '266,794,381.52',
      accentColor: Color(0xFFFF9800),
    ),
    _StatCardData(
      label: 'Total',
      value: '266,796,381.52',
      accentColor: AppColors.primary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              Expanded(child: _StatCard(data: _items[0])),
              const SizedBox(width: 6),
              Expanded(child: _StatCard(data: _items[1])),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: _StatCard(data: _items[2])),
              const SizedBox(width: 6),
              Expanded(child: _StatCard(data: _items[3])),
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
                    Row(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Text(
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
                        ),
                        Row(
                          mainAxisSize: .min,
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              size: 9,
                              color: AppColors.greenDark,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '5.39%',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greenDark,
                              ),
                            ),
                          ],
                        ),
                      ],
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
