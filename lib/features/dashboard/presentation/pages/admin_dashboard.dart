import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/widgets/widgets.dart';


class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppConstants.adminDashboardTitle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: .circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ).onTap(() {
                  context.pushNamed(RouteNames.profile);
                }),
                const SizedBox(height: 2),
                const Text(
                  AppConstants.admin,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: context.pagePadding,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _TodayOverviewSection(),
            const SizedBox(height: 20),
            const _NewOrdersSection(),
          ],
        ),
      ),
    );
  }
}

// ─── Today's Overview Section ────────────────────────────────────────────────

class _TodayOverviewSection extends StatefulWidget {
  const _TodayOverviewSection();

  @override
  State<_TodayOverviewSection> createState() => _TodayOverviewSectionState();
}

class _TodayOverviewSectionState extends State<_TodayOverviewSection> {
  bool _expanded = false;

  static const _items = <_OverviewItem>[
    _OverviewItem(
      label: AppConstants.recoveryDueTodayLabel,
      icon: Icons.monetization_on_outlined,
      color: Color(0xFFFF9800),
    ),
    _OverviewItem(
      label: AppConstants.receivedTodayLabel,
      icon: Icons.attach_money_rounded,
      color: Color(0xFF4CAF50),
    ),
    _OverviewItem(
      label: AppConstants.expensesTodayLabel,
      icon: Icons.credit_card_outlined,
      color: Color(0xFFE53935),
    ),
    _OverviewItem(
      label: AppConstants.purchasesTodayLabel,
      icon: Icons.shopping_bag_outlined,
      color: Color(0xFF9C27B0),
    ),
    _OverviewItem(
      label: AppConstants.paymentsToMakeLabel,
      icon: Icons.payment_outlined,
      color: Color(0xFFFF9800),
    ),
    _OverviewItem(
      label: AppConstants.paymentsMadeLabel,
      icon: Icons.task_alt_outlined,
      color: Color(0xFF00ACC1),
    ),
    _OverviewItem(
      label: AppConstants.salesTodayLabel,
      icon: Icons.shopping_cart_outlined,
      color: Color(0xFF1B84FF),
    ),
    _OverviewItem(
      label: AppConstants.newOrdersLabel,
      icon: Icons.inventory_2_outlined,
      color: Color(0xFF7B61FF),
    ),
  ];

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // Header — toggle lives here on phones, saving a full button row below
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 10),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                AppConstants.todaySOverview,
                style: context.titleSmall.copyWith(
                  fontWeight: .w700,
                  color: context.textPrimary,
                  letterSpacing: 0.2,
                ),
              ),
              if (context.isPhone)
                GestureDetector(
                  onTap: _toggle,
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Text(
                        _expanded
                            ? AppConstants.showLess
                            : AppConstants.showMore,
                        style: context.labelMedium.copyWith(
                          color: context.primary,
                          fontWeight: .w600,
                        ),
                      ),
                      AnimatedRotation(
                        turns: _expanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 380),
                        curve: Curves.easeInOutCubic,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: context.primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // Tablet/iPad shows all; phone collapses to 4 cards.
        AnimatedSize(
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeInOutCubic,
          alignment: .topCenter,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.isPhone
                ? (_expanded ? _items.length : 4)
                : _items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.gridColumnCount,
              mainAxisSpacing: context.gridSpacing,
              crossAxisSpacing: context.gridSpacing,
              childAspectRatio: context.overviewCardRatio,
            ),
            itemBuilder: (context, index) => _OverviewCard(item: _items[index]),
          ),
        ),
      ],
    );
  }
}

// ─── Overview Card ────────────────────────────────────────────────────────────

class _OverviewCard extends StatelessWidget {
  final _OverviewItem item;

  const _OverviewCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: .all(color: const Color(0xFFEDEDED)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: .stretch,
        children: [
          Container(width: 4, color: item.color),
          Expanded(
            child: Padding(
              padding: .symmetric(horizontal: 10, vertical: 9),
              child: Row(
                crossAxisAlignment: .center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: .circular(8),
                      color: item.color.withValues(alpha: 0.10),
                    ),
                    child: Icon(item.icon, color: item.color, size: 16),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          AppConstants.rs0,
                          style: context.bodyMedium.copyWith(
                            fontWeight: .w700,
                            color: context.textPrimary,
                            fontSize: 13,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item.label,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── New Orders Section ───────────────────────────────────────────────────────

class _NewOrdersSection extends StatelessWidget {
  const _NewOrdersSection();

  static const _orders = <_OrderItem>[
    _OrderItem(
      customer: AppConstants.abbasLabourContractor,
      items: [],
      amount: 101487.12,
    ),
    _OrderItem(
      customer: AppConstants.abdullahENGOkara,
      items: [AppConstants.cornFlour],
      amount: 5000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // Header row
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              AppConstants.newOrders,
              style: context.titleSmall.copyWith(
                fontWeight: .w700,
                color: context.textPrimary,
                letterSpacing: 0.2,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: .symmetric(horizontal: 10, vertical: 4),
                minimumSize: .zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                AppConstants.viewAll,
                style: context.labelMedium.copyWith(
                  color: context.primary,
                  fontWeight: .w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Order list
        Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(12),
            border: Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _orders.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, thickness: 1, color: context.border),
            itemBuilder: (context, index) => _OrderTile(order: _orders[index]),
          ),
        ),
      ],
    );
  }
}

// ─── Order Tile ───────────────────────────────────────────────────────────────

class _OrderTile extends StatelessWidget {
  final _OrderItem order;

  const _OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    final initials = order.customer
        .trim()
        .split(' ')
        .take(2)
        .map((w) => w[0].toUpperCase())
        .join();

    // Show item name only when exactly one item in the order
    final subtitle = order.items.length == 1 ? order.items.first : null;

    return Padding(
      padding: .symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.10),
              borderRadius: .circular(10),
            ),
            alignment: .center,
            child: Text(
              initials,
              style: context.labelMedium.copyWith(
                color: context.primary,
                fontWeight: .w700,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name + item (only if exactly one)
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  order.customer,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Amount
          Text(
            'Rs ${order.amount.asPrice}',
            style: context.bodySmall.copyWith(
              fontWeight: .w700,
              color: context.textPrimary,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Data models ──────────────────────────────────────────────────────────────

class _OrderItem {
  final String customer;
  final List<String> items;
  final double amount;

  const _OrderItem({
    required this.customer,
    required this.items,
    required this.amount,
  });
}

// ─── Data model ───────────────────────────────────────────────────────────────

class _OverviewItem {
  final String label;
  final IconData icon;
  final Color color;

  const _OverviewItem({
    required this.label,
    required this.icon,
    required this.color,
  });
}
