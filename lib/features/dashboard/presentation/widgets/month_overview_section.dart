import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import '../dashboard/blocs/dashboard_bloc.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

class MonthOverviewSection extends StatelessWidget {
  const MonthOverviewSection({super.key});

  static const _monthNames = [
    AppConstants.jan, AppConstants.feb, AppConstants.mar, AppConstants.apr,
    AppConstants.may, AppConstants.jun, AppConstants.jul, AppConstants.aug,
    AppConstants.sep, AppConstants.oct, AppConstants.nov, AppConstants.dec,
  ];

  static String _monthLabel(DateTime d) =>
      '${_monthNames[d.month - 1]} ${d.year}';

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
      buildWhen: (p, c) =>
          p.selectedMonth       != c.selectedMonth       ||
          p.monthlyStatsStatus  != c.monthlyStatsStatus  ||
          p.monthlyStats        != c.monthlyStats,
      builder: (context, state) {
        final isLoading = state.monthlyStatsStatus == ApiStatus.INITIAL ||
                          state.monthlyStatsStatus == ApiStatus.LOADING;

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
                      child: Icon(Icons.bar_chart_rounded, color: context.primary, size: 16),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      AppConstants.monthOverview,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => _pickMonth(context, state.selectedMonth),
                      child: Container(
                        padding: .symmetric(horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                          color:        context.primary.withValues(alpha: 0.07),
                          borderRadius: .circular(20),
                          border: .all(color: context.primary.withValues(alpha: 0.25)),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          children: [
                            Icon(Icons.calendar_month_rounded, size: 13, color: context.primary),
                            const SizedBox(width: 5),
                            Text(
                              _monthLabel(state.selectedMonth),
                              style: context.labelSmall.copyWith(
                                color: context.primary, fontWeight: .w600, fontSize: 10,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_down_rounded, size: 14, color: context.primary),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              // ── Stats grid ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: isLoading
                    ? _StatsShimmer(columnCount: context.gridColumnCount, spacing: context.gridSpacing, ratio: context.overviewCardRatio)
                    : GridView.count(
                        shrinkWrap:      true,
                        padding:         EdgeInsets.zero,
                        physics:         const NeverScrollableScrollPhysics(),
                        crossAxisCount:  context.gridColumnCount,
                        mainAxisSpacing: context.gridSpacing,
                        crossAxisSpacing: context.gridSpacing,
                        childAspectRatio: context.overviewCardRatio,
                        children: _buildStatCards(state),
                      ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              // ── Chart ────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 14, 14, 16),
                child: SizedBox(
                  height: 160,
                  child: isLoading
                      ? ShimmerBox(radius: 8, height: 160, width: double.infinity)
                      : _buildChart(context, state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildStatCards(DashboardState state) {
    final sym = currentUser.org.currencySymbol;
    final m   = state.monthlyStats;

    return [
      _MonthStatCard(
        label:  AppConstants.expensesLabel,
        value:  (m?.currentMonthExpense    ?? 0).toCompact(decimals: 1).let((v) => '$sym$v'),
        pct:    m?.expensePercentage       ?? 0,
        color:  const Color(0xFFE53935),
      ),
      _MonthStatCard(
        label:  AppConstants.newOrders,
        value:  (m?.currentMonthSaleOrders ?? 0).toStringAsFixed(0),
        pct:    m?.saleOrdersPercentage    ?? 0,
        color:  const Color(0xFF1B84FF),
      ),
      _MonthStatCard(
        label:  AppConstants.newClientsLabel,
        value:  (m?.currentMonthParties    ?? 0).toStringAsFixed(0),
        pct:    m?.partiesPercentage       ?? 0,
        color:  const Color(0xFF4CAF50),
      ),
      _MonthStatCard(
        label:  AppConstants.totalRevenueLabel,
        value:  (m?.currentMonthSales      ?? 0).toCompact(decimals: 1).let((v) => '$sym$v'),
        pct:    m?.salesPercentage         ?? 0,
        color:  const Color(0xFFFF9800),
      ),
      _MonthStatCard(
        label:  AppConstants.totalPurchasesLabel,
        value:  (m?.currentMonthPurchases  ?? 0).toCompact(decimals: 1).let((v) => '$sym$v'),
        pct:    m?.purchasesPercentage     ?? 0,
        color:  const Color(0xFF9C27B0),
      ),
      _MonthStatCard(
        label:  AppConstants.recoveriesLabel,
        value:  (m?.currentMonthRecoveries ?? 0).toCompact(decimals: 1).let((v) => '$sym$v'),
        pct:    m?.recoveriesPercentage    ?? 0,
        color:  const Color(0xFF00ACC1),
      ),
    ];
  }

  Widget _buildChart(BuildContext context, DashboardState state) {
    // Static representative spots — replace with time-series API data when available
    const spots = <FlSpot>[
      FlSpot(0, 0), FlSpot(1, 8000), FlSpot(2, 25000), FlSpot(3, 60000),
      FlSpot(4, 140000), FlSpot(5, 370000), FlSpot(6, 210000), FlSpot(7, 80000),
      FlSpot(8, 20000), FlSpot(9, 4000), FlSpot(10, 0), FlSpot(11, 12000),
      FlSpot(12, 120000), FlSpot(13, 100000), FlSpot(14, 42000), FlSpot(15, 10000),
      FlSpot(16, 0),
    ];

    return LineChart(
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
              showTitles:   true,
              reservedSize: 48,
              interval:     100000,
              getTitlesWidget: (v, _) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  '${(v / 1000).toStringAsFixed(0)}k',
                  style: TextStyle(fontSize: 8.5, color: context.textSecondary),
                ),
              ),
            ),
          ),
          bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minY: 0,
        maxY: 400000,
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => context.primary.withValues(alpha: 0.85),
            getTooltipItems: (spots) => spots.map((s) => LineTooltipItem(
              '${currentUser.org.currencySymbol} ${s.y.toStringAsFixed(0)}',
              const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
            )).toList(),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots:    spots,
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
    );
  }
}

// ─── Shimmer for stats grid ───────────────────────────────────────────────────

class _StatsShimmer extends StatelessWidget {
  final int    columnCount;
  final double spacing;
  final double ratio;

  const _StatsShimmer({
    required this.columnCount,
    required this.spacing,
    required this.ratio,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap:       true,
      padding:          EdgeInsets.zero,
      physics:          const NeverScrollableScrollPhysics(),
      crossAxisCount:   columnCount,
      mainAxisSpacing:  spacing,
      crossAxisSpacing: spacing,
      childAspectRatio: ratio,
      children: List.generate(6, (_) => const ShimmerBox(radius: 10)),
    );
  }
}

// ─── Month stat card ──────────────────────────────────────────────────────────

class _MonthStatCard extends StatelessWidget {
  final String label;
  final String value;
  final double pct;
  final Color  color;

  const _MonthStatCard({
    required this.label,
    required this.value,
    required this.pct,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isUp       = pct >= 0;
    final changeColor = isUp ? const Color(0xFFE53935) : const Color(0xFF43A047);
    final pctLabel    = '${pct.abs().toStringAsFixed(1)}%';

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
          Container(width: 4, color: color),
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
                          value,
                          style: context.bodyMedium.copyWith(
                            fontWeight: .w700, color: context.textPrimary,
                            fontSize: 13, height: 1,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: .min,
                        children: [
                          Icon(
                            isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                            size: 9, color: changeColor,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            pctLabel,
                            style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w600, color: changeColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary, fontSize: 10, height: 1.1,
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
    AppConstants.jan, AppConstants.feb, AppConstants.mar, AppConstants.apr,
    AppConstants.may, AppConstants.jun, AppConstants.jul, AppConstants.aug,
    AppConstants.sep, AppConstants.oct, AppConstants.nov, AppConstants.dec,
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
            Row(
              mainAxisAlignment: .center,
              children: [
                IconButton(
                  icon:      const Icon(Icons.chevron_left),
                  onPressed: () => setState(() => _year--),
                ),
                Text('$_year', style: context.titleSmall.copyWith(fontWeight: .w700)),
                IconButton(
                  icon:      const Icon(Icons.chevron_right),
                  onPressed: () => setState(() => _year++),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap:  true,
              physics:     const NeverScrollableScrollPhysics(),
              itemCount:   12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   3,
                childAspectRatio: 2.2,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemBuilder: (_, i) {
                final isSelected =
                    (i + 1) == widget.initial.month && _year == widget.initial.year;
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

// ─── Extension helper ─────────────────────────────────────────────────────────

extension _LetExt<T> on T {
  R let<R>(R Function(T) f) => f(this);
}
