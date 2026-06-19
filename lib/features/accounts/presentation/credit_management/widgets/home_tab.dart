import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import 'credit_trend_chart.dart';
import 'day_stats_grid.dart';
import 'unpaid_invoices_section.dart';
import 'recent_payments_section.dart';
import 'revenue_recovery_section.dart';

class HomeTab extends StatelessWidget {
  final String balance;
  const HomeTab({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        8,
        context.pagePadding.right,
        24,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _CurrentBalanceCard(balance: balance),
          const SizedBox(height: 8),
          DayStatsGrid(),
          SizedBox(height: 8),
          CreditTrendChart(),
          SizedBox(height: 12),
          UnpaidInvoicesSection(),
          CustomButton(
            radius: 8,
            onPressed: () {},
            backgroundColor: context.primary.withAlpha(60),
            icon: Icons.mail,
            text: 'Send Unpaid Invoice',
            size: Size(double.infinity, 40),
            fontsize: 12,
            textColor: context.primary,
            iconSize: 16,
            iconColor: context.primary,
          ),
          SizedBox(height: 12),
          RecentPaymentsSection(),
          SizedBox(height: 12),
          RevenueRecoverySection(),
        ],
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
