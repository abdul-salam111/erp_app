import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class RevenueRecoverySection extends StatelessWidget {
  const RevenueRecoverySection({super.key});

  static const _bars = [
    (x: 0, label: 'Oct', sale: 0.0),
    (x: 1, label: 'Nov', sale: 0.0),
    (x: 2, label: 'Dec', sale: 0.0),
    (x: 3, label: 'Jan', sale: 0.0),
    (x: 4, label: 'Feb', sale: 0.0),
    (x: 5, label: 'Mar', sale: 1000.0),
  ];

  static const _stats = [
    ('Total Sale', 'Rs 1,000', AppColors.primary),
    ('Avg Recovery', 'Rs 0', AppColors.greenDark),
    ('Average Sale', 'Rs 166.667', Color(0xFFFF9800)),
  ];

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
              for (int i = 0; i < _stats.length; i++) ...[
                Expanded(
                  child: _StatCard(
                    label: _stats[i].$1,
                    value: _stats[i].$2,
                    accentColor: _stats[i].$3,
                  ),
                ),
                if (i < _stats.length - 1) const SizedBox(width: 8),
              ],
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: _RevenueBarChart(),
          ),
        ],
      ),
    );
  }
}

// ── Stat card (same style as DayStatsGrid._DayStatCard) ──────────────────────

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

// ── Bar chart ─────────────────────────────────────────────────────────────────

class _RevenueBarChart extends StatelessWidget {
  const _RevenueBarChart();

  static const _bars = RevenueRecoverySection._bars;

  @override
  Widget build(BuildContext context) {
    final barColor = context.primary;

    return BarChart(
      BarChartData(
        maxY: 1200,
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
              interval: 200,
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
                if (i < 0 || i >= _bars.length) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _bars[i].label,
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
          horizontalInterval: 200,
          getDrawingHorizontalLine: (_) => FlLine(
            color: AppColors.grey100,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: _bars
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
