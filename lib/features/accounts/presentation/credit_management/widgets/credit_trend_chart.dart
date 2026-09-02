import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/credit_managment/party_credit_monthly_summary_entity.dart';
import '../blocs/credit_management_details_cubit.dart';

class CreditTrendChart extends StatelessWidget {
  const CreditTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              'Total Credits',
              style: context.bodySmall.copyWith(
                fontWeight: .w700,
                fontSize: 13,
                color: context.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 160,
            child: BlocBuilder<CreditManagementDetailsCubit,
                CreditManagementDetailsState>(
              buildWhen: (p, c) =>
                  p.summaryStatus != c.summaryStatus ||
                  p.summaryItems != c.summaryItems,
              builder: (_, state) => _ChartBody(
                status: state.summaryStatus,
                items: state.summaryItems,
                message: state.summaryMessage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBody extends StatelessWidget {
  final ApiStatus status;
  final List<PartyCreditMonthlySummaryEntity> items;
  final String? message;

  const _ChartBody({
    required this.status,
    required this.items,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (status == ApiStatus.LOADING) {
      return const ShimmerBox(width: double.infinity, height: 160, radius: 6);
    }

    if (status == ApiStatus.FAILURE || items.isEmpty) {
      return Center(
        child: Text(
          items.isEmpty && status == ApiStatus.SUCCESS
              ? 'No data available'
              : message ?? 'No data',
          style: context.bodySmall.copyWith(color: context.textSecondary),
        ),
      );
    }

    final maxY = items
        .map((e) => e.totalAmount)
        .fold(0.0, (a, b) => a > b ? a : b);
    final chartMaxY = maxY == 0 ? 1000.0 : (maxY * 1.25).ceilToDouble();
    final yInterval = (chartMaxY / 4).ceilToDouble();
    final lineColor = context.primary;

    final spots = items
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.totalAmount))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (items.length - 1).toDouble(),
          minY: 0,
          maxY: chartMaxY,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => lineColor.withValues(alpha: 0.92),
              tooltipRoundedRadius: 6,
              getTooltipItems: (spots) => spots
                  .map(
                    (s) => LineTooltipItem(
                      'Rs ${s.y.toStringAsFixed(0)}',
                      context.labelSmall.copyWith(
                        color: context.white,
                        fontSize: 10,
                        fontWeight: .w600,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                interval: yInterval,
                getTitlesWidget: (value, _) {
                  final label = value >= 1000
                      ? '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}K'
                      : value.toInt().toString();
                  return Text(
                    label,
                    style: context.labelSmall.copyWith(
                      fontSize: 9,
                      color: context.textSecondary,
                    ),
                    textAlign: .start,
                  );
                },
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
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (value, _) {
                  final i = value.toInt();
                  if (value != i.toDouble() || i < 0 || i >= items.length) {
                    return const SizedBox.shrink();
                  }
                  final item = items[i];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        Text(
                          item.year.toString().substring(2),
                          style: context.labelSmall.copyWith(
                            fontSize: 9,
                            color: context.textSecondary,
                          ),
                        ),
                        Text(
                          item.monthName.length > 3
                              ? item.monthName.substring(0, 3)
                              : item.monthName,
                          style: context.labelSmall.copyWith(
                            fontSize: 9,
                            color: context.textSecondary,
                            fontWeight: .w600,
                          ),
                        ),
                      ],
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
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.35,
              preventCurveOverShooting: true,
              color: lineColor,
              barWidth: 2.5,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                  radius: 3,
                  color: lineColor,
                  strokeWidth: 1.5,
                  strokeColor: context.white,
                ),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    lineColor.withValues(alpha: 0.22),
                    lineColor.withValues(alpha: 0.0),
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
