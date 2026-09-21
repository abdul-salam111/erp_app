import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../admin_dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import '../../../dashboard/domain/entities/sale_order_summary_entity.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

class SaleOrdersSection extends StatefulWidget {
  const SaleOrdersSection({super.key});

  @override
  State<SaleOrdersSection> createState() => _SaleOrdersSectionState();
}

class _SaleOrdersSectionState extends State<SaleOrdersSection>
    with SingleTickerProviderStateMixin {
  late DateTime _fromDate;
  late DateTime _toDate;
  bool _showDetails = false;

  late final AnimationController _chartCtrl;
  late final Animation<double> _chartAnim;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<AdminDashboardBloc>();
    _fromDate = bloc.state.saleOrderFromDate;
    _toDate = bloc.state.saleOrderToDate;
    _chartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _chartAnim = CurvedAnimation(
      parent: _chartCtrl,
      curve: Curves.easeOutCubic,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _chartCtrl.forward();
    });
  }

  @override
  void dispose() {
    _chartCtrl.dispose();
    super.dispose();
  }

  Future<void> _openDateRangePopup() async {
    final result = await showDialog<_DateRange>(
      context: context,
      builder: (_) => _DateRangePickerDialog(from: _fromDate, to: _toDate),
    );
    if (result == null || !mounted) return;
    setState(() {
      _fromDate = result.from;
      _toDate = result.to;
    });
    context.read<AdminDashboardBloc>().add(
      SaleOrderDateRangeChanged(fromDate: _fromDate, toDate: _toDate),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDashboardBloc, AdminDashboardState>(
      listenWhen: (p, c) =>
          p.saleOrderSummaryStatus != ApiStatus.SUCCESS &&
          c.saleOrderSummaryStatus == ApiStatus.SUCCESS,
      listener: (_, __) => _chartCtrl.forward(from: 0),
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

        return GlassSurface(
          radius: 16,
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
                        color: context.navyIconBg,
                        borderRadius: .circular(8),
                      ),
                      child: Icon(
                        Iconsax.truck,
                        color: context.navyIconColor,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      AppConstants.saleOrders,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: context.isDark
                          ? GlassIconButton(
                              onPressed: _openDateRangePopup,
                              size: 32,
                              iconSize: 16,
                              shape: GlassIconButtonShape.roundedSquare,
                              borderRadius: 8,
                              icon: Icon(
                                Iconsax.calendar_1,
                                size: 16,
                                color: context.accentBlue,
                              ),
                            )
                          : GestureDetector(
                              onTap: _openDateRangePopup,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: context.accentBlue.withValues(alpha: 0.10),
                                  borderRadius: .circular(8),
                                  border: Border.all(
                                    color: context.accentBlue.withValues(alpha: 0.25),
                                  ),
                                ),
                                child: Icon(
                                  Iconsax.calendar_1,
                                  size: 16,
                                  color: context.accentBlue,
                                ),
                              ),
                            ),
                    ),
                    context.isDark
                        ? GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () =>
                                setState(() => _showDetails = !_showDetails),
                            child: GlassContainer(
                              shape: const LiquidRoundedSuperellipse(
                                borderRadius: 8,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                child: Text(
                                  _showDetails
                                      ? AppConstants.hideDetails
                                      : AppConstants.showDetails,
                                  style: context.labelSmall.copyWith(
                                    color: context.accentBlue,
                                    fontWeight: .w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () =>
                                setState(() => _showDetails = !_showDetails),
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
                                  color: context.textPrimary,
                                  fontWeight: .w600,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1, color: context.navyBorder),

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
                                      color: AppColors.accentBlue,
                                    ),
                                  ),
                                  VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: context.navyBorder,
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
                              color: context.navyBorder,
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
                                    color: context.navyBorder,
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
                              color: context.navyBorder,
                            ),
                            // ── Semi-donut chart ─────────────────────
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: AnimatedBuilder(
                                animation: _chartAnim,
                                builder: (context, _) {
                                  final p = _chartAnim.value;
                                  return _SemiDonut(
                                    completed: completed,
                                    total: total,
                                    completedDeg: completedDeg * p,
                                    remainingDeg: 180.0 - completedDeg * p,
                                  );
                                },
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
          color: context.isDark ? AppColors.navyIconBgDark : context.surface,
          borderRadius: .circular(8),
          border: Border.all(color: context.navyBorder),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 14, color: context.accentBlue),
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
                  date.format('dd-MMM-yyyy'),
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

// ─── Date range popup ─────────────────────────────────────────────────────────

class _DateRange {
  final DateTime from;
  final DateTime to;
  const _DateRange(this.from, this.to);
}

class _DateRangePickerDialog extends StatefulWidget {
  final DateTime from;
  final DateTime to;
  const _DateRangePickerDialog({required this.from, required this.to});

  @override
  State<_DateRangePickerDialog> createState() => _DateRangePickerDialogState();
}

class _DateRangePickerDialogState extends State<_DateRangePickerDialog> {
  late DateTime _from;
  late DateTime _to;

  @override
  void initState() {
    super.initState();
    _from = widget.from;
    _to = widget.to;
  }

  Future<void> _pickFrom() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _from,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _from = picked;
      if (_to.isBefore(_from)) _to = _from;
    });
  }

  Future<void> _pickTo() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _to,
      firstDate: _from,
      lastDate: DateTime(2100),
    );
    if (picked == null || !mounted) return;
    setState(() => _to = picked);
  }

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: .all(20),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Container(
                padding: .all(7),
                decoration: BoxDecoration(
                  color: context.navyIconBg,
                  borderRadius: .circular(8),
                ),
                child: Icon(
                  Iconsax.calendar_1,
                  color: context.navyIconColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                AppConstants.dateLabel,
                style: context.titleSmall.copyWith(fontWeight: .w700),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _DateButton(
            label: AppConstants.fromLabel,
            date: _from,
            onTap: _pickFrom,
          ),
          const SizedBox(height: 10),
          _DateButton(
            label: AppConstants.toLabel,
            date: _to,
            onTap: _pickTo,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: .end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  AppConstants.cancelBtn,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontWeight: .w600,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              context.isDark
                  ? GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () =>
                          Navigator.pop(context, _DateRange(_from, _to)),
                      child: GlassContainer(
                        shape: const LiquidRoundedSuperellipse(borderRadius: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            AppConstants.applyBtn,
                            style: context.labelSmall.copyWith(
                              color: context.accentBlue,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () =>
                          Navigator.pop(context, _DateRange(_from, _to)),
                      child: Container(
                        padding: .symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.primary,
                          borderRadius: .circular(8),
                        ),
                        child: Text(
                          AppConstants.applyBtn,
                          style: context.labelSmall.copyWith(
                            color: context.textPrimary,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );

    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: context.isDark
          ? GlassContainer(
              shape: const LiquidRoundedSuperellipse(borderRadius: 16),
              child: content,
            )
          : Material(
              color: context.navyCard,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: .antiAlias,
              child: content,
            ),
    );
  }
}

// ─── Orders table ─────────────────────────────────────────────────────────────

class _OrdersTable extends StatelessWidget {
  final List<SaleOrderRow> orders;
  const _OrdersTable({super.key, required this.orders});

  static const _cols = [
    AppConstants.partyBtn,
    AppConstants.dateLabel,
    AppConstants.productLabel,
    AppConstants.status,
  ];
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
            AppConstants.noOrdersInThisPeriod,
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
          color: context.isDark ? AppColors.navyIconBgDark : context.surface,
          child: Row(
            children: [
              ...List.generate(
                _cols.length,
                (i) => _Cell(
                  flex: _flex[i],
                  isHeader: true,
                  child: Text(
                    _cols[i],
                    textAlign: i == 3 ? .center : .start,
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
        Divider(height: 1, thickness: 1, color: context.navyBorder),
        // ── Rows ─────────────────────────────────────────
        ...orders.asMap().entries.map((e) {
          final i = e.key;
          final row = e.value;
          return Material(
            color: context.isDark
                ? (i.isOdd ? AppColors.navyIconBgDark : context.navyCard)
                : (i.isOdd ? context.tableRowAlt : context.surfaceElevated),
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
        ? (context.isDark ? AppColors.successLight : AppColors.greenDark)
        : lower.contains('partial') || lower.contains('progress')
        ? AppColors.orange
        : (context.isDark ? AppColors.grey300 : AppColors.blueGreyDark);
    final progressFraction = (row.progress.clamp(0, 100)) / 100.0;

    return Container(
      decoration: BoxDecoration(
        color: context.navyCard,
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
                color: context.navyBorder,
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
                  color: context.navyIconBg,
                  borderRadius: .circular(10),
                ),
                child: Icon(
                  Iconsax.truck,
                  color: context.navyIconColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      AppConstants.orderDetails,
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
          Divider(height: 1, thickness: 1, color: context.navyBorder),
          const SizedBox(height: 12),

          // ── Detail rows ──────────────────────────────────
          _DetailRow(
            label: AppConstants.partyBtn,
            value: row.party.isEmpty ? '-' : row.party,
          ),
          _DetailRow(
            label: AppConstants.orderLabel,
            value: row.docNbr.isEmpty ? '-' : row.docNbr,
          ),
          _DetailRow(
            label: AppConstants.dateLabel,
            value: row.docDate != null
                ? row.docDate!.format(AppConstants.ddMMMYyyyLabel)
                : '-',
          ),
          _DetailRow(
            label: AppConstants.productLabel,
            value: row.item.isEmpty ? '-' : row.item,
          ),
          _DetailRow(label: AppConstants.totalQtyLabel, value: '${row.ttlQty}'),
          _DetailRow(
            label: AppConstants.remainingLabel,
            value: '${row.ttlRemainingQty}',
          ),
          const SizedBox(height: 16),

          // ── Progress bar ─────────────────────────────────
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                AppConstants.progress,
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
              backgroundColor: context.isDark
                  ? AppColors.white.withValues(alpha: 0.08)
                  : statusColor.withValues(alpha: 0.12),
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
    final isDark = context.isDark;
    final (bg, fg) = lower.contains('complet')
        ? (
            isDark
                ? AppColors.navyIconBgDark
                : AppColors.greenDark.withValues(alpha: 0.12),
            isDark ? AppColors.successLight : AppColors.greenDark,
          )
        : lower.contains('partial') || lower.contains('progress')
        ? (
            isDark
                ? AppColors.navyIconBgDark
                : AppColors.orange.withValues(alpha: 0.12),
            AppColors.orange,
          )
        : (
            isDark
                ? AppColors.navyIconBgDark
                : AppColors.blueGreyDark.withValues(alpha: 0.10),
            isDark ? AppColors.grey300 : AppColors.blueGreyDark,
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
      width: double.infinity,
      padding: .symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: .circular(4)),
      child: Text(
        status.isEmpty ? '-' : status,
        textAlign: .center,
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
                    color: context.isDark
                        ? AppColors.navyIconBgDark
                        : color.withValues(alpha: 0.10),
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
