import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../routes/route_exports.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  static const _items = <_InsightItem>[
    _InsightItem(
      title: 'Sales Dashboard',
      description:
          'Executive sales KPIs, funnel, trend, backlog, and recent orders',
      icon: Iconsax.trend_up,
      color: AppColors.deepPurple,
      routeName: RouteNames.sales_analytics,
    ),
    _InsightItem(
      title: 'Customer Dashboard',
      description:
          'Customer KPIs, segmentation, lifecycle, retention, and LTV',
      icon: Iconsax.profile_2user,
      color: AppColors.errorBright,
    ),
    _InsightItem(
      title: 'Product Dashboard',
      description:
          'ABC/XYZ, lifecycle, velocity, margin, basket, and stock risk',
      icon: Iconsax.box,
      color: AppColors.marigold,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: AppConstants.analyticsLabel),
      body: SingleChildScrollView(
        padding: context.pagePadding,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            for (final item in _items) ...[
              _InsightCard(item: item),
              if (item != _items.last) heightBox(context.gridSpacing),
            ],
          ],
        ),
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final _InsightItem item;

  const _InsightCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => item.routeName != null
          ? context.pushNamed(item.routeName!)
          : AppToastsUtils.showInfoTop(context, '${item.title} — coming soon'),
      child: Container(
        decoration: BoxDecoration(
          color: context.navyCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.navyBorder),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: context.isDark ? 0.22 : 0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(item.icon, color: item.color, size: 24),
            ),
            widthBox(14),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    item.title,
                    style: context.titleSmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w700,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  heightBox(4),
                  Text(
                    item.description,
                    style: context.bodySmall.copyWith(
                      color: context.textSecondary,
                      height: 1.35,
                    ),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
            widthBox(8),
            Icon(
              Icons.chevron_right_rounded,
              color: context.textSecondary,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String? routeName;

  const _InsightItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.routeName,
  });
}
