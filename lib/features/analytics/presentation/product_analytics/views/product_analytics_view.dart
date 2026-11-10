import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class ProductAnalyticsView extends StatefulWidget {
  const ProductAnalyticsView({super.key});

  @override
  State<ProductAnalyticsView> createState() => _ProductAnalyticsViewState();
}

class _ProductAnalyticsViewState extends State<ProductAnalyticsView> {
  late DateTime _fromDate;
  late DateTime _toDate;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = DateTime(_toDate.year, _toDate.month - 6, _toDate.day);
  }

  Future<void> _pickFrom() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2000),
      lastDate: _toDate,
    );
    if (picked == null || !mounted) return;
    setState(() => _fromDate = picked);
  }

  Future<void> _pickTo() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _toDate,
      firstDate: _fromDate,
      lastDate: DateTime(2100),
    );
    if (picked == null || !mounted) return;
    setState(() => _toDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Product Analytics'),
      body: SingleChildScrollView(
        padding: context.pagePadding,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            _DateRangeFilter(
              from: _fromDate,
              to: _toDate,
              onFromTap: _pickFrom,
              onToTap: _pickTo,
            ),
            heightBox(context.gridSpacing * 2),
            const _StatsGrid(),
            heightBox(context.gridSpacing * 2),
            const _ScrollReveal(
              placeholderHeight: 260,
              child: _ConcentrationCard(
                title: 'Sales concentration',
                icon: Iconsax.chart_21,
                centerValue: '194.68M',
                centerLabel: 'Sales',
                rows: _salesConcentration,
                sideBySide: true,
              ),
            ),
            heightBox(context.gridSpacing * 2),
            const _ScrollReveal(
              placeholderHeight: 260,
              child: _ConcentrationCard(
                title: 'Profit concentration',
                icon: Iconsax.money_recive,
                centerValue: '24.19M',
                centerLabel: 'Profit',
                rows: _profitConcentration,
                sideBySide: true,
              ),
            ),
            heightBox(context.gridSpacing * 2),
            const _ScrollReveal(
              placeholderHeight: 260,
              child: _BreakdownCard(
                title: 'XYZ Analysis (By Demand Variability)',
                icon: Iconsax.category,
                columnLabel: 'Segment',
                rows: _xyzSegments,
                sideBySide: true,
              ),
            ),
            heightBox(context.gridSpacing * 2),
            const _TopProductsCard(),
            heightBox(context.gridSpacing * 2),
            const _ScrollReveal(
              placeholderHeight: 280,
              child: _BreakdownCard(
                title: 'Product Lifecycle',
                icon: Iconsax.hierarchy,
                columnLabel: 'Stage',
                rows: _lifecycleStages,
                sideBySide: true,
              ),
            ),
            heightBox(context.gridSpacing * 2),
            const _GrossProfitByProductCard(),
            heightBox(context.gridSpacing * 2),
            const _StockAtRiskCard(),
            heightBox(40),
          ],
        ),
      ),
    );
  }
}

// ─── Date range filter ──────────────────────────────────────────────────────

class _DateRangeFilter extends StatelessWidget {
  final DateTime from;
  final DateTime to;
  final VoidCallback onFromTap;
  final VoidCallback onToTap;

  const _DateRangeFilter({
    required this.from,
    required this.to,
    required this.onFromTap,
    required this.onToTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.accentBlue.withValues(
          alpha: context.isDark ? 0.12 : 0.07,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: context.accentBlue.withValues(
            alpha: context.isDark ? 0.3 : 0.22,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: _DateField(label: 'From', date: from, onTap: onFromTap),
          ),
          Container(
            width: 1,
            height: 30,
            color: context.accentBlue.withValues(
              alpha: context.isDark ? 0.3 : 0.2,
            ),
          ),
          Expanded(
            child: _DateField(label: 'To', date: to, onTap: onToTap),
          ),
        ],
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime date;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 16, color: context.accentBlue),
            widthBox(8),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    label,
                    style: context.labelSmall.copyWith(
                      color: context.accentBlue,
                      fontWeight: .w600,
                      fontSize: 11,
                      height: 1,
                    ),
                  ),
                  heightBox(3),
                  Text(
                    date.format('dd-MMM-yyyy'),
                    style: context.labelSmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w700,
                      fontSize: 13,
                      height: 1,
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
    );
  }
}

