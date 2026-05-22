import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../dashboard/blocs/dashboard_bloc.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

class SaleOrdersSection extends StatelessWidget {
  const SaleOrdersSection({super.key});

  static const _filters = [
    AppConstants.janMar,
    AppConstants.inCompleteOnly,
    AppConstants.completedOnly,
    AppConstants.allSaleOrders,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (p, c) =>
          p.saleOrderFilterIndex    != c.saleOrderFilterIndex    ||
          p.saleOrderSummaryStatus  != c.saleOrderSummaryStatus  ||
          p.saleOrderSummary        != c.saleOrderSummary,
      builder: (context, state) {
        final isLoading = state.saleOrderSummaryStatus == ApiStatus.INITIAL ||
                          state.saleOrderSummaryStatus == ApiStatus.LOADING;

        final summary       = state.saleOrderSummary;
        final total         = summary?.ttlOrders            ?? 0;
        final completed     = summary?.ttlCompletedOrders   ?? 0;
        final partial       = summary?.ttlPartialOrders     ?? 0;
        final notStarted    = summary?.ttlNotStartedOrders  ?? 0;
        final completedDeg  = total > 0 ? (completed / total) * 180.0 : 0.0;
        final remainingDeg  = 180.0 - completedDeg;

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
                padding: const EdgeInsets.fromLTRB(14, 13, 12, 12),
                child: Row(
                  children: [
                    Container(
                      padding: .all(7),
                      decoration: BoxDecoration(
                        color:        context.primary.withValues(alpha: 0.10),
                        borderRadius: .circular(8),
                      ),
                      child: Icon(Iconsax.truck, color: context.primary, size: 16),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      AppConstants.saleOrders,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    Container(
                      padding: .symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color:        context.primary,
                        borderRadius: .circular(8),
                      ),
                      child: Text(
                        AppConstants.report,
                        style: context.labelSmall.copyWith(
                          color: Colors.white, fontWeight: .w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Filter chips ─────────────────────────────────────
              Padding(
                padding: .fromLTRB(12, 0, 12, 12),
                child: SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    children: [
                      ...List.generate(_filters.length, (i) {
                        final sel = i == state.saleOrderFilterIndex;
                        return Padding(
                          padding: .only(right: i < _filters.length - 1 ? 6 : 0),
                          child: GestureDetector(
                            onTap: () => context
                                .read<DashboardBloc>()
                                .add(SaleOrderFilterChanged(i)),
                            child: Container(
                              padding: .symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: sel
                                    ? context.primary.withValues(alpha: 0.09)
                                    : context.grey50,
                                borderRadius: .circular(20),
                                border: Border.all(
                                  color: sel
                                      ? context.primary.withValues(alpha: 0.35)
                                      : context.border,
                                ),
                              ),
                              child: Text(
                                _filters[i],
                                style: context.labelSmall.copyWith(
                                  color:      sel ? context.primary : context.textSecondary,
                                  fontWeight: sel ? .w600 : .w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(width: 8),
                      Icon(Icons.filter_list_rounded, size: 18, color: context.textSecondary),
                    ],
                  ),
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              if (isLoading)
                _SaleOrderShimmer()
              else ...[
                // ── Stats grid (2×2) ─────────────────────────────────
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(child: _StatBox(label: AppConstants.totalOrdersLabel,      value: '$total',      icon: Iconsax.bag_2,       color: const Color(0xFF1B84FF))),
                      VerticalDivider(width: 1, thickness: 1, color: context.border),
                      Expanded(child: _StatBox(label: AppConstants.completedLabel,         value: '$completed',  icon: Iconsax.tick_circle, color: const Color(0xFF43A047))),
                    ],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: context.border),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(child: _StatBox(label: AppConstants.partialInProgressLabel, value: '$partial',    icon: Iconsax.note_2, color: const Color(0xFFFF9800))),
                      VerticalDivider(width: 1, thickness: 1, color: context.border),
                      Expanded(child: _StatBox(label: AppConstants.notStartedLabel,        value: '$notStarted', icon: Iconsax.clock,  color: const Color(0xFF37474F))),
                    ],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: context.border),

                // ── Semi-donut chart ─────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: _SemiDonut(
                    completed:    completed,
                    total:        total,
                    completedDeg: completedDeg,
                    remainingDeg: remainingDeg,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

// ─── Shimmer skeleton ─────────────────────────────────────────────────────────

class _SaleOrderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: ShimmerBox(height: 64, radius: 8)),
              const SizedBox(width: 12),
              Expanded(child: ShimmerBox(height: 64, radius: 8)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: ShimmerBox(height: 64, radius: 8)),
              const SizedBox(width: 12),
              Expanded(child: ShimmerBox(height: 64, radius: 8)),
            ],
          ),
          const SizedBox(height: 20),
          ShimmerBox(height: 120, width: double.infinity, radius: 8),
        ],
      ),
    );
  }
}

// ─── Semi-donut chart ─────────────────────────────────────────────────────────

class _SemiDonut extends StatelessWidget {
  final int    completed;
  final int    total;
  final double completedDeg;
  final double remainingDeg;

  const _SemiDonut({
    required this.completed,
    required this.total,
    required this.completedDeg,
    required this.remainingDeg,
  });

  @override
  Widget build(BuildContext context) {
    final completedPct = total > 0 ? (completed / total * 100).round() : 0;
    final remainingPct = 100 - completedPct;

    return LayoutBuilder(
      builder: (_, constraints) {
        final w = constraints.maxWidth;
        return Stack(
          children: [
            ClipRect(
              child: Align(
                alignment:    .topCenter,
                heightFactor: 0.53,
                child: SizedBox(
                  width:  w,
                  height: w,
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: 180,
                      sectionsSpace:     0,
                      centerSpaceRadius: w * 0.30,
                      sections: [
                        PieChartSectionData(value: completedDeg, color: const Color(0xFF5C6BC0), showTitle: false, radius: w * 0.12),
                        PieChartSectionData(value: remainingDeg, color: const Color(0xFFB3BAE8), showTitle: false, radius: w * 0.12),
                        PieChartSectionData(value: 180,          color: Colors.transparent,      showTitle: false, radius: w * 0.12),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, right: 0, bottom: 10,
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(AppConstants.progress, style: context.labelSmall.copyWith(color: context.textSecondary)),
                  const SizedBox(height: 2),
                  Text('$completed / $total', style: context.titleMedium.copyWith(fontWeight: .w700)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      _LegendItem(color: const Color(0xFF5C6BC0), label: AppConstants.completedLabel, pct: '$completedPct %'),
                      const SizedBox(width: 24),
                      _LegendItem(color: const Color(0xFFB3BAE8), label: AppConstants.remainingLabel,  pct: '$remainingPct %'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Legend item ──────────────────────────────────────────────────────────────

class _LegendItem extends StatelessWidget {
  final Color  color;
  final String label;
  final String pct;

  const _LegendItem({required this.color, required this.label, required this.pct});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(width: 7, height: 7, decoration: BoxDecoration(shape: .circle, color: color)),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: .start,
          mainAxisSize:       .min,
          children: [
            Text(label, style: context.labelSmall.copyWith(color: context.textSecondary, fontSize: 9.5)),
            Text(pct,   style: context.labelSmall.copyWith(fontWeight: .w700, fontSize: 11)),
          ],
        ),
      ],
    );
  }
}

// ─── Stat box ─────────────────────────────────────────────────────────────────

class _StatBox extends StatelessWidget {
  final String   label;
  final String   value;
  final IconData icon;
  final Color    color;

  const _StatBox({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .stretch,
      children: [
        Container(width: 4, color: color),
        Expanded(
          child: Padding(
            padding: .symmetric(horizontal: 10, vertical: 9),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Container(
                  width: 30, height: 30,
                  decoration: BoxDecoration(
                    borderRadius: .circular(8),
                    color:        color.withValues(alpha: 0.10),
                  ),
                  child: Icon(icon, color: color, size: 16),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment:  .center,
                    children: [
                      Text(value, style: context.bodyMedium.copyWith(fontWeight: .w700, color: context.textPrimary, fontSize: 13, height: 1)),
                      const SizedBox(height: 3),
                      Text(label, style: context.labelSmall.copyWith(color: context.textSecondary, fontSize: 10, height: 1.1), maxLines: 1, overflow: .ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
