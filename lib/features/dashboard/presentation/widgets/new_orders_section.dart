import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/order_entity.dart';
import '../dashboard/blocs/dashboard_bloc.dart';
import 'section_header.dart';

class NewOrdersSection extends StatelessWidget {
  const NewOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (p, c) =>
          p.dailyStatsStatus != c.dailyStatsStatus ||
          p.dailyStats       != c.dailyStats,
      builder: (context, state) {
        final isLoading = state.dailyStatsStatus == ApiStatus.INITIAL ||
                          state.dailyStatsStatus == ApiStatus.LOADING;
        final orders = state.dailyStats?.orders ?? [];

        return Column(
          crossAxisAlignment: .start,
          children: [
            SectionHeader(
              title: AppConstants.newOrders,
              trailing: TextButton(
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

// ── Shimmer skeleton ─────────────────────────────────────────────────────────

class _NewOrdersShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                          ShimmerBox(height: 12, width: double.infinity, radius: 6),
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
              if (i < 2) Divider(height: 1, thickness: 1, color: context.border),
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
    return Container(
      width: double.infinity,
      padding: .symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(12),
        border: Border.all(color: context.border),
      ),
      child: Text(
        'No orders today',
        textAlign: .center,
        style: context.bodySmall.copyWith(color: context.textSecondary),
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
    return Container(
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
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orders.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, thickness: 1, color: context.border),
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
        .take(2)
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
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
