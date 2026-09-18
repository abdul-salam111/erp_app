import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/monthly_stats_detail_entity.dart';
import '../../domain/entities/receipt_entity.dart';
import '../admin_dashboard/bloc/admin_dashboard_bloc.dart';

class ReceiptsChartSection extends StatefulWidget {
  const ReceiptsChartSection({super.key});

  @override
  State<ReceiptsChartSection> createState() => _ReceiptsChartSectionState();
}

class _ReceiptsChartSectionState extends State<ReceiptsChartSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _chartCtrl;
  late final Animation<double> _chartAnim;

  @override
  void initState() {
    super.initState();
    _chartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _chartAnim = CurvedAnimation(parent: _chartCtrl, curve: Curves.easeOutCubic);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _chartCtrl.forward();
    });
  }

  @override
  void dispose() {
    _chartCtrl.dispose();
    super.dispose();
  }

  List<MonthlyStatDetailPoint> _aggregateByDay(List<ReceiptEntity> receipts) {
    final totals = <DateTime, double>{};
    for (final r in receipts) {
      final day = DateTime(r.docDate.year, r.docDate.month, r.docDate.day);
      totals[day] = (totals[day] ?? 0) + r.amount;
    }
    final days = totals.keys.toList()..sort();
    return days.map((d) => MonthlyStatDetailPoint(date: d, amount: totals[d]!)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDashboardBloc, AdminDashboardState>(
      listenWhen: (p, c) =>
          p.todayReceiptsStatus != ApiStatus.SUCCESS &&
          c.todayReceiptsStatus == ApiStatus.SUCCESS,
      listener: (_, __) => _chartCtrl.forward(from: 0),
      buildWhen: (p, c) =>
          p.todayReceiptsStatus != c.todayReceiptsStatus ||
          p.todayReceipts != c.todayReceipts,
      builder: (context, state) {
        final isLoading =
            state.todayReceiptsStatus == ApiStatus.INITIAL ||
            state.todayReceiptsStatus == ApiStatus.LOADING;
        final sym = currentUser.org.currencySymbol;
        final totalAmount = state.todayReceipts.fold(
          0.0,
          (sum, r) => sum + r.amount,
        );
        final points = _aggregateByDay(state.todayReceipts);

        return GlassSurface(
          radius: 16,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 13, 6, 12),
                child: Row(
                  children: [
                    Container(
                      padding: .all(7),
                      decoration: BoxDecoration(
                        color: context.navyIconBg,
                        borderRadius: .circular(8),
                      ),
                      child: Icon(
                        Icons.receipt_long_rounded,
                        color: context.navyIconColor,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      AppConstants.receiptsOverviewLabel,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    if (!isLoading && state.todayReceipts.isNotEmpty)
                      Text(
                        '$sym ${totalAmount.toCompact(decimals: 1)}',
                        style: context.labelMedium.copyWith(
                          color: context.primary,
                          fontWeight: .w700,
                        ),
                      ),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.navyBorder),

              Padding(
                padding: const EdgeInsets.fromLTRB(4, 14, 14, 16),
                child: SizedBox(
                  height: 160,
                  child: isLoading
                      ? ShimmerBox(
                          radius: 8,
                          height: 160,
                          width: double.infinity,
                        )
                      : _buildChart(context, points, sym),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChart(
    BuildContext context,
    List<MonthlyStatDetailPoint> points,
    String sym,
  ) {
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

    final minAmount = points.fold(0.0, (m, p) => p.amount < m ? p.amount : m);
    final maxAmount = points.fold(0.0, (m, p) => p.amount > m ? p.amount : m);

    final minY = minAmount < 0 ? minAmount : 0.0;
    final maxY = maxAmount > 0 ? maxAmount : (minY == 0 ? 100.0 : 0.0);
    final interval = ((maxY - minY) / 4).ceilToDouble().clamp(
      1.0,
      double.infinity,
    );

    return AnimatedBuilder(
      animation: _chartAnim,
      builder: (context, _) {
        final progress = _chartAnim.value;
        final animSpots = spots
            .map((s) => FlSpot(s.x, s.y * progress))
            .toList();

        return LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: interval,
              getDrawingHorizontalLine: (_) =>
                  FlLine(color: context.border, strokeWidth: 0.8),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 46,
                  interval: interval,
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
                          fontSize: 8.5,
                          fontWeight: .w700,
                          color: context.textSecondary,
                        ),
                      ),
                    );
                  },
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
            minY: minY,
            maxY: maxY,
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                fitInsideVertically: true,
                fitInsideHorizontally: true,
                getTooltipColor: (_) => context.primary.withValues(alpha: 0.85),
                getTooltipItems: (spots) => spots
                    .map(
                      (s) => LineTooltipItem(
                        '$sym ${s.y.toStringAsFixed(0)}',
                        const TextStyle(
                          color: AppColors.white,
                          fontSize: 11,
                          fontWeight: .w600,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: animSpots,
                isCurved: true,
                color: context.primary,
                barWidth: 2.2,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: context.primary.withValues(alpha: 0.10),
                  applyCutOffY: true,
                  cutOffY: 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
