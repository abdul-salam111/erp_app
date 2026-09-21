import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/order_entity.dart';
import '../admin_dashboard/bloc/admin_dashboard_bloc.dart';
import 'section_header.dart';

class NewOrdersSection extends StatelessWidget {
  const NewOrdersSection({super.key});

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      buildWhen: (p, c) =>
          p.dailyStatsStatus != c.dailyStatsStatus ||
          p.dailyStats != c.dailyStats ||
          p.selectedDailyDate != c.selectedDailyDate,
      builder: (context, state) {
        final isLoading =
            state.dailyStatsStatus == ApiStatus.INITIAL ||
            state.dailyStatsStatus == ApiStatus.LOADING;
        final orders = state.dailyStats?.orders ?? [];

        return Column(
          crossAxisAlignment: .start,
          children: [
            SectionHeader(
              title: AppConstants.newOrders,
              trailing: _DatePill(
                label: _formatDate(state.selectedDailyDate),
                onTap: () => _pickDate(context, state.selectedDailyDate),
              ),
            ),
            const SizedBox(height: 10),
            if (isLoading)
              _NewOrdersShimmer()
            else if (orders.isEmpty)
              _EmptyOrders()
            else
              _OrdersList(orders: orders),
          ],
        );
      },
    );
  }
}

// ── Date pill (glass in dark, tinted in light) ───────────────────────────────

class _DatePill extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DatePill({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final row = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 13,
            color: context.accentBlue,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: context.accentBlue,
              fontWeight: .w600,
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 14,
            color: context.accentBlue,
          ),
        ],
      ),
    );

    if (context.isDark) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: GlassContainer(
          shape: const LiquidRoundedSuperellipse(borderRadius: 20),
          child: row,
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.accentBlue.withValues(alpha: 0.07),
          borderRadius: .circular(20),
          border: Border.all(color: context.accentBlue.withValues(alpha: 0.25)),
        ),
        child: row,
      ),
    );
  }
}

// ── Shimmer skeleton ─────────────────────────────────────────────────────────

class _NewOrdersShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 12,
      child: Column(
        children: List.generate(3, (i) {
          return Column(
            children: [
              Padding(
                padding: .symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    ShimmerBox(width: 40, height: 40, radius: 10),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          ShimmerBox(
                            height: 12,
                            width: double.infinity,
                            radius: 6,
                          ),
                          const SizedBox(height: 6),
                          ShimmerBox(height: 10, width: 120, radius: 6),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ShimmerBox(width: 70, height: 12, radius: 6),
                  ],
                ),
              ),
              if (i < 2)
                Divider(height: 1, thickness: 1, color: context.navyBorder),
            ],
          );
        }),
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

class _EmptyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 12,
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset('assets/icons/empty.png', width: 72, height: 72),
            Text(
              AppConstants.noOrdersToday,
              textAlign: .center,
              style: context.bodySmall.copyWith(
                color: context.textSecondary,
                fontWeight: .w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Orders list ───────────────────────────────────────────────────────────────

class _OrdersList extends StatelessWidget {
  final List<NewOrdersEntity> orders;
  const _OrdersList({required this.orders});

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 12,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orders.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, thickness: 1, color: context.navyBorder),
        itemBuilder: (context, i) => _OrderTile(order: orders[i]),
      ),
    );
  }
}

// ── Single order tile ─────────────────────────────────────────────────────────

class _OrderTile extends StatelessWidget {
  final NewOrdersEntity order;
  const _OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    final initials = order.partyName
        .trim()
        .split(' ')
        .where((w) => w.isNotEmpty && RegExp(r'^[a-zA-Z]').hasMatch(w))
        .take(2)
        .map((w) => w[0].toUpperCase())
        .join();

    final sym = currentUser.org.currencySymbol;

    return Padding(
      padding: .symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.navyIconBg,
              borderRadius: .circular(10),
            ),
            alignment: .center,
            child: Text(
              initials,
              style: context.labelMedium.copyWith(
                color: context.navyIconColor,
                fontWeight: .w700,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  order.partyName,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                if (order.locationName.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    order.locationName,
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
          Text(
            order.ttlNetAmount.formatPrice(symbol: sym),
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
