import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../dashboard/blocs/dashboard_bloc.dart';
import 'section_header.dart';

class TodayOverviewSection extends StatelessWidget {
  const TodayOverviewSection({super.key});

  static const _meta = <_CardMeta>[
    _CardMeta(label: AppConstants.recoveryDueTodayLabel, icon: Icons.monetization_on_outlined,  color: Color(0xFFFF9800)),
    _CardMeta(label: AppConstants.receivedTodayLabel,    icon: Icons.attach_money_rounded,       color: Color(0xFF4CAF50)),
    _CardMeta(label: AppConstants.expensesTodayLabel,    icon: Icons.credit_card_outlined,       color: Color(0xFFE53935)),
    _CardMeta(label: AppConstants.purchasesTodayLabel,   icon: Icons.shopping_bag_outlined,      color: Color(0xFF9C27B0)),
    _CardMeta(label: AppConstants.paymentsToMakeLabel,   icon: Icons.payment_outlined,           color: Color(0xFFFF9800)),
    _CardMeta(label: AppConstants.paymentsMadeLabel,     icon: Icons.task_alt_outlined,          color: Color(0xFF00ACC1)),
    _CardMeta(label: AppConstants.salesTodayLabel,       icon: Icons.shopping_cart_outlined,     color: Color(0xFF1B84FF)),
    _CardMeta(label: AppConstants.newOrdersLabel,        icon: Icons.inventory_2_outlined,       color: Color(0xFF7B61FF)),
  ];

  String _formatDate(DateTime d) =>
      '${d.shortMonthName} ${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate(BuildContext context, DateTime current) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && context.mounted) {
      context.read<DashboardBloc>().add(DailyStatsDateChanged(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (p, c) =>
          p.todayOverviewExpanded != c.todayOverviewExpanded ||
          p.dailyStatsStatus      != c.dailyStatsStatus      ||
          p.dailyStats            != c.dailyStats             ||
          p.selectedDailyDate     != c.selectedDailyDate,
      builder: (context, state) {
        final isLoading = state.dailyStatsStatus == ApiStatus.INITIAL ||
                          state.dailyStatsStatus == ApiStatus.LOADING;

        final itemCount = context.isPhone
            ? (state.todayOverviewExpanded ? _meta.length : 4)
            : _meta.length;

        return Column(
          crossAxisAlignment: .start,
          children: [
            SectionHeader(
              title: AppConstants.todaySOverview,
              trailing: Row(
                mainAxisSize: .min,
                children: [
                  GestureDetector(
                    onTap: () => _pickDate(context, state.selectedDailyDate),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(Icons.calendar_today_outlined, color: context.primary, size: 13),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(state.selectedDailyDate),
                          style: context.labelMedium.copyWith(
                            color: context.primary, fontWeight: .w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (context.isPhone) ...[
                    const SizedBox(width: 10),
                    GestureDetector(
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
                              color: context.primary, fontWeight: .w600,
                            ),
                          ),
                          AnimatedRotation(
                            turns:    state.todayOverviewExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 380),
                            curve:    Curves.easeInOutCubic,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: context.primary, size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSize(
              duration:  const Duration(milliseconds: 420),
              curve:     Curves.easeInOutCubic,
              alignment: .topCenter,
              child: GridView.builder(
                shrinkWrap: true,
                padding:    EdgeInsets.zero,
                physics:    const NeverScrollableScrollPhysics(),
                itemCount:  itemCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:   context.gridColumnCount,
                  mainAxisSpacing:  context.gridSpacing,
                  crossAxisSpacing: context.gridSpacing,
                  childAspectRatio: context.overviewCardRatio,
                ),
                itemBuilder: (context, i) {
                  if (isLoading) {
                    return ShimmerBox(radius: 10, height: double.infinity);
                  }
                  final sym   = currentUser.org.currencySymbol;
                  final stats = state.dailyStats;
                  final value = switch (i) {
                    0 => stats?.ttlRecovery   ?? 0,
                    1 => stats?.ttlReceived   ?? 0,
                    2 => stats?.ttlExpense    ?? 0,
                    3 => stats?.ttlPurchase   ?? 0,
                    4 => stats?.ttlDuePayment ?? 0,
                    5 => stats?.ttlPaid       ?? 0,
                    6 => stats?.ttlSale       ?? 0,
                    _ => stats?.ttlSaleOrder  ?? 0,
                  };
                  return OverviewStatCard(
                    label: _meta[i].label,
                    value: value.formatPrice(symbol: sym),
                    icon:  _meta[i].icon,
                    color: _meta[i].color,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CardMeta {
  final String   label;
  final IconData icon;
  final Color    color;
  const _CardMeta({required this.label, required this.icon, required this.color});
}
