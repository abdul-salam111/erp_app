import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class CreditTrendChart extends StatelessWidget {
  const CreditTrendChart({super.key});

  static const _points = [
    (x: 0.0, y: 4200.0, day: '01', label: 'Jan'),
    (x: 1.0, y: 3800.0, day: '01', label: 'Feb'),
    (x: 2.0, y: 5100.0, day: '01', label: 'Mar'),
  ];

  @override
  Widget build(BuildContext context) {
    const maxY = 8000.0;
    const yInterval = 2000.0;
    final lineColor = context.primary;

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
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 2,
                minY: 0,
                maxY: maxY,
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
                      reservedSize: 20,
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
                          textAlign: .center,
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
                        if (value != i.toDouble() || i < 0 || i >= _points.length) {
                          return const SizedBox.shrink();
                        }
                        final pt = _points[i];
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Column(
                            mainAxisSize: .min,
                            children: [
                              Text(
                                pt.day,
                                style: context.labelSmall.copyWith(
                                  fontSize: 9,
                                  color: context.textSecondary,
                                ),
                              ),
                              Text(
                                pt.label,
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
                    spots: _points.map((p) => FlSpot(p.x, p.y)).toList(),
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: lineColor,
                    barWidth: 2.5,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                        radius: 3,
                        color: lineColor,
                        strokeWidth: 1.5,
                        strokeColor: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
