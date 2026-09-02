import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/services/current_user.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../routes/route_names.dart';
import '../how_to_use/how_to_use_view.dart';

class PartahHomeView extends StatelessWidget {
  const PartahHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: context.background,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _HomeHeaderDelegate(topPadding: topPadding),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Main feature — Partah full width ──
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: _MenuCard(card: _mainMenu(context)[0], centered: true),
                  ),
                  heightBox(14),
                  // ── Reports + Settings ──
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        _MenuCard(card: _mainMenu(context)[1], compact: true).expanded(),
                        widthBox(14),
                        _MenuCard(card: _mainMenu(context)[2], compact: true).expanded(),
                      ],
                    ),
                  ),
                  heightBox(28),

                  // ── Section header ──
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 18,
                        decoration: BoxDecoration(
                          color: context.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      widthBox(10),
                      Text(
                        'Discover & Support',
                        style: context.titleSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.textPrimary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                  heightBox(14),

                  // ── How to Use + Mantic ERP ──
                  Row(
                    children: [
                      _InfoCard(card: _infoMenu(context)[0]).expanded(),
                      widthBox(12),
                      _InfoCard(card: _infoMenu(context)[1]).expanded(),
                    ],
                  ),
                  heightBox(12),
                  // ── More Software (full width) ──
                  SizedBox(
                    width: double.infinity,
                    child: _InfoCard(card: _infoMenu(context)[2], wide: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Menu data ─────────────────────────────────────────────────────────────

  List<_MenuCardData> _mainMenu(BuildContext context) => [
        _MenuCardData(
          title: 'Partah',
          subtitle: 'Calculate item rates & profit',
          icon: Icons.calculate_rounded,
          gradient: const LinearGradient(
            colors: [Color(0xFF5B9BD5), Color(0xFF3A78C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          onTap: () => context.pushNamed(RouteNames.partah),
        ),
        _MenuCardData(
          title: 'Reports',
          subtitle: 'View history & summaries',
          icon: Icons.bar_chart_rounded,
          gradient: const LinearGradient(
            colors: [Color(0xFF4BAE8A), Color(0xFF2D8C6A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          onTap: () => context.pushNamed(RouteNames.reports),
        ),
        _MenuCardData(
          title: 'Settings',
          subtitle: 'Products & base weight',
          icon: Icons.tune_rounded,
          gradient: const LinearGradient(
            colors: [Color(0xFF8B6BBE), Color(0xFF6B4DA0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          onTap: () => context.pushNamed(RouteNames.partah_settings),
        ),
      ];

  List<_InfoCardData> _infoMenu(BuildContext context) => [
        _InfoCardData(
          title: 'How to Use',
          subtitle: 'Step-by-step tutorial',
          icon: Icons.play_circle_outline_rounded,
          color: const Color(0xFFFF8C42),
          onTap: () => showDialog(
            context: context,
            barrierColor: Colors.black87,
            builder: (_) => const YoutubePopup(),
          ),
        ),
        _InfoCardData(
          title: 'Mantic ERP',
          subtitle: 'Full business management',
          icon: Icons.business_center_rounded,
          color: const Color(0xFF5C6BC0),
          onTap: () => _launchUrl(context, 'https://softronix.pk/products/mantic-erp/'),
        ),
        _InfoCardData(
          title: 'More Software',
          subtitle: 'Explore our other apps',
          icon: Icons.apps_rounded,
          color: const Color(0xFF26C6DA),
          onTap: () => context.pushNamed(RouteNames.more_software),
        ),
      ];

  static Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) AppToastsUtils.showErrorTop(context, 'Could not open link');
    }
  }
}

// ─── Persistent Header Delegate ───────────────────────────────────────────────

class _HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double topPadding;

  const _HomeHeaderDelegate({required this.topPadding});

  static const double _expandedContentHeight = 180.0;

  @override
  double get maxExtent => topPadding + _expandedContentHeight;

  @override
  double get minExtent => topPadding + kToolbarHeight;

  @override
  bool shouldRebuild(covariant _HomeHeaderDelegate oldDelegate) =>
      oldDelegate.topPadding != topPadding;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final maxShrink = maxExtent - minExtent;
    final progress =
        maxShrink > 0 ? (shrinkOffset / maxShrink).clamp(0.0, 1.0) : 0.0;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32 * (1 - progress)),
          bottomRight: Radius.circular(32 * (1 - progress)),
        ),
      ),
      child: ClipRect(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Stack(
            children: [
              OverflowBox(
                maxHeight: _expandedContentHeight,
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: (1.0 - progress * 1.5).clamp(0.0, 1.0),
                  child: _buildExpandedContent(context),
                ),
              ),
              Opacity(
                opacity: ((progress - 0.4) / 0.6).clamp(0.0, 1.0),
                child: _buildCollapsedContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _HeaderBackButton(size: 36),
              const Spacer(),
              const _ProfileAvatar(size: 40),
            ],
          ),
          heightBox(20),
          Text(
            currentUser.org.name.isNotEmpty ? currentUser.org.name : 'Mantic ERP',
            style: context.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          heightBox(6),
          Text(
            'Calculate rates · Track profits · Stay ahead',
            style: context.bodySmall.copyWith(
              color: Colors.white.withAlpha(200),
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedContent(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: _HeaderBackButton(size: 30),
            ),
            Center(
              child: Text(
                'Home',
                style: context.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: _ProfileAvatar(size: 36),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Header Back Button ───────────────────────────────────────────────────────

class _HeaderBackButton extends StatelessWidget {
  final double size;
  const _HeaderBackButton({required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(30),
          borderRadius: BorderRadius.circular(size * 0.28),
        ),
        alignment: Alignment.center,
        child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: size * 0.55),
      ),
    );
  }
}

// ─── Profile Avatar (initials, from currentUser — no Firebase needed) ────────

class _ProfileAvatar extends StatelessWidget {
  final double size;
  const _ProfileAvatar({required this.size});

  @override
  Widget build(BuildContext context) {
    final name = currentUser.fullName.trim();
    final initials = name.isNotEmpty
        ? name.split(RegExp(r'\s+')).take(2).map((w) => w[0].toUpperCase()).join()
        : '?';

    return GestureDetector(
      onTap: () => context.pushNamed(RouteNames.profile),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withAlpha(50),
          border: Border.all(color: Colors.white.withAlpha(80), width: 2),
        ),
        child: Center(
          child: Text(
            initials,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Menu Card (gradient) ─────────────────────────────────────────────────────

class _MenuCardData {
  final String title;
  final String subtitle;
  final IconData icon;
  final LinearGradient gradient;
  final VoidCallback onTap;

  const _MenuCardData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });
}

class _MenuCard extends StatelessWidget {
  final _MenuCardData card;
  final bool centered;
  final bool compact;
  const _MenuCard({required this.card, this.centered = false, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final iconSize = compact ? 38.0 : 52.0;
    final iconInnerSize = compact ? 20.0 : 28.0;
    final padding = compact
        ? const EdgeInsets.fromLTRB(14, 12, 14, 12)
        : const EdgeInsets.all(20);

    return Container(
      decoration: BoxDecoration(
        gradient: card.gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: card.gradient.colors.first.withAlpha(50),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -18,
            right: -18,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withAlpha(18),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -10,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withAlpha(12),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment:
                  centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              mainAxisAlignment:
                  centered ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(35),
                    borderRadius: BorderRadius.circular(compact ? 10 : 14),
                  ),
                  child:
                      Icon(card.icon, color: Colors.white, size: iconInnerSize).center(),
                ),
                if (!centered) const Spacer(),
                if (centered) heightBox(12),
                Text(
                  card.title,
                  style: context.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                heightBox(2),
                Text(
                  card.subtitle,
                  style: context.labelSmall.copyWith(
                    color: Colors.white.withAlpha(190),
                    height: 1.3,
                    fontSize: compact ? 10 : null,
                  ),
                ),
              ],
            ).withPadding(padding),
          ),
        ],
      ),
    ).onTap(card.onTap);
  }
}

// ─── Info Card (flat) ─────────────────────────────────────────────────────────

class _InfoCardData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _InfoCardData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

class _InfoCard extends StatelessWidget {
  final _InfoCardData card;
  final bool wide;
  const _InfoCard({required this.card, this.wide = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.border.withAlpha(180)),
        boxShadow: [
          BoxShadow(
            color: context.primary.withAlpha(8),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: wide ? _wideContent(context) : _stackedContent(context),
    ).onTap(card.onTap);
  }

  Widget _iconBox() => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: card.color.withAlpha(22),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(card.icon, color: card.color, size: 22).center(),
      );

  Widget _arrowBox() => Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: card.color.withAlpha(18),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.arrow_forward_rounded, size: 14, color: card.color).center(),
      );

  Widget _stackedContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _iconBox(),
        heightBox(8),
        Text(
          card.title,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.w700,
            color: context.textPrimary,
          ),
        ),
        heightBox(2),
        Text(
          card.subtitle,
          style: context.labelSmall.copyWith(color: context.textSecondary, height: 1.3),
        ),
        heightBox(6),
        Row(
          children: [
            const Spacer(),
            _arrowBox(),
          ],
        ),
      ],
    );
  }

  Widget _wideContent(BuildContext context) {
    return Row(
      children: [
        _iconBox(),
        widthBox(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.title,
                style: context.titleSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.textPrimary,
                ),
              ),
              heightBox(2),
              Text(
                card.subtitle,
                style: context.labelSmall.copyWith(color: context.textSecondary, height: 1.3),
              ),
            ],
          ),
        ),
        widthBox(12),
        _arrowBox(),
      ],
    );
  }
}
