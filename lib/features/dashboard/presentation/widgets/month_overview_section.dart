import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import '../bloc/dashboard_bloc.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

class MonthOverviewSection extends StatelessWidget {
  const MonthOverviewSection({super.key});

  static const _statCards = <_StatCard>[
    _StatCard(
      label: AppConstants.expensesLabel,
      value: AppConstants.rs6110,
      change: AppConstants.change84Percent,
      isUp:  true,
      color: Color(0xFFE53935),
    ),
    _StatCard(
      label: AppConstants.newOrders,
      value: '2',
      change: AppConstants.changeMinus250Percent,
      isUp:  false,
      color: Color(0xFF1B84FF),
    ),
    _StatCard(
      label: AppConstants.newClientsLabel,
      value: '0',
      change: AppConstants.changeMinus100Percent,
      isUp:  false,
      color: Color(0xFF4CAF50),
    ),
    _StatCard(
      label: AppConstants.totalRevenueLabel,
      value: AppConstants.rs503100Label,
      change: '-139%',
      isUp:  true,
      color: Color(0xFFFF9800),
    ),
    _StatCard(
      label: AppConstants.totalPurchasesLabel,
      value: AppConstants.rs6300Label,
      change: '-42,887%',
      isUp:  true,
      color: Color(0xFF9C27B0),
    ),
    _StatCard(
      label: AppConstants.recoveriesLabel,
      value: AppConstants.rs0,
      change: '0%',
      isUp:  true,
      color: Color(0xFF00ACC1),
    ),
  ];

  static const _chartSpots = <FlSpot>[
    FlSpot(0, 0),
    FlSpot(1, 8000),
    FlSpot(2, 25000),
    FlSpot(3, 60000),
    FlSpot(4, 140000),
    FlSpot(5, 370000),
    FlSpot(6, 210000),
    FlSpot(7, 80000),
    FlSpot(8, 20000),
    FlSpot(9, 4000),
    FlSpot(10, 0),
    FlSpot(11, 12000),
    FlSpot(12, 120000),
    FlSpot(13, 100000),
    FlSpot(14, 42000),
    FlSpot(15, 10000),
    FlSpot(16, 0),
  ];

  static const _monthNames = [
    AppConstants.jan, AppConstants.feb, AppConstants.mar, AppConstants.apr, AppConstants.may, AppConstants.jun,
    AppConstants.jul, AppConstants.aug, AppConstants.sep, AppConstants.oct, AppConstants.nov, AppConstants.dec,
  ];

  static String _monthLabel(DateTime selected) =>
      '${_monthNames[selected.month - 1]} ${selected.year}';

