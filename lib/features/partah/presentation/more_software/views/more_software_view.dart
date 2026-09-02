import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';

// ── Software data ─────────────────────────────────────────────────────────────

class _Software {
  final String name;
  final String tagline;
  final String iconPath;
  final Color color;
  final String url;

  const _Software({
    required this.name,
    required this.tagline,
    required this.iconPath,
    required this.color,
    required this.url,
  });
}

const _softwares = [
  _Software(
    name: 'Pharma Suite Plus',
    tagline: 'Pharmaceutical distribution management',
    iconPath: 'assets/icons/pharma-suit-plus.png',
    color: Color(0xFFE53935),
    url: 'https://softronix.pk/products/pharmaceutical-distribution-software/',
  ),
  _Software(
    name: 'Intellibiz',
    tagline: 'Supply chain for FMCG distributors',
    iconPath: 'assets/icons/intellibiz.png',
    color: Color(0xFF1E88E5),
    url: 'https://softronix.pk/products/distribution-management-software/',
  ),
  _Software(
    name: 'Flour Mill Software',
    tagline: 'Cloud & offline flour mill management',
    iconPath: 'assets/icons/flour-mills.png',
    color: Color(0xFFF4A623),
    url: 'https://softronix.pk/software-for-flour-mills/',
  ),
  _Software(
    name: 'MARS',
    tagline: 'Affordable pharmacy store software',
    iconPath: 'assets/icons/mars.png',
    color: Color(0xFF43A047),
    url: 'https://softronix.pk/products/pharmacy-management-system/',
  ),
  _Software(
    name: 'Petrofy',
    tagline: 'Petrol pump & fuel stock management',
    iconPath: 'assets/icons/petrofy.png',
    color: Color(0xFFE53935),
    url: 'https://softronix.pk/products/petrol-pump-management-software/',
  ),
  _Software(
    name: 'Quick Sell',
    tagline: 'Supermarket point of sale software',
    iconPath: 'assets/icons/quick-sell.png',
    color: Color(0xFFFF7043),
    url: 'https://softronix.pk/products/pos-software-point-of-sale-software/',
  ),
  _Software(
    name: 'Rice Mill Software',
    tagline: 'Rice processing & business management',
    iconPath: 'assets/icons/rice-mill.png',
    color: Color(0xFF8D6E63),
    url: 'https://softronix.pk/products/rice-mill-accounting-software/',
  ),
  _Software(
    name: 'Mantic Books',
    tagline: 'Inventory & accounting for all businesses',
    iconPath: 'assets/icons/mantic-books.png',
    color: Color(0xFF5C6BC0),
    url: 'https://softronix.pk/products/mantic-erp/',
  ),
];

// ── View ──────────────────────────────────────────────────────────────────────

class MoreSoftwareView extends StatelessWidget {
  const MoreSoftwareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: CustomScrollView(
        slivers: [
          const _Header(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, i) => _SoftwareCard(software: _softwares[i], index: i),
                childCount: _softwares.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: _VisitBanner(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 160,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.secondary,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'More Software',
        style: context.titleMedium.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Powered by Softronix',
                    style: context.headlineSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                  heightBox(4),
                  Text(
                    'Explore our complete suite of business tools',
                    style: context.bodySmall.copyWith(
                      color: Colors.white.withAlpha(200),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Software Card ─────────────────────────────────────────────────────────────

class _SoftwareCard extends StatefulWidget {
  final _Software software;
  final int index;
  const _SoftwareCard({required this.software, required this.index});

  @override
  State<_SoftwareCard> createState() => _SoftwareCardState();
}

class _SoftwareCardState extends State<_SoftwareCard> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    final delay = (widget.index * 80).clamp(0, 600);
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scale = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack);
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.18),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _launch() async {
    final uri = Uri.parse(widget.software.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) AppToastsUtils.showErrorTop(context, 'Could not open link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.software;
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: ScaleTransition(
          scale: _scale,
          child: GestureDetector(
            onTap: _launch,
            child: Container(
              decoration: BoxDecoration(
                color: context.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: context.border.withAlpha(160)),
                boxShadow: [
                  BoxShadow(
                    color: s.color.withAlpha(18),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: s.color.withAlpha(18),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      s.iconPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  heightBox(12),
                  Text(
                    s.name,
                    style: context.titleSmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.textPrimary,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  heightBox(4),
                  Text(
                    s.tagline,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      height: 1.35,
                      fontSize: 10,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: s.color.withAlpha(22),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 15,
                        color: s.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Visit Banner ──────────────────────────────────────────────────────────────

class _VisitBanner extends StatefulWidget {
  @override
  State<_VisitBanner> createState() => _VisitBannerState();
}

class _VisitBannerState extends State<_VisitBanner> {
  Future<void> _launch() async {
    final uri = Uri.parse('https://softronix.pk/products/');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) AppToastsUtils.showErrorTop(context, 'Could not open link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launch,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(60),
              blurRadius: 16,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.open_in_browser_rounded, color: Colors.white, size: 24),
            ),
            widthBox(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visit Softronix',
                    style: context.titleSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  heightBox(2),
                  Text(
                    'See all products at softronix.pk',
                    style: context.labelSmall.copyWith(
                      color: Colors.white.withAlpha(200),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
