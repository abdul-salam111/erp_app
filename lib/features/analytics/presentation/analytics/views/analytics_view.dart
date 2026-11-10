import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../routes/route_exports.dart';

enum _Motif { bars, people, boxes }

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  static const _items = <_InsightItem>[
    _InsightItem(
      title: 'Sales Dashboard',
      description:
          'Executive sales KPIs, funnel, trend, backlog, and recent orders',
      icon: Iconsax.trend_up,
      color: AppColors.deepPurple,
      motif: _Motif.bars,
      routeName: RouteNames.sales_analytics,
    ),
    _InsightItem(
      title: 'Customer Dashboard',
      description: 'Customer KPIs, segmentation, lifecycle, retention, and LTV',
      icon: Iconsax.profile_2user,
      color: AppColors.errorBright,
      motif: _Motif.people,
      routeName: RouteNames.customer_analytics,
    ),
    _InsightItem(
      title: 'Product Dashboard',
      description:
          'ABC/XYZ, lifecycle, velocity, margin, basket, and stock risk',
      icon: Iconsax.box,
      color: AppColors.marigold,
      motif: _Motif.boxes,
      routeName: RouteNames.product_analytics,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            const _InsightsHeader(),
            Padding(
              padding: context.pagePadding.copyWith(top: 16, bottom: 28),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  for (final item in _items) ...[
                    _InsightCard(item: item),
                    if (item != _items.last) heightBox(16),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Hero header ─────────────────────────────────────────────────────────────

class _InsightsHeader extends StatelessWidget {
  const _InsightsHeader();

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    }
    if (name.isNotEmpty) return name[0].toUpperCase();
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    final height = Responsive.value<double>(
      context,
      phone: 230,
      tablet: 255,
      ipad: 280,
    );

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.isDark ? AppColors.navyHeaderDark : null,
                gradient: context.isDark
                    ? null
                    : LinearGradient(
                        colors: [
                          context.primary,
                          context.primary.withValues(alpha: 0.80),
                        ],
                        begin: .topLeft,
                        end: .bottomRight,
                      ),
              ),
            ),
          ),
          // Sat low in the header so the bars clear the title row above.
          Positioned(right: 20, bottom: 18, child: const _HeaderBars()),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: .fromLTRB(
                context.pagePadding.left,
                8,
                context.pagePadding.right,
                0,
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      if (context.canPop())
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: context.whiteText,
                              size: 18,
                            ),
                          ),
                        ),
                      const Spacer(),
                      Container(
                        width: 42,
                        height: 42,
                        alignment: .center,
                        decoration: BoxDecoration(
                          shape: .circle,
                          color: AppColors.white.withValues(alpha: 0.18),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.55),
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          _initials(currentUser.fullName),
                          style: context.labelMedium.copyWith(
                            color: context.whiteText,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  heightBox(14),
                  Text(
                    AppConstants.analyticsLabel,
                    style: context.headlineMedium.copyWith(
                      color: context.whiteText,
                      fontWeight: .w800,
                      fontSize: Responsive.value<double>(
                        context,
                        phone: 32,
                        tablet: 36,
                        ipad: 40,
                      ),
                    ),
                  ),
                  heightBox(6),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: Text(
                      'Explore dashboards and get business insights',
                      style: context.bodyLarge.copyWith(
                        color: context.whiteText.withValues(alpha: 0.88),
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBars extends StatelessWidget {
  const _HeaderBars();

  static const _heights = <double>[60, 96, 132];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .end,
      children: [
        for (final h in _heights) ...[
          Container(
            width: 28,
            height: h,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          if (h != _heights.last) widthBox(12),
        ],
      ],
    );
  }
}

// ─── Dashboard card ──────────────────────────────────────────────────────────

class _InsightCard extends StatelessWidget {
  final _InsightItem item;

  const _InsightCard({required this.item});

  static const _radius = 24.0;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;

    return InkWell(
      borderRadius: BorderRadius.circular(_radius),
      onTap: () => item.routeName != null
          ? context.pushNamed(item.routeName!)
          : AppToastsUtils.showInfoTop(context, '${item.title} — coming soon'),
      child: DecoratedBox(
        // Base layer, so the accent tint reads the same over a light card and
        // over the dark theme's navy.
        decoration: BoxDecoration(
          color: context.navyCard,
          borderRadius: BorderRadius.circular(_radius),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            border: Border.all(
              color: item.color.withValues(alpha: dark ? 0.26 : 0.12),
            ),
            gradient: LinearGradient(
              colors: [
                item.color.withValues(alpha: dark ? 0.14 : 0.05),
                item.color.withValues(alpha: dark ? 0.24 : 0.12),
              ],
              begin: .topLeft,
              end: .bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _CardWavePainter(color: item.color, isDark: dark),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 0,
                  child: _MotifArt(motif: item.motif, color: item.color),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 14, 34),
                  child: Row(
                    crossAxisAlignment: .start,
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: item.color.withValues(
                            alpha: dark ? 0.26 : 0.14,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(item.icon, color: item.color, size: 30),
                      ),
                      widthBox(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisSize: .min,
                          children: [
                            Text(
                              item.title,
                              style: context.titleMedium.copyWith(
                                color: context.textPrimary,
                                fontWeight: .w800,
                              ),
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                            heightBox(6),
                            Text(
                              item.description,
                              style: context.bodyMedium.copyWith(
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
                      // Sits level with the title rather than centred, so it
                      // does not drift down into the motif.
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: item.color.withValues(
                              alpha: dark ? 0.26 : 0.12,
                            ),
                          ),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: item.color,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Two waves climbing from the card's lower-left to its right edge, the back
/// one lighter — the bed the motif sits on.
class _CardWavePainter extends CustomPainter {
  final Color color;
  final bool isDark;

  const _CardWavePainter({required this.color, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    void wave(double leftY, double rightY, double alpha) {
      final path = Path()
        ..moveTo(0, h)
        ..lineTo(0, leftY)
        ..cubicTo(w * 0.34, leftY + 6, w * 0.46, rightY - 14, w, rightY)
        ..lineTo(w, h)
        ..close();
      canvas.drawPath(path, Paint()..color = color.withValues(alpha: alpha));
    }

    wave(h * 0.90, h * 0.22, isDark ? 0.12 : 0.09);
    wave(h * 1.02, h * 0.52, isDark ? 0.20 : 0.16);
  }

  @override
  bool shouldRepaint(covariant _CardWavePainter old) =>
      old.color != color || old.isDark != isDark;
}

// ─── Corner motifs ───────────────────────────────────────────────────────────

class _MotifArt extends StatelessWidget {
  final _Motif motif;
  final Color color;

  const _MotifArt({required this.motif, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Wide enough for the boxes motif, the widest of the three at 116px —
      // the others are right-aligned inside the same box.
      width: 120,
      height: 64,
      child: switch (motif) {
        _Motif.bars => _bars(),
        _Motif.people => _people(),
        _Motif.boxes => _boxes(),
      },
    );
  }

  Color _shade(double alpha) => color.withValues(alpha: alpha);

  Widget _bars() {
    const heights = <double>[22, 36, 50, 60];
    return Row(
      mainAxisAlignment: .end,
      crossAxisAlignment: .end,
      children: [
        for (var i = 0; i < heights.length; i++) ...[
          Container(
            width: 14,
            height: heights[i],
            decoration: BoxDecoration(
              color: _shade(0.40 + i * 0.07),
              borderRadius: const BorderRadius.vertical(top: .circular(4)),
            ),
          ),
          if (i != heights.length - 1) const SizedBox(width: 7),
        ],
      ],
    );
  }

  Widget _person(
    double headSize,
    double bodyWidth,
    double bodyHeight,
    double alpha,
  ) {
    return Column(
      mainAxisSize: .min,
      mainAxisAlignment: .end,
      children: [
        Container(
          width: headSize,
          height: headSize,
          decoration: BoxDecoration(shape: .circle, color: _shade(alpha)),
        ),
        const SizedBox(height: 3),
        Container(
          width: bodyWidth,
          height: bodyHeight,
          decoration: BoxDecoration(
            color: _shade(alpha),
            borderRadius: const BorderRadius.vertical(top: .circular(18)),
          ),
        ),
      ],
    );
  }

  Widget _people() {
    return Row(
      mainAxisAlignment: .end,
      crossAxisAlignment: .end,
      children: [
        _person(18, 30, 24, 0.38),
        const SizedBox(width: 4),
        _person(26, 42, 32, 0.52),
      ],
    );
  }

  Widget _box(double size, double alpha) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _shade(alpha),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _boxes() {
    return Row(
      mainAxisAlignment: .end,
      crossAxisAlignment: .end,
      children: [
        _box(26, 0.36),
        const SizedBox(width: 5),
        _box(34, 0.44),
        const SizedBox(width: 5),
        _box(46, 0.55),
      ],
    );
  }
}

class _InsightItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final _Motif motif;
  final String? routeName;

  const _InsightItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.motif,
    this.routeName,
  });
}
