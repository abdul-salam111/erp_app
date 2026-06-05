import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../dashboard/blocs/dashboard_bloc.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import '../../../dashboard/domain/entities/sale_order_summary_entity.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

class SaleOrdersSection extends StatefulWidget {
  const SaleOrdersSection({super.key});

  @override
  State<SaleOrdersSection> createState() => _SaleOrdersSectionState();
}

class _SaleOrdersSectionState extends State<SaleOrdersSection> {
  late DateTime _fromDate;
  late DateTime _toDate;
  bool _showDetails = false;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<DashboardBloc>();
    _fromDate = bloc.state.saleOrderFromDate;
    _toDate = bloc.state.saleOrderToDate;
  }

  Future<void> _pickFrom() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null || !mounted) return;
    final newTo = picked.addMonths(1);
    setState(() {
      _fromDate = picked;
      _toDate = newTo;
    });
    context.read<DashboardBloc>().add(
      SaleOrderDateRangeChanged(fromDate: _fromDate, toDate: _toDate),
    );
  }

  Future<void> _pickTo() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _toDate,
      firstDate: _fromDate.addMonths(1),
      lastDate: DateTime(2100),
    );
    if (picked == null || !mounted) return;
    setState(() => _toDate = picked);
    context.read<DashboardBloc>().add(
      SaleOrderDateRangeChanged(fromDate: _fromDate, toDate: _toDate),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (p, c) =>
          p.saleOrderSummaryStatus != c.saleOrderSummaryStatus ||
          p.saleOrderSummary != c.saleOrderSummary,
      builder: (context, state) {
        final isLoading =
            state.saleOrderSummaryStatus == ApiStatus.INITIAL ||
            state.saleOrderSummaryStatus == ApiStatus.LOADING;

        final summary = state.saleOrderSummary;
        final total = summary?.ttlOrders ?? 0;
        final completed = summary?.ttlCompletedOrders ?? 0;
        final partial = summary?.ttlPartialOrders ?? 0;
        final notStarted = summary?.ttlNotStartedOrders ?? 0;
        final completedDeg = total > 0 ? (completed / total) * 180.0 : 0.0;
        final remainingDeg = 180.0 - completedDeg;

        return Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(16),
            border: Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.06),
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
                padding: const EdgeInsets.fromLTRB(14, 13, 12, 12),
                child: Row(
                  children: [
                    Container(
                      padding: .all(7),
                      decoration: BoxDecoration(
                        color: context.primary.withValues(alpha: 0.10),
                        borderRadius: .circular(8),
                      ),
                      child: Icon(
                        Iconsax.truck,
                        color: context.primary,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      AppConstants.saleOrders,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => setState(() => _showDetails = !_showDetails),
                      child: Container(
                        padding: .symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: context.primary,
                          borderRadius: .circular(8),
                        ),
                        child: Text(
                          _showDetails
                              ? AppConstants.hideDetails
                              : AppConstants.showDetails,
                          style: context.labelSmall.copyWith(
                            color: AppColors.white,
                            fontWeight: .w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Date range row ───────────────────────────────────
              Padding(
                padding: .fromLTRB(12, 0, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: _DateButton(
                        label: 'From',
                        date: _fromDate,
                        onTap: _pickFrom,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _DateButton(
                        label: 'To',
                        date: _toDate,
                        onTap: _pickTo,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.border),

              if (isLoading)
                _SaleOrderShimmer()
              else
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 420),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.06),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: _showDetails
                      ? _OrdersTable(
                          key: const ValueKey('table'),
                          orders: summary?.orders ?? const [],
                        )
                      : Column(
                          key: const ValueKey('stats'),
                          children: [
                            // ── Stats grid (2×2) ─────────────────────
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _StatBox(
                                      label: AppConstants.totalOrdersLabel,
                                      value: '$total',
                                      icon: Iconsax.bag_2,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: context.border,
                                  ),
                                  Expanded(
                                    child: _StatBox(
                                      label: AppConstants.completedLabel,
                                      value: '$completed',
                                      icon: Iconsax.tick_circle,
                                      color: AppColors.greenDark,
                                    ),
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
                                    child: _StatBox(
                                      label:
                                          AppConstants.partialInProgressLabel,
                                      value: '$partial',
                                      icon: Iconsax.note_2,
                                      color: AppColors.orange,
                                    ),
                                  ),
                                  VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: context.border,
                                  ),
                                  Expanded(
                                    child: _StatBox(
                                      label: AppConstants.notStartedLabel,
                                      value: '$notStarted',
                                      icon: Iconsax.clock,
                                      color: AppColors.blueGreyDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: context.border,
                            ),
                            // ── Semi-donut chart ─────────────────────
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: _SemiDonut(
                                completed: completed,
                                total: total,
                                completedDeg: completedDeg,
                                remainingDeg: remainingDeg,
                              ),
                            ),
                          ],
                        ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Date button ──────────────────────────────────────────────────────────────

class _DateButton extends StatelessWidget {
  final String label;
  final DateTime date;
  final VoidCallback onTap;

  const _DateButton({
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: .circular(8),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 14, color: context.primary),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  label,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 9,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date.format('dd/MM/yyyy'),
                  style: context.labelSmall.copyWith(
                    fontWeight: .w600,
                    fontSize: 11,
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Orders table ─────────────────────────────────────────────────────────────

class _OrdersTable extends StatelessWidget {
  final List<SaleOrderRow> orders;
  const _OrdersTable({super.key, required this.orders});

  static const _cols = ['Party', 'Date', 'Product', 'Status'];
  static const _flex = [2, 2, 2, 2];

  void _showOrderDetail(BuildContext context, SaleOrderRow row) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => _OrderDetailSheet(row: row),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            'No orders in this period',
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: .start,
      children: [
        // ── Header ──────────────────────────────────────
        Container(
          color: context.grey50,
          child: Row(
            children: [
              ...List.generate(
                _cols.length,
                (i) => _Cell(
                  flex: _flex[i],
                  isHeader: true,
                  child: Text(
                    _cols[i],
                    style: context.labelSmall.copyWith(
                      fontWeight: .w700,
                      fontSize: 10,
                      color: context.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 36),
            ],
          ),
        ),
        // ── Rows ─────────────────────────────────────────
        ...orders.asMap().entries.map((e) {
          final i = e.key;
          final row = e.value;
          return Material(
            color: i.isOdd ? AppColors.tableRowAlt : AppColors.white,
            child: InkWell(
              onTap: () => _showOrderDetail(context, row),
              child: Row(
                crossAxisAlignment: .center,
                children: [
                  _Cell(
                    flex: _flex[0],
                    child: Text(
                      row.party.isEmpty ? '-' : row.party,
                      style: context.labelSmall.copyWith(
                        fontSize: 11,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                  ),
                  _Cell(
                    flex: _flex[1],
                    child: Text(
                      row.docDate != null
                          ? row.docDate!.format('dd/MM/yy')
                          : '-',
                      style: context.labelSmall.copyWith(fontSize: 11),
                    ),
                  ),
                  _Cell(
                    flex: _flex[2],
                    child: Text(
                      row.item.isEmpty ? '-' : row.item,
                      style: context.labelSmall.copyWith(fontSize: 11),
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                  ),
                  _Cell(
                    flex: _flex[3],
                    child: _StatusBadge(status: row.status),
                  ),
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: Icon(
                        Icons.chevron_right_rounded,
                        size: 18,
                        color: context.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 8),
      ],
    );
  }
}

// ─── Order detail sheet ───────────────────────────────────────────────────────

class _OrderDetailSheet extends StatelessWidget {
  final SaleOrderRow row;
  const _OrderDetailSheet({required this.row});

  @override
  Widget build(BuildContext context) {
    final lower = row.status.toLowerCase();
    final statusColor = lower.contains('complet')
        ? AppColors.greenDark
        : lower.contains('partial') || lower.contains('progress')
        ? AppColors.orange
        : AppColors.blueGreyDark;
    final progressFraction = (row.progress.clamp(0, 100)) / 100.0;

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const .vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.viewInsetsOf(context).bottom + 28,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.border,
                borderRadius: .circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // ── Title row ────────────────────────────────────
          Row(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: .all(9),
                decoration: BoxDecoration(
                  color: context.primary.withValues(alpha: 0.10),
                  borderRadius: .circular(10),
                ),
                child: Icon(Iconsax.truck, color: context.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      'Order Details',
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      row.docNbr.isEmpty ? '-' : row.docNbr,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(status: row.status, large: true),
            ],
          ),
          const SizedBox(height: 16),
          Divider(height: 1, thickness: 1, color: context.border),
          const SizedBox(height: 12),

          // ── Detail rows ──────────────────────────────────
          _DetailRow(
            label: 'Party',
            value: row.party.isEmpty ? '-' : row.party,
          ),
          _DetailRow(
            label: 'Order #',
            value: row.docNbr.isEmpty ? '-' : row.docNbr,
          ),
          _DetailRow(
            label: 'Date',
            value: row.docDate != null
                ? row.docDate!.format('dd MMM yyyy')
                : '-',
          ),
          _DetailRow(
            label: 'Product',
            value: row.item.isEmpty ? '-' : row.item,
          ),
          _DetailRow(label: 'Total Qty', value: '${row.ttlQty}'),
          _DetailRow(label: 'Remaining', value: '${row.ttlRemainingQty}'),
          const SizedBox(height: 16),

          // ── Progress bar ─────────────────────────────────
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Progress',
                style: context.labelSmall.copyWith(
                  color: context.textSecondary,
                  fontWeight: .w600,
                ),
              ),
              Text(
                '${row.progress}%',
                style: context.labelSmall.copyWith(
                  fontWeight: .w700,
                  color: statusColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: .circular(6),
            child: LinearProgressIndicator(
              value: progressFraction,
              minHeight: 10,
              backgroundColor: statusColor.withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 11,
                fontWeight: .w500,
              ),
            ),
          ),
          Text(
            ' : ',
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 11,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: context.bodySmall.copyWith(
                fontWeight: .w700,
                color: context.textPrimary,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final int flex;
  final Widget child;
  final bool isHeader;
  const _Cell({required this.flex, required this.child, this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: isHeader ? 8 : 10,
        ),
        child: child,
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final bool large;
  const _StatusBadge({required this.status, this.large = false});

  @override
  Widget build(BuildContext context) {
    final lower = status.toLowerCase();
    final (bg, fg) = lower.contains('complet')
        ? (
            AppColors.greenDark.withValues(alpha: 0.12),
            AppColors.greenDark,
          )
        : lower.contains('partial') || lower.contains('progress')
        ? (
            AppColors.orange.withValues(alpha: 0.12),
            AppColors.orange,
          )
        : (
            AppColors.blueGreyDark.withValues(alpha: 0.10),
            AppColors.blueGreyDark,
          );

    if (large) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: .circular(8),
          border: Border.all(color: fg.withValues(alpha: 0.35), width: 1),
        ),
        child: Text(
          status.isEmpty ? '-' : status,
          style: context.labelSmall.copyWith(
            color: fg,
            fontSize: 12,
            fontWeight: .w700,
            letterSpacing: 0.3,
          ),
          maxLines: 1,
          overflow: .ellipsis,
        ),
      );
    }

    return Container(
      padding: .symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: .circular(4)),
      child: Text(
        status.isEmpty ? '-' : status,
        style: context.labelSmall.copyWith(
          color: fg,
          fontSize: 9.5,
          fontWeight: .w600,
        ),
        maxLines: 2,
        overflow: .ellipsis,
      ),
    );
  }
}

// ─── Shimmer skeleton ─────────────────────────────────────────────────────────

class _SaleOrderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(16),
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
  final int completed;
  final int total;
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
                alignment: .topCenter,
                heightFactor: 0.53,
                child: SizedBox(
                  width: w,
                  height: w,
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: 180,
                      sectionsSpace: 0,
                      centerSpaceRadius: w * 0.30,
                      sections: [
                        PieChartSectionData(
                          value: completedDeg,
                          color: AppColors.indigo,
                          showTitle: false,
                          radius: w * 0.12,
                        ),
                        PieChartSectionData(
                          value: remainingDeg,
                          color: AppColors.indigoLight,
                          showTitle: false,
                          radius: w * 0.12,
                        ),
                        PieChartSectionData(
                          value: 180,
                          color: AppColors.transparent,
                          showTitle: false,
                          radius: w * 0.12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    AppConstants.progress,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                    ),
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
                        color: AppColors.indigo,
                        label: AppConstants.completedLabel,
                        pct: '$completedPct %',
                      ),
                      const SizedBox(width: 24),
                      _LegendItem(
                        color: AppColors.indigoLight,
                        label: AppConstants.remainingLabel,
                        pct: '$remainingPct %',
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
  final Color color;
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
          width: 7,
          height: 7,
          decoration: BoxDecoration(shape: .circle, color: color),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 9.5,
              ),
            ),
            Text(
              pct,
              style: context.labelSmall.copyWith(
                fontWeight: .w700,
                fontSize: 11,
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
  final String label;
  final String value;
  final IconData icon;
  final Color color;

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
        Container(width: 4, color: color),
        Expanded(
          child: Padding(
            padding: .symmetric(horizontal: 10, vertical: 9),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: .circular(8),
                    color: color.withValues(alpha: 0.10),
                  ),
                  child: Icon(icon, color: color, size: 16),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        value,
                        style: context.bodyMedium.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                          fontSize: 13,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        label,
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 10,
                          height: 1.1,
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
