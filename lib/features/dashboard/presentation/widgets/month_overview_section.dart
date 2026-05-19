import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/theme_utils.dart';
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
      isUp: true,
    ),
    _StatCard(
      label: AppConstants.newOrders,
      value: '2',
      change: AppConstants.changeMinus250Percent,
      isUp: false,
    ),
    _StatCard(
      label: AppConstants.newClientsLabel,
      value: '0',
      change: AppConstants.changeMinus100Percent,
      isUp: false,
    ),
  ];

  static const _summaryRows = <_SummaryRow>[
    _SummaryRow(
      label: AppConstants.totalRevenueLabel,
      value: AppConstants.rs503100Label,
      change: '-139%',
      isUp: true,
    ),
    _SummaryRow(
      label: AppConstants.totalPurchasesLabel,
      value: AppConstants.rs6300Label,
      change: '-42,887%',
      isUp: true,
    ),
    _SummaryRow(
      label: AppConstants.recoveriesLabel,
      value: AppConstants.rs0,
      change: '0%',
      isUp: true,
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
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
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
      buildWhen: (prev, curr) =>
          prev.selectedMonth != curr.selectedMonth ||
          prev.showMonthStats != curr.showMonthStats,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(16),
            border: Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 4),
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
                        color: context.primary.withValues(alpha: 0.10),
                        borderRadius: .circular(8),
                      ),
                      child: Icon(
                        Icons.bar_chart_rounded,
                        color: context.primary,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      AppConstants.monthOverview,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    // View Stats toggle
                    GestureDetector(
                      onTap: () => context.read<DashboardBloc>().add(
                        const DashboardMonthStatsToggled(),
                      ),
                      child: Container(
                        padding: .symmetric(horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                          color: state.showMonthStats
                              ? context.primary.withValues(alpha: 0.09)
                              : context.grey50,
                          borderRadius: .circular(20),
                          border: .all(
                            color: state.showMonthStats
                                ? context.primary.withValues(alpha: 0.35)
                                : context.border,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              'Stats',
                              style: context.labelSmall.copyWith(
                                color: state.showMonthStats
                                    ? context.primary
                                    : context.textSecondary,
                                fontWeight: .w600,
                                fontSize: 10
                              ),
                            ),
                            const SizedBox(width: 3),
                            AnimatedRotation(
                              turns:    state.showMonthStats ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              curve:    Curves.easeInOut,
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 14,
                                color: state.showMonthStats
                                    ? context.primary
                                    : context.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Month/year picker chip
                    GestureDetector(
                      onTap: () => _pickMonth(context, state.selectedMonth),
                      child: Container(
                        padding: .symmetric(horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                          color: context.primary.withValues(alpha: 0.07),
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
                              size: 13,
                              color: context.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _monthLabel(state.selectedMonth),
                              style: context.labelSmall.copyWith(
                                color: context.primary,
                                fontWeight: .w600,
                                fontSize: 10
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 14,
                              color: context.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Expandable stats ────────────────────────────────
              AnimatedSize(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeInOut,
                clipBehavior: .hardEdge,
                child: state.showMonthStats
                    ? Column(
                        mainAxisSize: .min,
                        children: [
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: context.border,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: _StatCardWidget(data: _statCards[0]),
                                ),
                                VerticalDivider(
                                  width: 1,
                                  thickness: 1,
                                  color: context.border,
                                ),
                                Expanded(
                                  child: _StatCardWidget(data: _statCards[1]),
                                ),
                                VerticalDivider(
                                  width: 1,
                                  thickness: 1,
                                  color: context.border,
                                ),
                                Expanded(
                                  child: _StatCardWidget(data: _statCards[2]),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: context.border,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: _SummaryColWidget(
                                    data: _summaryRows[0],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 1,
                                  thickness: 1,
                                  color: context.border,
                                ),
                                Expanded(
                                  child: _SummaryColWidget(
                                    data: _summaryRows[1],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 1,
                                  thickness: 1,
                                  color: context.border,
                                ),
                                Expanded(
                                  child: _SummaryColWidget(
                                    data: _summaryRows[2],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(width: double.infinity),
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
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: 100000,
                            getDrawingHorizontalLine: (_) =>
                                FlLine(color: context.border, strokeWidth: 0.8),
                          ),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 48,
                                interval: 100000,
                                getTitlesWidget: (v, _) => Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    '${(v / 1000).toStringAsFixed(0)}k',
                                    style: TextStyle(
                                      fontSize: 8.5,
                                      color: context.textSecondary,
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
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: _chartSpots,
                              isCurved: true,
                              color: context.primary,
                              barWidth: 2.2,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
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
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
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
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => setState(() => _year--),
                ),
                Text(
                  '$_year',
                  style: context.titleSmall.copyWith(fontWeight: .w700),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => setState(() => _year++),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Month grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (_, i) {
                final isSelected =
                    (i + 1) == widget.initial.month &&
                    _year == widget.initial.year;
                return GestureDetector(
                  onTap: () => Navigator.pop(context, DateTime(_year, i + 1)),
                  child: Container(
                    alignment: .center,
                    decoration: BoxDecoration(
                      color: isSelected ? context.primary : context.grey50,
                      borderRadius: .circular(8),
                      border: Border.all(
                        color: isSelected ? context.primary : context.border,
                      ),
                    ),
                    child: Text(
                      _months[i],
                      style: context.labelSmall.copyWith(
                        color: isSelected ? context.white : context.textPrimary,
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

// ─── Stat card ────────────────────────────────────────────────────────────────

class _StatCardWidget extends StatelessWidget {
  final _StatCard data;
  const _StatCardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final changeColor = data.isUp
        ? const Color(0xFFE53935)
        : const Color(0xFF43A047);

    return Padding(
      padding: .symmetric(horizontal: 10, vertical: 11),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            data.label,
            style: context.labelSmall.copyWith(color: context.textSecondary),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            data.value,
            style: context.labelSmall.copyWith(
              fontWeight: .w700,
              color: context.textPrimary,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Icon(
                data.isUp
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 9,
                color: changeColor,
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  data.change,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: changeColor,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Summary column ───────────────────────────────────────────────────────────

class _SummaryColWidget extends StatelessWidget {
  final _SummaryRow data;
  const _SummaryColWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final changeColor = data.isUp
        ? const Color(0xFFE53935)
        : const Color(0xFF43A047);

    return Padding(
      padding: .symmetric(horizontal: 10, vertical: 11),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            data.label,
            style: context.labelSmall.copyWith(color: context.textSecondary),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            data.value,
            style: context.labelSmall.copyWith(
              fontWeight: .w700,
              color: context.textPrimary,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Icon(
                data.isUp
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 9,
                color: changeColor,
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  data.change,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: changeColor,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Data models ──────────────────────────────────────────────────────────────

class _StatCard {
  final String label;
  final String value;
  final String change;
  final bool isUp;

  const _StatCard({
    required this.label,
    required this.value,
    required this.change,
    required this.isUp,
  });
}

class _SummaryRow {
  final String label;
  final String value;
  final String change;
  final bool isUp;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.change,
    required this.isUp,
  });
}