// ─── Stat cards (dummy data) ────────────────────────────────────────────────

enum _StatFormat { currency, count, percent }

class _StatMeta {
  final String label;
  final double value;
  final _StatFormat format;
  final double? deltaPct;
  final IconData icon;
  final Color color;

  const _StatMeta({
    required this.label,
    required this.value,
    required this.format,
    required this.deltaPct,
    required this.icon,
    required this.color,
  });

  String get display => switch (format) {
    _StatFormat.currency => 'Rs ${value.toCompact(decimals: 1)}',
    _StatFormat.count => value.toCompact(decimals: 1),
    _StatFormat.percent => '${value.toStringAsFixed(2)}%',
  };
}

// Item counts are short enough to sit three-up; the rupee figures below
// need the wider two-up cells.
const _countStats = <_StatMeta>[
  _StatMeta(
    label: 'Total Products',
    value: 24,
    format: .count,
    deltaPct: null,
    icon: Iconsax.box,
    color: AppColors.accentBlue,
  ),
  _StatMeta(
    label: 'Fast Moving Items',
    value: 0,
    format: .count,
    deltaPct: null,
    icon: Iconsax.flash_1,
    color: AppColors.yellow,
  ),
  _StatMeta(
    label: 'Slow Moving Items',
    value: 15,
    format: .count,
    deltaPct: null,
    icon: Iconsax.clock,
    color: AppColors.orange,
  ),
];

const _valueStats = <_StatMeta>[
  _StatMeta(
    label: 'Total Sales',
    value: 194675621,
    format: .currency,
    deltaPct: -79.37,
    icon: Iconsax.chart_success,
    color: AppColors.greenDark,
  ),
  _StatMeta(
    label: 'Gross Profit',
    value: -1591693,
    format: .currency,
    deltaPct: null,
    icon: Iconsax.trend_up,
    color: AppColors.teal,
  ),
  _StatMeta(
    label: 'Avg. Profit Margin',
    value: -1.42,
    format: .percent,
    deltaPct: null,
    icon: Iconsax.percentage_square,
    color: AppColors.deepPurple,
  ),
  _StatMeta(
    label: 'Dead Stock Value',
    value: 633701491,
    format: .currency,
    deltaPct: null,
    icon: Iconsax.warning_2,
    color: AppColors.errorBright,
  ),
];

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  static double _cardHeight(BuildContext context) =>
      Responsive.value<double>(context, phone: 78, tablet: 82, ipad: 86);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _grid(context, _countStats, columns: 3),
        heightBox(context.gridSpacing),
        _grid(context, _valueStats, columns: context.gridColumnCount),
      ],
    );
  }

  Widget _grid(
    BuildContext context,
    List<_StatMeta> stats, {
    required int columns,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: context.gridSpacing,
        crossAxisSpacing: context.gridSpacing,
        mainAxisExtent: _cardHeight(context),
      ),
      itemBuilder: (context, i) => _StatCard(meta: stats[i]),
    );
  }
}

class _StatCard extends StatelessWidget {
  final _StatMeta meta;

  const _StatCard({required this.meta});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.navyBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            crossAxisAlignment: .center,
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: meta.color.withValues(
                    alpha: context.isDark ? 0.22 : 0.12,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(meta.icon, color: meta.color, size: 12),
              ),
              widthBox(8),
              Expanded(
                child: Text(
                  meta.display,
                  style: context.bodyMedium.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                    fontSize: 16,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              if (meta.deltaPct != null) ...[
                widthBox(6),
                _DeltaBadge(pct: meta.deltaPct!),
              ],
            ],
          ),
          Text(
            meta.label,
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 13,
              height: 1.1,
            ),
            maxLines: 2,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }
}

