import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../blocs/credit_management_details_cubit.dart';
import 'credit_trend_chart.dart';
import 'day_stats_grid.dart';
import 'unpaid_invoices_section.dart';
import 'recent_payments_section.dart';
import 'revenue_recovery_section.dart';

class HomeTab extends StatefulWidget {
  final String balance;
  final int? partyId;
  final double firstSegmentAmount;
  final double secondSegmentAmount;
  final double thirdSegmentAmount;
  final double fourthSegmentAmount;

  const HomeTab({
    super.key,
    required this.balance,
    this.partyId,
    this.firstSegmentAmount = 0,
    this.secondSegmentAmount = 0,
    this.thirdSegmentAmount = 0,
    this.fourthSegmentAmount = 0,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final CreditManagementDetailsCubit _detailsCubit;

  @override
  void initState() {
    super.initState();
    _detailsCubit = sl<CreditManagementDetailsCubit>();
    if (widget.partyId != null) {
      _detailsCubit.fetch(
        toDate: DateTime.now().format('yyyy-MM-dd'),
        partyId: widget.partyId!,
      );
    }
  }

  @override
  void dispose() {
    _detailsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _detailsCubit,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          8,
          context.pagePadding.right,
          24,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _CurrentBalanceCard(balance: widget.balance),
            const SizedBox(height: 8),
            DayStatsGrid(
              firstSegment: widget.firstSegmentAmount.asPrice,
              secondSegment: widget.secondSegmentAmount.asPrice,
              thirdSegment: widget.thirdSegmentAmount.asPrice,
              fourthSegment: widget.fourthSegmentAmount.asPrice,
            ),
            const SizedBox(height: 8),
            const UnpaidInvoicesSection(),
            const SizedBox(height: 12),
            const CreditTrendChart(),
            const SizedBox(height: 12),
            const RecentPaymentsSection(),
            const SizedBox(height: 12),
            const RevenueRecoverySection(),
          ],
        ),
      ),
    );
  }
}

class _CurrentBalanceCard extends StatelessWidget {
  final String balance;
  const _CurrentBalanceCard({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            Container(width: 4, color: AppColors.primary),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      balance,
                      style: context.titleMedium.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 16,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Current Balance',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
