import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/theme_utils.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class MonthOverviewSection extends StatelessWidget {
  const MonthOverviewSection({super.key});

  static const _statCards = <_StatCard>[
    _StatCard(
      label:       AppConstants.expensesLabel,
      value:       AppConstants.rs6110,
      change:      AppConstants.change84Percent,
      isUp:        true,
      bgColor:     Color(0xFFFFEBEE),
      iconBgColor: Color(0xFFE53935),
      icon:        Icons.camera_alt_rounded,
    ),
    _StatCard(
      label:       AppConstants.newOrders,
      value:       '2',
      change:      AppConstants.changeMinus250Percent,
      isUp:        false,
      bgColor:     Color(0xFFE8F5E9),
      iconBgColor: Color(0xFF43A047),
      icon:        Icons.receipt_long_rounded,
    ),
    _StatCard(
      label:       AppConstants.newClientsLabel,
      value:       '0',
      change:      AppConstants.changeMinus100Percent,
      isUp:        false,
      bgColor:     Color(0xFFFFF3E0),
      iconBgColor: Color(0xFFFFA000),
      icon:        Icons.people_alt_rounded,
    ),
  ];

  static const _summaryRows = <_SummaryRow>[
    _SummaryRow(label: AppConstants.totalRevenueLabel,   value: AppConstants.rs503100Label, change: '-139%',      isUp: true),
    _SummaryRow(label: AppConstants.totalPurchasesLabel, value: AppConstants.rs6300Label,   change: '-42,887%',   isUp: true),
    _SummaryRow(label: AppConstants.recoveriesLabel,      value: AppConstants.rs0,       change: '0%',         isUp: true),
  ];

  // Revenue data points (x = index, y = value in PKR)
  static const _chartSpots = <FlSpot>[
    FlSpot(0,  0),
    FlSpot(1,  8000),
    FlSpot(2,  25000),
    FlSpot(3,  60000),
    FlSpot(4,  140000),
    FlSpot(5,  370000),
    FlSpot(6,  210000),
    FlSpot(7,  80000),
    FlSpot(8,  20000),
    FlSpot(9,  4000),
    FlSpot(10, 0),
    FlSpot(11, 12000),
    FlSpot(12, 120000),
    FlSpot(13, 100000),
    FlSpot(14, 42000),
    FlSpot(15, 10000),
    FlSpot(16, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // ── Section header ──
        Row(
          children: [
            Text(
              AppConstants.monthOverview,
              style: context.titleSmall.copyWith(
                fontWeight: .w700,
                color:      context.textPrimary,
              ),
            ),
            const Spacer(),
            Container(
              padding: .symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border:       Border.all(color: context.border),
                borderRadius: .circular(8),
              ),
              child: Text(
                AppConstants.may2026,
                style: context.labelSmall.copyWith(
                  color:      context.textSecondary,
                  fontWeight: .w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Stat cards (3-column row) ──
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: .stretch,
            children: [
              for (int i = 0; i < _statCards.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(child: _StatCardWidget(data: _statCards[i])),
              ],
            ],
          ),
        ),
        const SizedBox(height: 14),

        // ── Summary + chart card ──
        Container(
          decoration: BoxDecoration(
            color:        context.white,
            borderRadius: .circular(12),
            border:       Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color:     Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset:    const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // Summary rows
              _SummaryRowWidget(data: _summaryRows[0], topRadius: 12),
              Divider(height: 1, thickness: 1, color: context.border),
              _SummaryRowWidget(data: _summaryRows[1]),
              Divider(height: 1, thickness: 1, color: context.border),
              _SummaryRowWidget(data: _summaryRows[2]),
              Divider(height: 1, thickness: 1, color: context.border),

              // Chart
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 14, 14, 14),
                child: Column(
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      AppConstants.totalRevenueLabel,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 180,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show:               true,
                            drawVerticalLine:   false,
                            horizontalInterval: 100000,
                            getDrawingHorizontalLine: (_) => FlLine(
                              color:       context.border,
                              strokeWidth: 0.8,
                            ),
                          ),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles:   true,
                                reservedSize: 58,
                                interval:     100000,
                                getTitlesWidget: (value, _) => Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Text(
                                    'Rs. ${(value / 1000).toStringAsFixed(0)},000',
                                    style: TextStyle(
                                      fontSize: 8.5,
                                      color:    context.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles:  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles:    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData:  FlBorderData(show: false),
                          minY:        0,
                          maxY:        400000,
                          lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipColor: (_) => context.primary.withValues(alpha: 0.85),
                              getTooltipItems: (spots) => spots
                                  .map((s) => LineTooltipItem(
                                        'Rs ${s.y.toStringAsFixed(0)}',
                                        const TextStyle(
                                          color:      Colors.white,
                                          fontSize:   11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots:   _chartSpots,
                              isCurved: true,
                              color:   const Color(0xFF43A047),
                              barWidth: 2.2,
                              dotData:  const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show:  true,
                                color: const Color(0xFF43A047).withValues(alpha: 0.13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Stat card ────────────────────────────────────────────────────────────────

class _StatCardWidget extends StatelessWidget {
  final _StatCard data;

  const _StatCardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final changeColor = data.isUp ? const Color(0xFFE53935) : const Color(0xFF43A047);

    return Container(
      padding: .symmetric(horizontal: 10, vertical: 11),
      decoration: BoxDecoration(
        color:        data.bgColor,
        borderRadius: .circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  data.label,
                  style: context.labelSmall.copyWith(
                    color:      const Color(0xFF616161),
                    fontWeight: .w500,
                  ),
                ),
              ),
              Container(
                width:  24,
                height: 24,
                decoration: BoxDecoration(
                  color:        data.iconBgColor,
                  borderRadius: .circular(8),
                ),
                child: Icon(data.icon, color: Colors.white, size: 12),
              ),
            ],
          ),
          const Spacer(),
          Text(
            data.value,
            style: context.titleSmall.copyWith(
              fontWeight: .w700,
              color:      const Color(0xFF212121),
              fontSize:   15,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: .symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color:        Colors.white.withValues(alpha: 0.65),
              borderRadius: .circular(10),
            ),
            child: Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  data.isUp
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                  size:  10,
                  color: changeColor,
                ),
                const SizedBox(width: 2),
                Text(
                  data.change,
                  style: TextStyle(
                    fontSize:   10,
                    fontWeight: FontWeight.w600,
                    color:      changeColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Summary row ──────────────────────────────────────────────────────────────

class _SummaryRowWidget extends StatelessWidget {
  final _SummaryRow data;
  final double      topRadius;

  const _SummaryRowWidget({required this.data, this.topRadius = 0});

  @override
  Widget build(BuildContext context) {
    final changeColor = const Color(0xFFE53935);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                data.label,
                style: context.labelSmall.copyWith(color: context.textSecondary),
              ),
              const Spacer(),
              Icon(Icons.arrow_upward_rounded, size: 10, color: changeColor),
              const SizedBox(width: 2),
              Text(
                data.change,
                style: context.labelSmall.copyWith(
                  color:      changeColor,
                  fontWeight: .w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            data.value,
            style: context.titleSmall.copyWith(
              fontWeight: .w700,
              color:      context.textPrimary,
              fontSize:   15,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Data models ──────────────────────────────────────────────────────────────

class _StatCard {
  final String   label;
  final String   value;
  final String   change;
  final bool     isUp;
  final Color    bgColor;
  final Color    iconBgColor;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.change,
    required this.isUp,
    required this.bgColor,
    required this.iconBgColor,
    required this.icon,
  });
}

class _SummaryRow {
  final String label;
  final String value;
  final String change;
  final bool   isUp;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.change,
    required this.isUp,
  });
}
