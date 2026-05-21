import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../dashboard/blocs/dashboard_bloc.dart';
import 'section_header.dart';

class TodayOverviewSection extends StatelessWidget {
  const TodayOverviewSection({super.key});

  static const _items = <OverviewItem>[
    OverviewItem(
      label: AppConstants.recoveryDueTodayLabel,
      icon: Icons.monetization_on_outlined,
      color: Color(0xFFFF9800),
    ),
    OverviewItem(
      label: AppConstants.receivedTodayLabel,
      icon: Icons.attach_money_rounded,
      color: Color(0xFF4CAF50),
    ),
    OverviewItem(
      label: AppConstants.expensesTodayLabel,
      icon: Icons.credit_card_outlined,
      color: Color(0xFFE53935),
    ),
    OverviewItem(
      label: AppConstants.purchasesTodayLabel,
      icon: Icons.shopping_bag_outlined,
      color: Color(0xFF9C27B0),
    ),
    OverviewItem(
      label: AppConstants.paymentsToMakeLabel,
      icon: Icons.payment_outlined,
      color: Color(0xFFFF9800),
    ),
    OverviewItem(
      label: AppConstants.paymentsMadeLabel,
      icon: Icons.task_alt_outlined,
      color: Color(0xFF00ACC1),
    ),
    OverviewItem(
      label: AppConstants.salesTodayLabel,
      icon: Icons.shopping_cart_outlined,
      color: Color(0xFF1B84FF),
    ),
    OverviewItem(
      label: AppConstants.newOrdersLabel,
      icon: Icons.inventory_2_outlined,
      color: Color(0xFF7B61FF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (prev, curr) =>
          prev.todayOverviewExpanded != curr.todayOverviewExpanded,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: .start,
          children: [
            SectionHeader(
              title: AppConstants.todaySOverview,
              trailing: context.isPhone
                  ? GestureDetector(
                      onTap: () => context.read<DashboardBloc>().add(
                        const TodayOverviewExpansionToggled(),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Text(
                            state.todayOverviewExpanded
                                ? AppConstants.showLess
                                : AppConstants.showMore,
                            style: context.labelMedium.copyWith(
                              color: context.primary,
                              fontWeight: .w600,
                            ),
                          ),
                          AnimatedRotation(
                            turns: state.todayOverviewExpanded ? 0.5 : 0,
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
                    ? (state.todayOverviewExpanded ? _items.length : 4)
                    : _items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.gridColumnCount,
                  mainAxisSpacing: context.gridSpacing,
                  crossAxisSpacing: context.gridSpacing,
                  childAspectRatio: context.overviewCardRatio,
                ),
                itemBuilder: (context, index) => OverviewStatCard(
                  label: _items[index].label,
                  value: AppConstants.rs0,
                  icon: _items[index].icon,
                  color: _items[index].color,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
