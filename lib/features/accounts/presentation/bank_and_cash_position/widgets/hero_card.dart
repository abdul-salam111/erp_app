import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class BankAndCashHeroCard extends StatelessWidget {
  final List<BankCashItemEntity> bankCashItems;
  const BankAndCashHeroCard({super.key, required this.bankCashItems});

  static const _lineColor = AppColors.chartPrimary;

  @override
  Widget build(BuildContext context) {
    if (bankCashItems.isEmpty) return const SizedBox.shrink();

    final orderedItems = bankCashItems.reversed.toList();
    final spots = orderedItems
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value.amount.abs()))
        .toList();

    final amounts = orderedItems
        .map((bankCashItem) => bankCashItem.amount.abs())
        .toList();
    final rawMin = amounts.reduce(min);
    final rawMax = amounts.reduce(max);
    final pad = (rawMax - rawMin) * 0.18;
    final minY = rawMin - pad;
    final maxY = rawMax + pad;
    final interval = (maxY - minY) / 4;

    final chartWidth = max(
      MediaQuery.sizeOf(context).width - 12,
      orderedItems.length * 25.0,
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(6, 6, 6, 0),
      height: context.screenHeight * 0.30,
      decoration: const BoxDecoration(),
      clipBehavior: .hardEdge,
      child: Row(
        children: [
          // ── Fixed Y axis ─────────────────────────────────────
          SizedBox(
            width: 50,
            child: LineChart(
              LineChartData(
                minY: minY,
                maxY: maxY,
                lineTouchData: const LineTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      interval: interval > 0 ? interval : 1,
                      getTitlesWidget: (value, meta) {
                        if (value == meta.min || value == meta.max) {
                          return const SizedBox.shrink();
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            value.abs().toCompact(),
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: context.transparent,
                    barWidth: 0,
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          // ── Scrollable chart ──────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: SizedBox(
                  width: chartWidth,
                  child: LineChart(
                    LineChartData(
                      minY: minY,
                      maxY: maxY,
                      lineTouchData: LineTouchData(
                        enabled: true,
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (_) => context.surface,
                          tooltipRoundedRadius: 8,
                          tooltipBorder: BorderSide(color: context.border),
                          getTooltipItems: (touchedSpots) => touchedSpots
                              .map(
                                (spot) => LineTooltipItem(
                                  spot.y.abs().toCompact(),
                                  context.labelSmall.copyWith(
                                    color: context.textPrimary,
                                    fontWeight: .w700,
                                    fontSize: 11,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      titlesData: const FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: interval > 0 ? interval : 1,
                        getDrawingHorizontalLine: (_) => FlLine(
                          color: AppColors.border.withValues(alpha: 0.6),
                          strokeWidth: 1,
                          dashArray: [4, 4],
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          curveSmoothness: 0.35,
                          color: _lineColor,
                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                _lineColor.withValues(alpha: 0.22),
                                _lineColor.withValues(alpha: 0.0),
                              ],
                              begin: .topCenter,
                              end: .bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BankAndCashHeroCardShimmer extends StatelessWidget {
  const BankAndCashHeroCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(borderRadius: .circular(20)),
      clipBehavior: .hardEdge,
      child: ShimmerBox(
        height: double.infinity,
        width: double.infinity,
        radius: 20,
      ),
    );
  }
}
