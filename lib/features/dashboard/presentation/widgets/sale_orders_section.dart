import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_utils.dart';
import '../bloc/dashboard_bloc.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

class SaleOrdersSection extends StatelessWidget {
  const SaleOrdersSection({super.key});

  static const _filters = ['Jan - Mar', 'In-complete only', 'Completed only', 'All'];

  static const int _totalOrders = 16;
  static const int _completed   = 8;
  static const int _partial     = 2;
  static const int _notStarted  = 6;

  // Semicircle: completed + remaining must sum to 180 (the visible half)
  static double get _completedDeg => (_completed / _totalOrders) * 180;
  static double get _remainingDeg => 180 - _completedDeg;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (prev, curr) =>
          prev.saleOrderFilterIndex != curr.saleOrderFilterIndex,
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
                      'Sale Orders',
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: .symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color:        context.primary,
                          borderRadius: .circular(8),
                        ),
                        child: Text(
                          'Report',
                          style: context.labelSmall.copyWith(
                            color:      Colors.white,
                            fontWeight: .w600,
                          ),
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
                      Icon(
                        Icons.filter_list_rounded,
                        size:  18,
                        color: context.textSecondary,
                      ),
                    ],
                  ),
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              // ── Stats grid (2×2) ─────────────────────────────────
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(child: _StatBox(label: 'Total Orders', value: '$_totalOrders', icon: Iconsax.bag_2,       color: const Color(0xFF1B84FF))),
                    VerticalDivider(width: 1, thickness: 1, color: context.border),
                    Expanded(child: _StatBox(label: 'Completed',    value: '$_completed',   icon: Iconsax.tick_circle, color: const Color(0xFF43A047))),
                  ],
                ),
              ),
              Divider(height: 1, thickness: 1, color: context.border),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(child: _StatBox(label: 'Partial in Progress', value: '$_partial',    icon: Iconsax.note_2, color: const Color(0xFFFF9800))),
                    VerticalDivider(width: 1, thickness: 1, color: context.border),
                    Expanded(child: _StatBox(label: 'Not Started',         value: '$_notStarted', icon: Iconsax.clock,  color: const Color(0xFF37474F))),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              // ── Chart solo ───────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: _SemiDonut(
                  completed:    _completed,
                  total:        _totalOrders,
                  completedDeg: _completedDeg,
                  remainingDeg: _remainingDeg,
                ),
              ),
            ],
          ),
        );
      },
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
            // Arc — full-width, clipped to the top half only
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
                        PieChartSectionData(
                          value:     completedDeg,
                          color:     const Color(0xFF5C6BC0),
                          showTitle: false,
                          radius:    w * 0.12,
                        ),
                        PieChartSectionData(
                          value:     remainingDeg,
                          color:     const Color(0xFFB3BAE8),
                          showTitle: false,
                          radius:    w * 0.12,
                        ),
                        PieChartSectionData(
                          value:     180,
                          color:     Colors.transparent,
                          showTitle: false,
                          radius:    w * 0.12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Text + legend overlaid inside the donut hole
            Positioned(
              left:   0,
              right:  0,
              bottom: 10,
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    'Progress',
                    style: context.labelSmall.copyWith(color: context.textSecondary),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$completed / $total',
                    style: context.titleMedium.copyWith(fontWeight: .w700),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      _LegendItem(
                        color: const Color(0xFF5C6BC0),
                        label: 'Completed',
                        pct:   '$completedPct %',
                      ),
                      const SizedBox(width: 24),
                      _LegendItem(
                        color: const Color(0xFFB3BAE8),
                        label: 'Remaining',
                        pct:   '$remainingPct %',
                      ),
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

  const _LegendItem({
    required this.color,
    required this.label,
    required this.pct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          width:  7,
          height: 7,
          decoration: BoxDecoration(shape: .circle, color: color),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: .start,
          mainAxisSize:       .min,
          children: [
            Text(
              label,
              style: context.labelSmall.copyWith(
                color:    context.textSecondary,
                fontSize: 9.5,
              ),
            ),
            Text(
              pct,
              style: context.labelSmall.copyWith(
                fontWeight: .w700,
                fontSize:   11,
              ),
            ),
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

  const _StatBox({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .stretch,
      children: [
        // Accent bar — same as Today's Overview
        Container(width: 4, color: color),
        Expanded(
          child: Padding(
            padding: .symmetric(horizontal: 10, vertical: 9),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Container(
                  width:  30,
                  height: 30,
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
                      Text(
                        value,
                        style: context.bodyMedium.copyWith(
                          fontWeight: .w700,
                          color:      context.textPrimary,
                          fontSize:   13,
                          height:     1,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        label,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
