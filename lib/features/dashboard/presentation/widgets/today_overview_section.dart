import 'package:flutter/material.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import 'section_header.dart';

class TodayOverviewSection extends StatefulWidget {
  const TodayOverviewSection({super.key});

  @override
  State<TodayOverviewSection> createState() => _TodayOverviewSectionState();
}

class _TodayOverviewSectionState extends State<TodayOverviewSection> {
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
        SectionHeader(
          title: AppConstants.todaySOverview,
          trailing: context.isPhone
              ? GestureDetector(
                  onTap: _toggle,
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Text(
                        _expanded ? AppConstants.showLess : AppConstants.showMore,
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
                )
              : null,
        ),
        const SizedBox(height: 10),
        AnimatedSize(
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeInOutCubic,
          alignment: .topCenter,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
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
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
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
