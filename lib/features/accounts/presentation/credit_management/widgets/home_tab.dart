import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
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
            _CurrentBalanceCard(balance: widget.balance)
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.15, curve: Curves.easeOutCubic),
            const SizedBox(height: 8),
            DayStatsGrid(
              firstSegment: widget.firstSegmentAmount.asPrice,
              secondSegment: widget.secondSegmentAmount.asPrice,
              thirdSegment: widget.thirdSegmentAmount.asPrice,
              fourthSegment: widget.fourthSegmentAmount.asPrice,
            )
                .animate()
                .fadeIn(delay: 100.ms, duration: 400.ms)
                .slideY(begin: 0.15, curve: Curves.easeOutCubic),
            const SizedBox(height: 8),
            const UnpaidInvoicesSection()
                .animate()
                .fadeIn(delay: 200.ms, duration: 400.ms)
                .slideY(begin: 0.12, curve: Curves.easeOutCubic),
            const SizedBox(height: 12),
            const CreditTrendChart()
                .animate()
                .fadeIn(delay: 300.ms, duration: 450.ms)
                .slideY(begin: 0.12, curve: Curves.easeOutCubic),
            const SizedBox(height: 12),
            const RecentPaymentsSection()
                .animate()
                .fadeIn(delay: 400.ms, duration: 450.ms)
                .slideY(begin: 0.10, curve: Curves.easeOutCubic),
            const SizedBox(height: 12),
            const RevenueRecoverySection()
                .animate()
                .fadeIn(delay: 500.ms, duration: 450.ms)
                .slideY(begin: 0.10, curve: Curves.easeOutCubic),
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
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: GlassSurface(
        radius: 10,
        clipBehavior: .hardEdge,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            Container(width: 4, color: AppColors.primary),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      balance,
                      style: context.titleMedium.copyWith(
                        fontWeight: .w800,
                        color: context.textPrimary,
                        fontSize: 22,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'CURRENT BALANCE',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontWeight: .w700,
                        fontSize: 10,
                        letterSpacing: 0.8,
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