class _DeltaBadge extends StatelessWidget {
  final double pct;

  const _DeltaBadge({required this.pct});

  @override
  Widget build(BuildContext context) {
    final isNegative = pct < 0;
    final color = isNegative ? context.error : context.success;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(
            isNegative
                ? Icons.arrow_downward_rounded
                : Icons.arrow_upward_rounded,
            size: 9,
            color: color,
          ),
          Text(
            '${pct.abs().round()}%',
            style: TextStyle(fontSize: 9, fontWeight: .w700, color: color),
          ),
        ],
      ),
    );
  }
}

// ─── Scroll reveal ──────────────────────────────────────────────────────────
//
// Charts play their draw-in animation once, on build, so a shimmer holds the
// slot until the card actually scrolls into view.

class _ScrollReveal extends StatefulWidget {
  final Widget child;
  final double placeholderHeight;

  const _ScrollReveal({required this.child, required this.placeholderHeight});

  @override
  State<_ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<_ScrollReveal> {
  final _key = GlobalKey();
  bool _revealed = false;
  ScrollPosition? _scrollPosition;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final position = Scrollable.maybeOf(context)?.position;
    if (position != _scrollPosition) {
      _scrollPosition?.removeListener(_check);
      _scrollPosition = position;
      _scrollPosition?.addListener(_check);
      WidgetsBinding.instance.addPostFrameCallback((_) => _check());
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_check);
    super.dispose();
  }

  void _check() {
    if (_revealed || !mounted) return;
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final top = box.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.sizeOf(context).height;
    if (top < screenHeight * 0.92) {
      setState(() => _revealed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOut,
        child: _revealed
            ? widget.child
            : ShimmerBox(radius: 14, height: widget.placeholderHeight),
      ),
    );
  }
}

// ─── Section card shell ─────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.navyBorder),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: context.navyIconBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: context.navyIconColor, size: 15),
              ),
              widthBox(8),
              Expanded(
                child: Text(
                  title,
                  style: context.titleSmall.copyWith(fontWeight: .w700),
                ),
              ),
            ],
          ),
          heightBox(14),
          child,
        ],
      ),
    );
  }
}

// ─── Donut ──────────────────────────────────────────────────────────────────

class _Donut extends StatelessWidget {
  final List<({Color color, double value})> slices;
  final String centerValue;
  final String centerLabel;

  const _Donut({
    required this.slices,
    required this.centerValue,
    required this.centerLabel,
    this.size = 180,
  });

