import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../routes/route_exports.dart';
import 'section_header.dart';

class QuickActionsSection extends StatefulWidget {
  const QuickActionsSection({super.key});

  @override
  State<QuickActionsSection> createState() => _QuickActionsSectionState();
}

class _QuickActionsSectionState extends State<QuickActionsSection> {
  static const _items = <_MenuItem>[
    _MenuItem(label: 'Alerts',     icon: Iconsax.notification, color: Color(0xFFE53935), routeName: RouteNames.alert_panel),
    _MenuItem(label: 'Accounts',   icon: Iconsax.dollar_circle,      color: Color(0xFF1B84FF), routeName: null),
    _MenuItem(label: 'Inventory',  icon: Iconsax.element_3,           color: Color(0xFF009688), routeName: null),
    _MenuItem(label: 'Purchase',   icon: Iconsax.shopping_bag,        color: Color(0xFF9C27B0), routeName: null),
    _MenuItem(label: 'Sales',      icon: Iconsax.truck,               color: Color(0xFF4CAF50), routeName: null),
    _MenuItem(label: 'Production', icon: Iconsax.buildings_2,         color: Color(0xFFFF9800), routeName: null),
    _MenuItem(label: 'Analytics',  icon: Iconsax.chart_2,             color: Color(0xFF7B1FA2), routeName: null),
    _MenuItem(label: 'Security',   icon: Iconsax.security_user,       color: Color(0xFF546E7A), routeName: null),
    _MenuItem(label: 'System',     icon: Iconsax.setting_2,           color: Color(0xFF6D4C41), routeName: null),
    _MenuItem(label: 'Assets',     icon: Iconsax.convert_3d_cube,     color: Color(0xFF00897B), routeName: null),
  ];

  static const _itemsPerPage = 6;

  final _pageController = PageController();
  int _currentPage = 0;

  int get _pageCount => (_items.length / _itemsPerPage).ceil();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 90,
      tablet: 110,
      ipad: 120,
    );
    final spacing = context.gridSpacing;
    final pageHeight = 2 * cardHeight + spacing;

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: 'Quick Actions'),
        const SizedBox(height: 10),
        SizedBox(
          height: pageHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _pageCount,
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemBuilder: (context, pageIndex) {
              final start = pageIndex * _itemsPerPage;
              final end = (start + _itemsPerPage).clamp(0, _items.length);
              final pageItems = _items.sublist(start, end);
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pageItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: cardHeight,
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                ),
                itemBuilder: (context, index) =>
                    _QuickActionCard(item: pageItems[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: .center,
          children: List.generate(
            _pageCount,
            (i) => _PageDot(active: i == _currentPage),
          ),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final _MenuItem item;

  const _QuickActionCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.routeName != null
          ? () => context.pushNamed(item.routeName!)
          : null,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: .circle,
                boxShadow: [
                  BoxShadow(
                    color: item.color.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(item.icon, color: item.color, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              item.label,
              style: context.labelSmall.copyWith(
                color: item.color,
                fontWeight: .w600,
                fontSize: 11,
              ),
              textAlign: .center,
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _PageDot extends StatelessWidget {
  final bool active;

  const _PageDot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: active ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? context.primary : context.grey300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class _MenuItem {
  final String label;
  final IconData icon;
  final Color color;
  final String? routeName;

  const _MenuItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.routeName,
  });
}