  Future<void> _pickMonth(BuildContext context, DateTime current) async {
    final picked = await showDialog<DateTime>(
      context: context,
      builder: (_) => _MonthPickerDialog(initial: current),
    );
    if (picked != null && context.mounted) {
      context.read<DashboardBloc>().add(DashboardMonthChanged(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (prev, curr) => prev.selectedMonth != curr.selectedMonth,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color:        context.white,
            borderRadius: .circular(16),
            border:       Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color:      Colors.black.withValues(alpha: 0.06),
                blurRadius: 14,
                offset:     const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // ── Header ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 13, 6, 12),
                child: Row(
                  children: [
                    Container(
                      padding: .all(7),
                      decoration: BoxDecoration(
                        color:        context.primary.withValues(alpha: 0.10),
                        borderRadius: .circular(8),
                      ),
                      child: Icon(
                        Icons.bar_chart_rounded,
                        color: context.primary,
                        size:  16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      AppConstants.monthOverview,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    // Month/year picker chip
                    GestureDetector(
                      onTap: () => _pickMonth(context, state.selectedMonth),
                      child: Container(
                        padding: .symmetric(horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                          color:        context.primary.withValues(alpha: 0.07),
                          borderRadius: .circular(20),
                          border: .all(
                            color: context.primary.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              size:  13,
                              color: context.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _monthLabel(state.selectedMonth),
                              style: context.labelSmall.copyWith(
                                color:      context.primary,
                                fontWeight: .w600,
                                fontSize:   10,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size:  14,
                              color: context.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Stats grid ──────────────────────────────────────
              Divider(height: 1, thickness: 1, color: context.border),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding:    EdgeInsets.zero,
                  physics:    const NeverScrollableScrollPhysics(),
                  itemCount:  _statCards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:   context.gridColumnCount,
                    mainAxisSpacing:  context.gridSpacing,
                    crossAxisSpacing: context.gridSpacing,
                    childAspectRatio: context.overviewCardRatio,
                  ),
                  itemBuilder: (context, i) => _MonthStatCard(data: _statCards[i]),
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              // ── Chart ────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 14, 14, 16),
                child: SizedBox(
                  height: 160,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show:               true,
                        drawVerticalLine:   false,
                        horizontalInterval: 100000,
                        getDrawingHorizontalLine: (_) =>
                            FlLine(color: context.border, strokeWidth: 0.8),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles:   true,
                            reservedSize: 48,
                            interval:     100000,
                            getTitlesWidget: (v, _) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                '${(v / 1000).toStringAsFixed(0)}k',
                                style: TextStyle(
                                  fontSize: 8.5,
                                  color:    context.textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minY: 0,
                      maxY: 400000,
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (_) =>
                              context.primary.withValues(alpha: 0.85),
                          getTooltipItems: (spots) => spots
                              .map(
                                (s) => LineTooltipItem(
                                  'Rs ${s.y.toStringAsFixed(0)}',
                                  const TextStyle(
                                    color:      Colors.white,
                                    fontSize:   11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots:    _chartSpots,
                          isCurved: true,
                          color:    context.primary,
                          barWidth: 2.2,
                          dotData:  const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show:  true,
                            color: context.primary.withValues(alpha: 0.10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Month stat card (matches TodayOverview style) ────────────────────────────

class _MonthStatCard extends StatelessWidget {
  final _StatCard data;
  const _MonthStatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final changeColor = data.isUp
        ? const Color(0xFFE53935)
        : const Color(0xFF43A047);

    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color:        context.white,
        borderRadius: .circular(10),
        border:       .all(color: const Color(0xFFEDEDED)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withValues(alpha: 0.07),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: .stretch,
        children: [
          Container(width: 4, color: data.color),
          Expanded(
            child: Padding(
              padding: .symmetric(horizontal: 10, vertical: 9),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment:  .center,
                children: [
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      Expanded(
                        child: Text(
                          data.value,
                          style: context.bodyMedium.copyWith(
                            fontWeight: .w700,
                            color:      context.textPrimary,
                            fontSize:   13,
                            height:     1,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: .min,
                        children: [
                          Icon(
                            data.isUp
                                ? Icons.arrow_upward_rounded
                                : Icons.arrow_downward_rounded,
                            size:  9,
                            color: changeColor,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            data.change,
                            style: TextStyle(
                              fontSize:   9,
                              fontWeight: FontWeight.w600,
                              color:      changeColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.label,
                    style: context.labelSmall.copyWith(
                      color:    context.textSecondary,
                      fontSize: 10,
                      height:   1.1,
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
    );
  }
}

// ─── Month picker dialog ───────────────────────────────────────────────────────

class _MonthPickerDialog extends StatefulWidget {
  final DateTime initial;
  const _MonthPickerDialog({required this.initial});

  @override
  State<_MonthPickerDialog> createState() => _MonthPickerDialogState();
}

class _MonthPickerDialogState extends State<_MonthPickerDialog> {
  late int _year;

  static const _months = [
    AppConstants.jan, AppConstants.feb, AppConstants.mar, AppConstants.apr, AppConstants.may, AppConstants.jun,
    AppConstants.jul, AppConstants.aug, AppConstants.sep, AppConstants.oct, AppConstants.nov, AppConstants.dec,
  ];

  @override
  void initState() {
    super.initState();
    _year = widget.initial.year;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: .all(20),
        child: Column(
          mainAxisSize: .min,
          children: [
            // Year navigation
            Row(
              mainAxisAlignment: .center,
              children: [
                IconButton(
                  icon:      const Icon(Icons.chevron_left),
                  onPressed: () => setState(() => _year--),
                ),
                Text(
                  '$_year',
                  style: context.titleSmall.copyWith(fontWeight: .w700),
                ),
                IconButton(
                  icon:      const Icon(Icons.chevron_right),
                  onPressed: () => setState(() => _year++),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Month grid
            GridView.builder(
              shrinkWrap:  true,
              physics:     const NeverScrollableScrollPhysics(),
              itemCount:   12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  3,
                childAspectRatio: 2.2,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemBuilder: (_, i) {
                final isSelected =
                    (i + 1) == widget.initial.month &&
                    _year    == widget.initial.year;
                return GestureDetector(
                  onTap: () => Navigator.pop(context, DateTime(_year, i + 1)),
                  child: Container(
                    alignment: .center,
                    decoration: BoxDecoration(
                      color:        isSelected ? context.primary : context.grey50,
                      borderRadius: .circular(8),
                      border:       Border.all(
                        color: isSelected ? context.primary : context.border,
                      ),
                    ),
                    child: Text(
                      _months[i],
                      style: context.labelSmall.copyWith(
                        color:      isSelected ? context.white : context.textPrimary,
                        fontWeight: isSelected ? .w700 : .w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Data model ───────────────────────────────────────────────────────────────

class _StatCard {
  final String label;
  final String value;
  final String change;
  final bool   isUp;
  final Color  color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.change,
    required this.isUp,
    required this.color,
  });
}
