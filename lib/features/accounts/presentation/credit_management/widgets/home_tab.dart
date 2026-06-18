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
  const HomeTab({super.key});

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
