import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import '../dashboard/blocs/dashboard_bloc.dart';

// ─── Panel keys ───────────────────────────────────────────────────────────────

const _panels = <_PanelMeta>[
  _PanelMeta(key: 'revenue',      label: AppConstants.revenueLabel),
  _PanelMeta(key: 'expenses',     label: AppConstants.expensesLabel),
  _PanelMeta(key: 'purchases',    label: AppConstants.purchasesLabel),
  _PanelMeta(key: 'recoveries',   label: AppConstants.recoveriesLabel),
  _PanelMeta(key: 'sale_orders',  label: AppConstants.saleOrders),
  _PanelMeta(key: 'new_parties',  label: AppConstants.newPartiesLabel),
];

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
          p.selectedMonth             != c.selectedMonth             ||
          p.monthlyStatsStatus        != c.monthlyStatsStatus        ||
          p.monthlyStats              != c.monthlyStats              ||
          p.monthlyStatsDetailStatus  != c.monthlyStatsDetailStatus  ||
          p.monthlyStatsDetail        != c.monthlyStatsDetail        ||
          p.selectedPanelKey          != c.selectedPanelKey,
      builder: (context, state) {
        final isLoading       = state.monthlyStatsStatus == ApiStatus.INITIAL ||
                                state.monthlyStatsStatus == ApiStatus.LOADING;
        final isDetailLoading = state.monthlyStatsDetailStatus == ApiStatus.INITIAL ||
                                state.monthlyStatsDetailStatus == ApiStatus.LOADING;

        return Container(
          decoration: BoxDecoration(
            color:        context.white,
            borderRadius: .circular(16),
            border:       Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color:      AppColors.black.withValues(alpha: 0.06),
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
                        shrinkWrap:       true,
                        padding:          EdgeInsets.zero,
                        physics:          const NeverScrollableScrollPhysics(),
                        crossAxisCount:   context.gridColumnCount,
                        mainAxisSpacing:  context.gridSpacing,
                        crossAxisSpacing: context.gridSpacing,
                        childAspectRatio: context.overviewCardRatio,
                        children: _buildStatCards(state),
                      ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              // ── Panel selector chips ─────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                child: SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    children: _panels.map((p) {
                      final selected = p.key == state.selectedPanelKey;
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: GestureDetector(
                          onTap: selected
                              ? null
                              : () => context.read<DashboardBloc>().add(
                                    MonthlyStatsDetailKeyChanged(p.key),
                                  ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: .symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: selected
                                  ? context.primary
                                  : context.primary.withValues(alpha: 0.07),
                              borderRadius: .circular(20),
                              border: Border.all(
                                color: selected
                                    ? context.primary
                                    : context.primary.withValues(alpha: 0.25),
                              ),
                            ),
                            child: Text(
                              p.label,
                              style: context.labelSmall.copyWith(
                                color:      selected ? context.white : context.primary,
                                fontWeight: selected ? .w600 : .w500,
                                fontSize:   10,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // ── Chart ────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 10, 14, 16),
                child: SizedBox(
                  height: 160,
                  child: isDetailLoading
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
        label:      AppConstants.expensesLabel,
        value:      (m?.currentMonthExpense    ?? 0).toCompact(decimals: 1).let((v) => '$sym $v'),
        pct:        m?.expensePercentage        ?? 0,
        color:      AppColors.errorBright,
        trendColor: AppColors.errorBright,
      ),
      _MonthStatCard(
        label:      AppConstants.newOrders,
        value:      (m?.currentMonthSaleOrders ?? 0).toStringAsFixed(0),
        pct:        m?.saleOrdersPercentage    ?? 0,
        color:      AppColors.primary,
        trendColor: AppColors.greenDark,
      ),
      _MonthStatCard(
        label:      AppConstants.newClientsLabel,
        value:      (m?.currentMonthParties    ?? 0).toStringAsFixed(0),
        pct:        m?.partiesPercentage        ?? 0,
        color:      AppColors.greenDark,
        trendColor: AppColors.greenDark,
      ),
      _MonthStatCard(
        label:      AppConstants.totalRevenueLabel,
        value:      (m?.currentMonthSales      ?? 0).toCompact(decimals: 1).let((v) => '$sym $v'),
        pct:        m?.salesPercentage          ?? 0,
        color:      AppColors.orange,
        trendColor: AppColors.greenDark,
      ),
      _MonthStatCard(
        label:      AppConstants.totalPurchasesLabel,
        value:      (m?.currentMonthPurchases  ?? 0).toCompact(decimals: 1).let((v) => '$sym $v'),
        pct:        m?.purchasesPercentage      ?? 0,
        color:      AppColors.purple,
        trendColor: AppColors.errorBright,
      ),
      _MonthStatCard(
        label:      AppConstants.recoveriesLabel,
        value:      (m?.currentMonthRecoveries ?? 0).toCompact(decimals: 1).let((v) => '$sym $v'),
        pct:        m?.recoveriesPercentage     ?? 0,
        color:      AppColors.cyan,
        trendColor: AppColors.greenDark,
      ),
    ];
  }

  Widget _buildChart(BuildContext context, DashboardState state) {
    final points = state.monthlyStatsDetail;

    if (points.isEmpty) {
      return Center(
        child: Text(
          AppConstants.noDataAvailable,
          style: context.bodySmall.copyWith(color: context.textSecondary),
        ),
      );
    }

    final spots = points
        .map((p) => FlSpot(p.date.day.toDouble(), p.amount))
        .toList();

    final maxAmount = points.fold(0.0, (m, p) => p.amount > m ? p.amount : m);
    final maxY      = maxAmount == 0 ? 100.0 : (maxAmount * 1.3).ceilToDouble();
    final interval  = (maxY / 4).ceilToDouble().clamp(1.0, double.infinity);

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show:             true,
          drawVerticalLine: false,
          horizontalInterval: interval,
          getDrawingHorizontalLine: (_) =>
              FlLine(color: context.border, strokeWidth: 0.8),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles:   true,
              reservedSize: 46,
              interval:     interval,
              getTitlesWidget: (v, _) {
                final label = v >= 1000000
                    ? '${(v / 1000000).toStringAsFixed(1)}M'
                    : v >= 1000
                        ? '${(v / 1000).toStringAsFixed(0)}k'
                        : v.toStringAsFixed(0);
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 2),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize:   8.5,
                      fontWeight: FontWeight.w700,
                      color:      context.textSecondary,
                    ),
                  ),
                );
              },
            ),
          ),
          bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minY: 0,
        maxY: maxY,
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => context.primary.withValues(alpha: 0.85),
            getTooltipItems: (spots) => spots.map((s) => LineTooltipItem(
              '${currentUser.org.currencySymbol} ${s.y.toStringAsFixed(0)}',
              const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w600),
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
  final Color  trendColor;

  const _MonthStatCard({
    required this.label,
    required this.value,
    required this.pct,
    required this.color,
    required this.trendColor,
  });

  @override
  Widget build(BuildContext context) {
    final changeColor = trendColor;
    final pctLabel    = '${pct.abs().toStringAsFixed(1)}%';

    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color:        context.white,
        borderRadius: .circular(10),
        border:       .all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color:      AppColors.black.withValues(alpha: 0.07),
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
                            Icons.arrow_upward_rounded,
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

// ─── Panel meta ───────────────────────────────────────────────────────────────

class _PanelMeta {
  final String key;
  final String label;
  const _PanelMeta({required this.key, required this.label});
}

// ─── Extension helper ─────────────────────────────────────────────────────────

extension _LetExt<T> on T {
  R let<R>(R Function(T) f) => f(this);
}
