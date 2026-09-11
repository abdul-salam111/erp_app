import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/daily_stats_entity.dart';
import '../admin_dashboard/bloc/admin_dashboard_bloc.dart';
import 'section_header.dart';

const _meta = <_CardMeta>[
  _CardMeta(label: AppConstants.recoveryDueTodayLabel, icon: Icons.monetization_on_outlined,  color: AppColors.orange),
  _CardMeta(label: AppConstants.receivedTodayLabel,    icon: Icons.attach_money_rounded,       color: AppColors.green),
  _CardMeta(label: AppConstants.expensesTodayLabel,    icon: Icons.credit_card_outlined,       color: AppColors.errorBright),
  _CardMeta(label: AppConstants.purchasesTodayLabel,   icon: Icons.shopping_bag_outlined,      color: AppColors.purple),
  _CardMeta(label: AppConstants.paymentsToMakeLabel,   icon: Icons.payment_outlined,           color: AppColors.orange),
  _CardMeta(label: AppConstants.paymentsMadeLabel,     icon: Icons.task_alt_outlined,          color: AppColors.cyan),
  _CardMeta(label: AppConstants.salesTodayLabel,       icon: Icons.shopping_cart_outlined,     color: AppColors.primary),
  _CardMeta(label: AppConstants.newOrdersLabel,        icon: Icons.inventory_2_outlined,       color: AppColors.violet),
];

List<double> _valuesFor(DailyStatsEntity? stats) => [
  stats?.ttlRecovery   ?? 0,
  stats?.ttlReceived   ?? 0,
  stats?.ttlExpense    ?? 0,
  stats?.ttlPurchase   ?? 0,
  stats?.ttlDuePayment ?? 0,
  stats?.ttlPaid       ?? 0,
  stats?.ttlSale       ?? 0,
  stats?.ttlSaleOrder  ?? 0,
];

class TodayOverviewSection extends StatelessWidget {
  const TodayOverviewSection({super.key});

  String _formatDate(DateTime d) =>
      '${d.shortMonthName} ${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate(BuildContext context, DateTime current) async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && context.mounted) {
      context.read<AdminDashboardBloc>().add(DailyStatsDateChanged(picked));
    }
  }

  void _showAllOverview(
    BuildContext context, {
    required String dateLabel,
    required String currencySymbol,
    required List<double> values,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => _AllOverviewSheet(
        dateLabel: dateLabel,
        currencySymbol: currencySymbol,
        values: values,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      buildWhen: (p, c) =>
          p.dailyStatsStatus  != c.dailyStatsStatus ||
          p.dailyStats        != c.dailyStats        ||
          p.selectedDailyDate != c.selectedDailyDate,
      builder: (context, state) {
        final isLoading = state.dailyStatsStatus == ApiStatus.INITIAL ||
                          state.dailyStatsStatus == ApiStatus.LOADING;

        final sym       = currentUser.org.currencySymbol;
        final values    = _valuesFor(state.dailyStats);
        final itemCount = context.isPhone ? 4 : _meta.length;

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
                    TextButton(
                      onPressed: () => _showAllOverview(
                        context,
                        dateLabel: _formatDate(state.selectedDailyDate),
                        currencySymbol: sym,
                        values: values,
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Text(
                            AppConstants.showMore,
                            style: context.labelMedium.copyWith(
                              color: context.primary, fontWeight: .w600,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: context.primary, size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
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
                return OverviewStatCard(
                  label: _meta[i].label,
                  value: values[i].formatPrice(symbol: sym),
                  icon:  _meta[i].icon,
                  color: _meta[i].color,
                );
              },
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

// ─── "Show more" bottom sheet — all overview cards ─────────────────────────────

class _AllOverviewSheet extends StatelessWidget {
  final String dateLabel;
  final String currencySymbol;
  final List<double> values;

  const _AllOverviewSheet({
    required this.dateLabel,
    required this.currencySymbol,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const .vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(
        20, 12, 20, MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.border,
                borderRadius: .circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: .all(9),
                decoration: BoxDecoration(
                  color: context.primary.withValues(alpha: 0.10),
                  borderRadius: .circular(10),
                ),
                child: Icon(Icons.grid_view_rounded, color: context.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      AppConstants.todaySOverview,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dateLabel,
                      style: context.labelSmall.copyWith(color: context.textSecondary),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: .all(6),
                  decoration: BoxDecoration(
                    color: context.grey100,
                    shape: .circle,
                  ),
                  child: Icon(Icons.close_rounded, size: 16, color: context.textSecondary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _meta.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:   context.gridColumnCount,
              mainAxisSpacing:  context.gridSpacing,
              crossAxisSpacing: context.gridSpacing,
              childAspectRatio: context.overviewCardRatio,
            ),
            itemBuilder: (context, i) {
              return OverviewStatCard(
                label: _meta[i].label,
                value: values[i].formatPrice(symbol: currencySymbol),
                icon:  _meta[i].icon,
                color: _meta[i].color,
              )
                  .animate()
                  .slideY(
                    begin: 0.2,
                    end: 0,
                    delay: (i * 40).ms,
                    duration: 320.ms,
                    curve: Curves.easeOutCubic,
                  )
                  .fadeIn(delay: (i * 40).ms, duration: 260.ms);
            },
          ),
        ],
      ),
    );
  }
}
