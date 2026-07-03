import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../blocs/credit_management_details_cubit.dart';

class RevenueRecoverySection extends StatelessWidget {
  const RevenueRecoverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditManagementDetailsCubit,
        CreditManagementDetailsState>(
      buildWhen: (p, c) =>
          p.revenueStatus != c.revenueStatus ||
          p.revenueData != c.revenueData,
      builder: (_, state) {
        if (state.revenueStatus == ApiStatus.LOADING) {
          return const _RevenueRecoveryShimmer();
        }

        final data = state.revenueData;
        final bars = (data?.summaries ?? [])
            .asMap()
            .entries
            .map((e) => (
                  x: e.key,
                  label: e.value.monthName.length > 3
                      ? e.value.monthName.substring(0, 3)
                      : e.value.monthName,
                  sale: e.value.totalRevenueAmount,
                ))
            .toList();

        return _RevenueRecoveryContent(
          bars: bars,
          totalSale: data?.totalRevenueAmount ?? 0,
          avgRecovery: data?.averageRecoveryAmount ?? 0,
          averageSale: data?.averageRevenueAmount ?? 0,
          errorMessage: state.revenueStatus == ApiStatus.FAILURE
              ? (state.revenueMessage ?? 'Failed to load data.')
              : null,
        );
      },
    );
  }
}

class _RevenueRecoveryContent extends StatelessWidget {
  final List<({int x, String label, double sale})> bars;
  final double totalSale;
  final double avgRecovery;
  final double averageSale;
  final String? errorMessage;

  const _RevenueRecoveryContent({
    required this.bars,
    required this.totalSale,
    required this.avgRecovery,
    required this.averageSale,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('Total Sale', totalSale.asPrice, AppColors.primary),
      ('Avg Recovery', avgRecovery.asPrice, AppColors.greenDark),
      ('Average Sale', averageSale.asPrice, AppColors.orange),
    ];

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: .all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Revenue and Recovery',
            style: context.bodySmall.copyWith(
              fontWeight: .w700,
              fontSize: 13,
              color: context.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (int i = 0; i < stats.length; i++) ...[
                Expanded(
                  child: _StatCard(
                    label: stats[i].$1,
                    value: stats[i].$2,
                    accentColor: stats[i].$3,
                  ),
                ),
                if (i < stats.length - 1) const SizedBox(width: 8),
              ],
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: bars.isEmpty
                ? Center(
                    child: Text(
                      errorMessage ?? 'No data available',
                      style: context.bodySmall
                          .copyWith(color: context.textSecondary),
                    ),
                  )
                : _RevenueBarChart(bars: bars),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color accentColor;
  const _StatCard({
    required this.label,
    required this.value,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: .all(color: AppColors.grey200),
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
            Container(width: 4, color: accentColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      value,
                      style: context.bodyMedium.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 11,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 9,
                        height: 1.1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
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

class _RevenueRecoveryShimmer extends StatelessWidget {
  const _RevenueRecoveryShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const ShimmerBox(height: 14, width: 140, radius: 4),
          const SizedBox(height: 10),
          Row(
            children: [
              for (int i = 0; i < 3; i++) ...[
                const Expanded(child: ShimmerBox(height: 48, radius: 8)),
                if (i < 2) const SizedBox(width: 8),
              ],
            ],
          ),
          const SizedBox(height: 12),
          const ShimmerBox(height: 180, width: double.infinity, radius: 6),
        ],
      ),
    );
  }
}

class _RevenueBarChart extends StatelessWidget {
  final List<({int x, String label, double sale})> bars;
  const _RevenueBarChart({required this.bars});

  @override
  Widget build(BuildContext context) {
    final barColor = context.primary;
    final maxSale =
        bars.map((b) => b.sale).fold(0.0, (a, b) => a > b ? a : b);
    final maxY = maxSale == 0 ? 1000.0 : (maxSale * 1.25).ceilToDouble();
    final yInterval = (maxY / 5).ceilToDouble();

    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => barColor.withValues(alpha: 0.9),
            tooltipRoundedRadius: 6,
            getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
              'Rs ${rod.toY.toStringAsFixed(0)}',
              context.labelSmall.copyWith(
                color: context.white,
                fontSize: 10,
                fontWeight: .w600,
              ),
            ),
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              interval: yInterval,
              getTitlesWidget: (value, _) => Text(
                'Rs. ${value.toInt()}',
                style: context.labelSmall.copyWith(
                  fontSize: 8,
                  color: context.textSecondary,
                ),
                textAlign: .end,
              ),
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 24,
              getTitlesWidget: (value, _) {
                final i = value.toInt();
                if (i < 0 || i >= bars.length) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bars[i].label,
                    style: context.labelSmall.copyWith(
                      fontSize: 9,
                      color: context.textSecondary,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: yInterval,
          getDrawingHorizontalLine: (_) => FlLine(
            color: AppColors.grey100,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: bars
            .map(
              (b) => BarChartGroupData(
                x: b.x,
                barRods: [
                  BarChartRodData(
                    toY: b.sale,
                    color: barColor,
                    width: 14,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