  /// Square side of the chart. Ring thickness and the centre text scale with
  /// it, so a smaller donut stays proportionate when it sits beside a table.
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: .center,
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 3,
              centerSpaceRadius: size * 0.3,
              sections: [
                for (final s in slices)
                  PieChartSectionData(
                    value: s.value,
                    color: s.color,
                    radius: size * 0.167,
                    showTitle: false,
                  ),
              ],
              pieTouchData: PieTouchData(enabled: false),
            ),
          ),
          Column(
            mainAxisSize: .min,
            children: [
              Text(
                centerValue,
                style: context.titleMedium.copyWith(
                  color: context.textPrimary,
                  fontWeight: .w800,
                  fontSize: (size * 0.095).clamp(13, 20),
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
              Text(
                centerLabel,
                style: context.labelSmall.copyWith(
                  color: context.textSecondary,
                  fontSize: (size * 0.061).clamp(9, 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Sales / profit concentration (dummy data) ─────────────────────────────

class _ConcentrationRow {
  final String group;
  final String sales;
  final String profit;
  final int count;
  final double share;
  final Color color;

  const _ConcentrationRow({
    required this.group,
    required this.sales,
    required this.profit,
    required this.count,
    required this.share,
    required this.color,
  });
}

const _salesConcentration = <_ConcentrationRow>[
  _ConcentrationRow(
    group: 'High',
    sales: '157.22M',
    profit: '-1.20M',
    count: 6,
    share: 80.8,
    color: AppColors.accentBlue,
  ),
  _ConcentrationRow(
    group: 'Medium',
    sales: '30.79M',
    profit: '-1.74M',
    count: 5,
    share: 15.8,
    color: AppColors.greenDark,
  ),
  _ConcentrationRow(
    group: 'Low',
    sales: '6.67M',
    profit: '1.35M',
    count: 8,
    share: 3.4,
    color: AppColors.marigold,
  ),
];

const _profitConcentration = <_ConcentrationRow>[
  _ConcentrationRow(
    group: 'High',
    sales: '116.65M',
    profit: '19.57M',
    count: 3,
    share: 80.9,
    color: AppColors.accentBlue,
  ),
  _ConcentrationRow(
    group: 'Medium',
    sales: '22.83M',
    profit: '3.75M',
    count: 3,
    share: 15.5,
    color: AppColors.greenDark,
  ),
  _ConcentrationRow(
    group: 'Low',
    sales: '6.00M',
    profit: '867.3K',
    count: 3,
    share: 3.6,
    color: AppColors.marigold,
  ),
];

class _ConcentrationCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String centerValue;
  final String centerLabel;
  final List<_ConcentrationRow> rows;

  const _ConcentrationCard({
    required this.title,
    required this.icon,
    required this.centerValue,
    required this.centerLabel,
    required this.rows,
    this.sideBySide = false,
  });

  /// Sits the donut beside the table. Five columns plus a chart is a squeeze
  /// on a phone, so this layout drops the donut and the text down a size.
  final bool sideBySide;

  // Every column flexes, so the row always spans the full width instead of
  // the label cell hoarding the slack and leaving a gap before the numbers.
  static const _groupFlex = 6;
  static const _salesFlex = 6;
  static const _profitFlex = 5;
  static const _countFlex = 4;
  static const _shareFlex = 5;

  @override
  Widget build(BuildContext context) {
    final gap = sideBySide ? 4.0 : 6.0;
    final numberSize = sideBySide ? 10.0 : 11.0;

    final headerStyle = context.labelSmall.copyWith(
      color: context.textSecondary,
      fontSize: sideBySide ? 9 : 10.5,
      fontWeight: .w600,
    );

    Widget header(String text, int flex) => Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: .end,
        style: headerStyle,
        maxLines: 1,
        overflow: .ellipsis,
      ),
    );

    final table = Column(
      mainAxisSize: .min,
      children: [
        Row(
          children: [
            Expanded(
              flex: _groupFlex,
              child: Text('Group', style: headerStyle),
            ),
            header('Sales', _salesFlex),
            widthBox(gap),
            header('Profit', _profitFlex),
            widthBox(gap),
            header('Count', _countFlex),
            widthBox(gap),
            header('Share', _shareFlex),
          ],
        ),
        heightBox(8),
        Divider(height: 1, color: context.navyBorder),
        for (final r in rows) ...[
          heightBox(10),
          Row(
            children: [
              Expanded(
                flex: _groupFlex,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: r.color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    widthBox(sideBySide ? 5 : 8),
                    Expanded(
                      child: Text(
                        r.group,
                        style: context.bodySmall.copyWith(
                          color: context.textPrimary,
                          fontWeight: .w600,
                          fontSize: sideBySide ? 11.5 : null,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: _salesFlex,
                child: Text(
                  r.sales,
                  textAlign: .end,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: numberSize,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              widthBox(gap),
              Expanded(
                flex: _profitFlex,
                child: Text(
                  r.profit,
                  textAlign: .end,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: numberSize,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              widthBox(gap),
              Expanded(
                flex: _countFlex,
                child: Text(
                  '${r.count}',
                  textAlign: .end,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: numberSize,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              widthBox(gap),
              Expanded(
                flex: _shareFlex,
                child: Text(
                  '${r.share.toStringAsFixed(1)}%',
                  textAlign: .end,
                  style: context.bodySmall.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w700,
                    fontSize: sideBySide ? 11 : null,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
          if (r != rows.last) ...[
            heightBox(10),
            Divider(height: 1, color: context.navyBorder),
          ],
        ],
      ],
    );

    final donut = _Donut(
      slices: [for (final r in rows) (color: r.color, value: r.share)],
      centerValue: centerValue,
      centerLabel: centerLabel,
      size: sideBySide ? 112 : 180,
    );

    return _SectionCard(
      title: title,
      icon: icon,
      child: sideBySide
          ? Row(
              children: [
                donut,
                widthBox(10),
                Expanded(child: table),
              ],
            )
          : Column(children: [donut, heightBox(16), table]),
    );
  }
}

// ─── Product breakdowns: XYZ analysis and lifecycle (dummy data) ──────────

class _BreakdownRow {
  final String label;
  final int count;
  final double share;
  final Color color;

  const _BreakdownRow(this.label, this.count, this.share, this.color);
}

const _xyzSegments = <_BreakdownRow>[
  _BreakdownRow('X (stable)', 3, 25.0, AppColors.accentBlue),
  _BreakdownRow('Y (variable)', 7, 58.3, AppColors.greenDark),
  _BreakdownRow('Z (erratic)', 2, 16.7, AppColors.marigold),
];

const _lifecycleStages = <_BreakdownRow>[
  _BreakdownRow('New', 1, 4.2, AppColors.accentBlue),
  _BreakdownRow('Growing', 8, 33.3, AppColors.greenDark),
  _BreakdownRow('Mature', 1, 4.2, AppColors.marigold),
  _BreakdownRow('Declining', 9, 37.5, AppColors.deepPurple),
  _BreakdownRow('Dead', 5, 20.8, AppColors.errorBright),
];

class _BreakdownCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String columnLabel;
  final List<_BreakdownRow> rows;

  const _BreakdownCard({
    required this.title,
    required this.icon,
    required this.columnLabel,
    required this.rows,
    this.sideBySide = false,
  });

  /// Sits the donut beside the table instead of above it. Only suits short
  /// row labels, since the table columns lose the donut's width.
  final bool sideBySide;

  // Flexed rather than fixed so the columns spread across the whole row
  // instead of bunching at the right with a gap after the label.
  static const _labelFlex = 5;
  static const _countFlex = 2;
  static const _shareFlex = 3;

  @override
  Widget build(BuildContext context) {
    final totalProducts = rows.fold<int>(0, (s, r) => s + r.count);

    final donut = _Donut(
      slices: [for (final r in rows) (color: r.color, value: r.share)],
      centerValue: '$totalProducts',
      centerLabel: 'Products',
      size: sideBySide ? 132 : 180,
    );

    return _SectionCard(
      title: title,
      icon: icon,
      child: sideBySide
          ? Row(
              children: [
                donut,
                widthBox(12),
                Expanded(child: _table(context)),
              ],
            )
          : Column(children: [donut, heightBox(16), _table(context)]),
    );
  }

  Widget _table(BuildContext context) {
    final headerStyle = context.labelSmall.copyWith(
      color: context.textSecondary,
      fontSize: 11,
      fontWeight: .w600,
    );
    return Column(
      mainAxisSize: .min,
      children: [
        Row(
          children: [
            Expanded(
              flex: _labelFlex,
              child: Text(columnLabel, style: headerStyle),
            ),
            Expanded(
              flex: _countFlex,
              child: Text(
                'Count',
                textAlign: .end,
                style: headerStyle,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            widthBox(8),
            Expanded(
              flex: _shareFlex,
              child: Text(
                'Share',
                textAlign: .end,
                style: headerStyle,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
          ],
        ),
        heightBox(8),
        Divider(height: 1, color: context.navyBorder),
        for (final r in rows) ...[
          heightBox(10),
          Row(
            children: [
              Expanded(
                flex: _labelFlex,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: r.color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    widthBox(8),
                    Expanded(
                      child: Text(
                        r.label,
                        style: context.bodySmall.copyWith(
                          color: context.textPrimary,
                          fontWeight: .w600,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: _countFlex,
                child: Text(
                  '${r.count}',
                  textAlign: .end,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              widthBox(8),
              Expanded(
                flex: _shareFlex,
                child: Text(
                  '${r.share.toStringAsFixed(1)}%',
                  textAlign: .end,
                  style: context.bodySmall.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w700,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
          if (r != rows.last) ...[
            heightBox(10),
            Divider(height: 1, color: context.navyBorder),
          ],
        ],
      ],
    );
  }
}

// ─── Top products by revenue (dummy data) ──────────────────────────────────

class _ProductRow {
  final String name;
  final String sales;
  final String contribution;

  const _ProductRow(this.name, this.sales, this.contribution);
}

const _topProducts = <_ProductRow>[
  _ProductRow('Corn Meal Medium', '68,627,971', '35.3%'),
  _ProductRow('1121 Pk Sella Basmati', '33,937,753', '17.4%'),
  _ProductRow('Atta # 2 ( Local )', '20,261,225', '10.4%'),
  _ProductRow('Maize Bran', '14,083,100', '7.2%'),
  _ProductRow('Fine Meal', '11,562,938', '5.9%'),
  _ProductRow('Polenta Flour', '8,746,903', '4.5%'),
  _ProductRow('Corn Grits B-45', '8,446,800', '4.3%'),
  _ProductRow('Atta # 3 Mixture', '7,163,331', '3.7%'),
  _ProductRow('B9 Corn Grits', '6,062,000', '3.1%'),
  _ProductRow('Suji / Semolina', '5,927,800', '3.0%'),
];

class _TopProductsCard extends StatelessWidget {
  const _TopProductsCard();

  static const _salesColWidth = 88.0;
  static const _contribColWidth = 54.0;

  @override
  Widget build(BuildContext context) {
    final headerStyle = context.labelSmall.copyWith(
      color: context.textSecondary,
      fontSize: 11,
      fontWeight: .w600,
    );

    return _SectionCard(
      title: 'Top Products by Revenue',
      icon: Iconsax.medal_star,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('Product', style: headerStyle)),
              SizedBox(
                width: _salesColWidth,
                child: Text('Sales (Rs)', textAlign: .end, style: headerStyle),
              ),
              widthBox(8),
              SizedBox(
                width: _contribColWidth,
                child: Text('% Contrib', textAlign: .end, style: headerStyle),
              ),
            ],
          ),
          heightBox(8),
          Divider(height: 1, color: context.navyBorder),
          for (final p in _topProducts) ...[
            heightBox(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    p.name,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w600,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
                SizedBox(
                  width: _salesColWidth,
                  child: Text(
                    p.sales,
                    textAlign: .end,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w700,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
                widthBox(8),
                SizedBox(
                  width: _contribColWidth,
                  child: Text(
                    p.contribution,
                    textAlign: .end,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            if (p != _topProducts.last) ...[
              heightBox(10),
              Divider(height: 1, color: context.navyBorder),
            ],
          ],
        ],
      ),
    );
  }
}

// ─── Gross profit by product (dummy data) ──────────────────────────────────

class _ProfitBarRow {
  final String name;

  /// Millions of rupees — the card renders every figure in M.
  final double millions;

  const _ProfitBarRow(this.name, this.millions);
}

const _grossProfitByProduct = <_ProfitBarRow>[
  _ProfitBarRow('1121 Pk Sella Basmati', 13.98),
  _ProfitBarRow('Corn Meal Medium', 3.62),
  _ProfitBarRow('Maize Bran', 1.97),
  _ProfitBarRow('Fine Meal', 1.95),
  _ProfitBarRow('Polenta Flour', 0.97),
  _ProfitBarRow('Corn Grits-25', 0.83),
  _ProfitBarRow('Rice Flour', 0.34),
  _ProfitBarRow('B3 Corn Grits', 0.32),
  _ProfitBarRow('Atta Special 40 Kg', 0.21),
  _ProfitBarRow('Atta # 1 (Special )', -0.01),
];

class _GrossProfitByProductCard extends StatelessWidget {
  const _GrossProfitByProductCard();

  static const _nameColWidth = 96.0;
  static const _valueColWidth = 56.0;

  /// Keeps the smallest (and the one negative) product visible as a nub
  /// rather than collapsing to nothing.
  static const _minBarFraction = 0.06;

  @override
  Widget build(BuildContext context) {
    final maxValue = _grossProfitByProduct.fold(
      0.0,
      (a, b) => a > b.millions ? a : b.millions,
    );

    return _SectionCard(
      title: 'Gross Profit by Product (Top 10)',
      icon: Iconsax.chart_1,
      child: Column(
        children: [
          for (final p in _grossProfitByProduct) ...[
            Row(
              children: [
                SizedBox(
                  width: _nameColWidth,
                  child: Text(
                    p.name,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w600,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
                widthBox(8),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 20,
                      // A low-alpha tint disappears on the dark navy card, so
                      // the track is a translucent white there instead.
                      color: context.isDark
                          ? AppColors.white.withValues(alpha: 0.08)
                          : context.grey100,
                      child: FractionallySizedBox(
                        alignment: .centerLeft,
                        widthFactor: maxValue <= 0
                            ? _minBarFraction
                            : (p.millions / maxValue).clamp(
                                _minBarFraction,
                                1.0,
                              ),
                        child: ColoredBox(color: context.accentBlue),
                      ),
                    ),
                  ),
                ),
                widthBox(8),
                SizedBox(
                  width: _valueColWidth,
                  child: Text(
                    '${p.millions.toStringAsFixed(2)}M',
                    textAlign: .end,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w700,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
              ],
            ),
            if (p != _grossProfitByProduct.last) heightBox(10),
          ],
        ],
      ),
    );
  }
}

// ─── Stock at risk (dummy data) ────────────────────────────────────────────

class _RiskTile {
  final String label;
  final int count;
  final String value;
  final Color color;

  const _RiskTile(this.label, this.count, this.value, this.color);
}

const _stockAtRisk = <_RiskTile>[
  _RiskTile('Low Stock Items', 5, 'Rs 23.94M', AppColors.orange),
  _RiskTile('Out of Stock Items', 2, 'Rs 14.76M', AppColors.errorBright),
  _RiskTile('Expiring Soon (< 60 Days)', 0, 'Rs 0', AppColors.yellow),
  _RiskTile('Over Stocked Items', 52, 'Rs 632.61M', AppColors.deepPurple),
];

class _StockAtRiskCard extends StatelessWidget {
  const _StockAtRiskCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Stock at Risk',
      icon: Iconsax.danger,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _stockAtRisk.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: context.gridSpacing,
          crossAxisSpacing: context.gridSpacing,
          // Tall enough for a two-line label, which "Expiring Soon
          // (< 60 Days)" needs at this width.
          mainAxisExtent: Responsive.value<double>(
            context,
            phone: 106,
            tablet: 110,
            ipad: 114,
          ),
        ),
        itemBuilder: (context, i) {
          final tile = _stockAtRisk[i];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: tile.color.withValues(alpha: context.isDark ? 0.16 : 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  tile.label,
                  style: context.labelSmall.copyWith(
                    color: tile.color,
                    fontSize: 11.5,
                    fontWeight: .w700,
                    height: 1.15,
                  ),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                Text(
                  '${tile.count}',
                  style: context.titleLarge.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w800,
                    height: 1,
                  ),
                  maxLines: 1,
                ),
                RichText(
                  maxLines: 1,
                  overflow: .ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Value: ',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                      TextSpan(
                        text: tile.value,
                        style: context.labelSmall.copyWith(
                          color: context.textPrimary,
                          fontSize: 11,
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
