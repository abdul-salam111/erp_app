import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class SalesAnalyticsView extends StatefulWidget {
  const SalesAnalyticsView({super.key});

  @override
  State<SalesAnalyticsView> createState() => _SalesAnalyticsViewState();
}

class _SalesAnalyticsViewState extends State<SalesAnalyticsView> {
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
      appBar: CustomAppBar(title: 'Sales Analytics'),
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
            const _SalesFunnelCard(),
            heightBox(context.gridSpacing * 2),
            _ScrollReveal(
              placeholderHeight: 320,
              child: _SalesTrendCard(from: _fromDate, to: _toDate),
            ),
            heightBox(context.gridSpacing * 2),
            const _TopCustomersCard(),
            heightBox(context.gridSpacing * 2),
            const _ScrollReveal(
              placeholderHeight: 300,
              child: _ProductCategoryCard(),
            ),
            heightBox(context.gridSpacing * 2),
            const _RecentOrdersCard(),
            heightBox(context.gridSpacing * 2),
            _ScrollReveal(
              placeholderHeight: 330,
              child: _OrdersVsDispatchedCard(from: _fromDate, to: _toDate),
            ),
            heightBox(40),
          ],
        ),
      ),
    );
  }
}

// ─── Scroll reveal ──────────────────────────────────────────────────────────
//
// The chart itself (fl_chart / Syncfusion) only plays its own draw-in
// animation once, right when it's first built — so simply fading in an
// already-built chart with AnimatedOpacity doesn't work: the chart finishes
// growing while still invisible, and reveal just fades in the static result.
// Instead, nothing of the real chart is built until it scrolls into view —
// a shimmer placeholder holds its place until then — so the chart's own
// animation fires at the moment it actually appears, same as the Funnel.

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
    // Reveal once the top of the card has scrolled into the viewport.
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
    // A single accent-tinted toolbar strip — deliberately unlike the neutral
    // bordered content cards below, so the filter controls read as a
    // distinct region rather than another stat card.
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

class _StatMeta {
  final String label;
  final double value;
  final bool isCurrency;
  final double? deltaPct;
  final IconData icon;
  final Color color;

  const _StatMeta({
    required this.label,
    required this.value,
    this.isCurrency = true,
    required this.deltaPct,
    required this.icon,
    required this.color,
  });
}

const _stats = <_StatMeta>[
  _StatMeta(
    label: 'Total Sales',
    value: 194675621,
    deltaPct: -79.37,
    icon: Iconsax.chart_2,
    color: AppColors.accentBlue,
  ),
  _StatMeta(
    label: 'Total Orders',
    value: 23,
    isCurrency: false,
    deltaPct: null,
    icon: Iconsax.shopping_cart,
    color: AppColors.greenDark,
  ),
  _StatMeta(
    label: 'Total Invoices',
    value: 142,
    isCurrency: false,
    deltaPct: -70.35,
    icon: Iconsax.receipt_item,
    color: AppColors.deepPurple,
  ),
  _StatMeta(
    label: 'Avg Order Value',
    value: 8464157,
    deltaPct: -12.4,
    icon: Iconsax.card_pos,
    color: AppColors.orange,
  ),
  _StatMeta(
    label: 'Avg Invoice Value',
    value: 1370955,
    deltaPct: null,
    icon: Iconsax.bag_tick,
    color: AppColors.teal,
  ),
  _StatMeta(
    label: 'Return / Credit Note',
    value: 19256682,
    deltaPct: -30.40,
    icon: Iconsax.refresh,
    color: AppColors.errorBright,
  ),
];

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  // Fixed height (not an aspect ratio) so the card always has just enough
  // room for the icon + two text lines, regardless of screen width — an
  // aspect ratio left a lot of empty space once the delta badge moved out
  // of the text column.
  static double _cardHeight(BuildContext context) =>
      Responsive.value<double>(context, phone: 60, tablet: 64, ipad: 68);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _stats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.gridColumnCount,
        mainAxisSpacing: context.gridSpacing,
        crossAxisSpacing: context.gridSpacing,
        mainAxisExtent: _cardHeight(context),
      ),
      itemBuilder: (context, i) => _StatCard(meta: _stats[i]),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 44),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: meta.color.withValues(
                      alpha: context.isDark ? 0.22 : 0.12,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(meta.icon, color: meta.color, size: 17),
                ),
                widthBox(9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        meta.isCurrency
                            ? 'Rs ${meta.value.toCompact(decimals: 1)}'
                            : meta.value.toCompact(decimals: 1),
                        style: context.bodyMedium.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                          fontSize: 14,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      heightBox(4),
                      Text(
                        meta.label,
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
          if (meta.deltaPct != null)
            Positioned(
              top: 0,
              right: 0,
              child: _DeltaBadge(pct: meta.deltaPct!),
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
    final delta = pct;
    final isNegative = delta < 0;
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
            '${delta.abs().round()}%',
            style: TextStyle(fontSize: 9, fontWeight: .w700, color: color),
          ),
        ],
      ),
    );
  }
}

// ─── Section card shell ─────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? trailing;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    this.trailing,
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
              if (trailing != null)
                Text(
                  trailing!,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
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

// ─── Sales funnel (Syncfusion — dummy data) ─────────────────────────────────

class _FunnelDatum {
  final String label;
  final double value;
  final Color color;

  const _FunnelDatum(this.label, this.value, this.color);
}

class _SalesFunnelCard extends StatelessWidget {
  const _SalesFunnelCard();

  @override
  Widget build(BuildContext context) {
    final data = <_FunnelDatum>[
      _FunnelDatum('Orders: 230', 230, context.primary),
      _FunnelDatum('Dispatches: 180', 180, AppColors.secondary),
      _FunnelDatum('Invoices: 142', 142, AppColors.tertiary),
    ];

    return _SectionCard(
      title: 'Sales Funnel',
      icon: Iconsax.filter,
      child: Column(
        children: [
          SizedBox(
            height: 240,
            child: SfFunnelChart(
              margin: EdgeInsets.zero,
              series: FunnelSeries<_FunnelDatum, String>(
                dataSource: data,
                xValueMapper: (d, _) => d.label,
                yValueMapper: (d, _) => d.value,
                textFieldMapper: (d, _) => d.label,
                pointColorMapper: (d, _) => d.color,
                gapRatio: 0.04,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.inside,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: .w700,
                  ),
                ),
              ),
            ),
          ),
          heightBox(4),
          Text(
            'Orders → Dispatches → Invoices',
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sales trend (fl_chart — dummy data) ────────────────────────────────────

class _SalesTrendCard extends StatefulWidget {
  final DateTime from;
  final DateTime to;

  const _SalesTrendCard({required this.from, required this.to});

  @override
  State<_SalesTrendCard> createState() => _SalesTrendCardState();
}

class _SalesTrendCardState extends State<_SalesTrendCard> {
  static const _current = <double>[5, 8, 15, 42, 35, 18, 12];
  static const _previous = <double>[4, 5, 8, 22, 30, 80, 38];

  bool _showCurrent = true;
  bool _showPrevious = true;

  List<String> _xLabels() {
    final totalDays = widget.to.difference(widget.from).inDays;
    return List.generate(_current.length, (i) {
      final d = widget.from.add(
        Duration(days: (totalDays * i / (_current.length - 1)).round()),
      );
      return d.format('MMM dd');
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = _xLabels();

    return _SectionCard(
      title: 'Sales Trend',
      icon: Iconsax.trend_up,
      trailing: 'Rs Millions',
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: context.isDark
                        ? AppColors.white.withValues(alpha: 0.05)
                        : context.border,
                    strokeWidth: 0.8,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (v, _) => Text(
                        v.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: .w600,
                          color: context.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      interval: 1,
                      getTitlesWidget: (v, _) {
                        final i = v.round();
                        if (i < 0 || i >= labels.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            labels[i],
                            style: TextStyle(
                              fontSize: 8.5,
                              fontWeight: .w600,
                              color: context.textSecondary,
                            ),
                          ),
                        );
                      },
                    ),
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
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) =>
                        context.accentBlue.withValues(alpha: 0.85),
                  ),
                ),
                lineBarsData: [
                  if (_showCurrent)
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < _current.length; i++)
                          FlSpot(i.toDouble(), _current[i]),
                      ],
                      isCurved: true,
                      color: context.accentBlue,
                      barWidth: 2.4,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: context.accentBlue.withValues(alpha: 0.08),
                      ),
                    ),
                  if (_showPrevious)
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < _previous.length; i++)
                          FlSpot(i.toDouble(), _previous[i]),
                      ],
                      isCurved: true,
                      color: context.textSecondary,
                      barWidth: 1.8,
                      dashArray: [6, 4],
                      dotData: const FlDotData(show: true),
                    ),
                ],
              ),
            ),
          ),
          heightBox(10),
          Row(
            mainAxisAlignment: .center,
            children: [
              _LegendDot(
                color: context.accentBlue,
                label: 'Current year',
                selected: _showCurrent,
                onTap: () => setState(() => _showCurrent = !_showCurrent),
              ),
              widthBox(18),
              _LegendDot(
                color: context.textSecondary,
                label: 'Previous year',
                dashed: true,
                selected: _showPrevious,
                onTap: () => setState(() => _showPrevious = !_showPrevious),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  final bool dashed;
  final bool selected;
  final VoidCallback onTap;

  const _LegendDot({
    required this.color,
    required this.label,
    this.dashed = false,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fade = selected ? 1.0 : 0.35;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          mainAxisSize: .min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color.withValues(alpha: fade),
                shape: .circle,
              ),
            ),
            widthBox(6),
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary.withValues(alpha: fade),
                fontSize: 11,
                fontWeight: selected ? .w600 : .w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Top 5 customers (dummy data) ───────────────────────────────────────────

class _CustomerRow {
  final String name;
  final String sales;
  final String pct;

  const _CustomerRow(this.name, this.sales, this.pct);
}

const _topCustomers = <_CustomerRow>[
  _CustomerRow('Pepsico Int', '73,172,581', '44.0%'),
  _CustomerRow('HR Trader & Comission', '48,762,870', '29.3%'),
  _CustomerRow(
    'King Choice General Trading L.L.C Dubai Uae',
    '22,014,889',
    '13.2%',
  ),
  _CustomerRow('Herat Import & Export Inc Canada', '11,922,864', '7.2%'),
  _CustomerRow('Usman Nagori Karachi', '10,510,360', '6.3%'),
];

class _TopCustomersCard extends StatelessWidget {
  const _TopCustomersCard();

  static const _salesColWidth = 90.0;
  static const _pctColWidth = 42.0;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Top 5 Customers by Sales',
      icon: Iconsax.profile_2user,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Customer',
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
                    fontWeight: .w600,
                  ),
                ),
              ),
              SizedBox(
                width: _salesColWidth,
                child: Text(
                  'Sales',
                  textAlign: .end,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
                    fontWeight: .w600,
                  ),
                ),
              ),
              widthBox(8),
              SizedBox(
                width: _pctColWidth,
                child: Text(
                  '%',
                  textAlign: .end,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
                    fontWeight: .w600,
                  ),
                ),
              ),
            ],
          ),
          heightBox(8),
          Divider(height: 1, color: context.navyBorder),
          for (final c in _topCustomers) ...[
            heightBox(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    c.name,
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
                    c.sales,
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
                  width: _pctColWidth,
                  child: Text(
                    c.pct,
                    textAlign: .end,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            if (c != _topCustomers.last) ...[
              heightBox(10),
              Divider(height: 1, color: context.navyBorder),
            ],
          ],
        ],
      ),
    );
  }
}

// ─── Sales by product category (fl_chart donut — dummy data) ───────────────

class _CategoryDatum {
  final String label;
  final double value;
  final Color color;

  const _CategoryDatum(this.label, this.value, this.color);
}

class _ProductCategoryCard extends StatelessWidget {
  const _ProductCategoryCard();

  @override
  Widget build(BuildContext context) {
    final data = <_CategoryDatum>[
      _CategoryDatum('Maize Products', 78, context.accentBlue),
      _CategoryDatum('Rice Products', 22, AppColors.orange),
    ];
    final total = data.fold<double>(0, (sum, d) => sum + d.value);

    return _SectionCard(
      title: 'Sales by Product Category',
      icon: Iconsax.chart_21,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 3,
                centerSpaceRadius: 50,
                sections: [
                  for (final d in data)
                    PieChartSectionData(
                      value: d.value,
                      color: d.color,
                      radius: 46,
                      title: '${(d.value / total * 100).round()}%',
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: .w700,
                      ),
                    ),
                ],
                pieTouchData: PieTouchData(enabled: false),
              ),
            ),
          ),
          heightBox(14),
          Wrap(
            alignment: .center,
            spacing: 20,
            runSpacing: 8,
            children: [
              for (final d in data)
                Row(
                  mainAxisSize: .min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: d.color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    widthBox(6),
                    Text(
                      d.label,
                      style: context.bodySmall.copyWith(
                        color: context.textPrimary,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Recent sales orders (dummy data) ───────────────────────────────────────

enum _OrderStatus { pending, dispatched }

class _SalesOrderRow {
  final String orderNo;
  final String date;
  final String customer;
  final double amount;
  final _OrderStatus status;

  const _SalesOrderRow(
    this.orderNo,
    this.date,
    this.customer,
    this.amount,
    this.status,
  );
}

const _recentOrders = <_SalesOrderRow>[
  _SalesOrderRow(
    'SO-0023',
    '2026-08-25',
    'HR Trader & Comission',
    18000,
    _OrderStatus.pending,
  ),
  _SalesOrderRow(
    'SO-0022',
    '2026-08-12',
    'Hilal Retail Brands Pvt Ltd',
    1110144,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0021',
    '2026-08-11',
    'Triple Em (Private) Ltd',
    4672800,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0020',
    '2026-08-09',
    'HR Trader & Comission',
    33000000,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0019',
    '2026-08-05',
    'Nutribel Pvt Ltd.',
    12050160,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0018',
    '2026-08-05',
    'HR Trader & Comission',
    13460000,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0017',
    '2026-08-02',
    'Muhammad Wahid Traders (Shahzeb)',
    4100,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0016',
    '2026-07-28',
    'Herat Import & Export Inc Canada',
    12268800000,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0015',
    '2026-07-24',
    'Triple Em (Private) Ltd',
    5192000,
    _OrderStatus.dispatched,
  ),
  _SalesOrderRow(
    'SO-0014',
    '2026-07-23',
    'Akhtar & Ibrar Nagori',
    6120090,
    _OrderStatus.dispatched,
  ),
];

class _RecentOrdersCard extends StatelessWidget {
  const _RecentOrdersCard();

  static const _orderColWidth = 66.0;
  static const _amountColWidth = 92.0;
  static const _statusColWidth = 82.0;

  @override
  Widget build(BuildContext context) {
    final headerStyle = context.labelSmall.copyWith(
      color: context.textSecondary,
      fontSize: 11,
      fontWeight: .w600,
    );

    return _SectionCard(
      title: 'Recent Sales Orders',
      icon: Iconsax.document_text,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: .start,
            children: [
              SizedBox(
                width: _orderColWidth,
                child: Text('Order', style: headerStyle),
              ),
              Expanded(child: Text('Customer', style: headerStyle)),
              SizedBox(
                width: _amountColWidth,
                child: Text('Amount', textAlign: .end, style: headerStyle),
              ),
              widthBox(8),
              SizedBox(
                width: _statusColWidth,
                child: Text('Status', textAlign: .end, style: headerStyle),
              ),
            ],
          ),
          heightBox(8),
          Divider(height: 1, color: context.navyBorder),
          for (final o in _recentOrders) ...[
            heightBox(12),
            Row(
              crossAxisAlignment: .center,
              children: [
                SizedBox(
                  width: _orderColWidth,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        o.orderNo,
                        style: context.bodySmall.copyWith(
                          color: context.textPrimary,
                          fontWeight: .w700,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      heightBox(2),
                      Text(
                        o.date,
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    o.customer,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
                SizedBox(
                  width: _amountColWidth,
                  child: Text(
                    o.amount.withCommas,
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
                  width: _statusColWidth,
                  child: Align(
                    alignment: .centerRight,
                    child: _StatusBadge(status: o.status),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final _OrderStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final isPending = status == _OrderStatus.pending;
    final color = isPending ? context.warning : context.success;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.18 : 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isPending ? 'Pending' : 'Dispatched',
        maxLines: 1,
        overflow: .ellipsis,
        softWrap: false,
        style: TextStyle(fontSize: 10, fontWeight: .w700, color: color),
      ),
    );
  }
}

// ─── Orders vs Dispatched (fl_chart grouped bars — dummy data) ─────────────

class _OrdersVsDispatchedCard extends StatefulWidget {
  final DateTime from;
  final DateTime to;

  const _OrdersVsDispatchedCard({required this.from, required this.to});

  @override
  State<_OrdersVsDispatchedCard> createState() =>
      _OrdersVsDispatchedCardState();
}

class _OrdersVsDispatchedCardState extends State<_OrdersVsDispatchedCard> {
  static const _barWidth = 7.0;
  static const _groupWidth = 56.0;

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<DateTime> _weeks() {
    final weeks = <DateTime>[];
    var d = widget.from;
    while (!d.isAfter(widget.to)) {
      weeks.add(d);
      d = d.add(const Duration(days: 7));
    }
    return weeks.isEmpty ? [widget.from] : weeks;
  }

  @override
  Widget build(BuildContext context) {
    final weeks = _weeks();
    // Dummy data: every week gets a visible bar (no all-zero stretch), so
    // nothing looks "missing" before the user scrolls.
    final orders = List.generate(
      weeks.length,
      (i) => (4 + (i * 7) % 14).toDouble(),
    );
    final dispatched = List.generate(
      weeks.length,
      (i) => (6 + (i * 11) % 18).toDouble(),
    );

    final maxVal = [
      ...orders,
      ...dispatched,
    ].fold(0.0, (a, b) => a > b ? a : b);
    final maxY = maxVal <= 0 ? 10.0 : (maxVal * 1.3).ceilToDouble();

    final chartWidth = (weeks.length * _groupWidth).clamp(
      MediaQuery.sizeOf(context).width,
      double.infinity,
    );

    return _SectionCard(
      title: 'Orders vs Dispatched',
      icon: Iconsax.chart,
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: .horizontal,
              child: SizedBox(
                width: chartWidth,
                // Extra top padding so the topmost y-axis label has room to
                // render without being clipped against the chart's hard
                // height bound.
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: BarChart(
                    BarChartData(
                      maxY: maxY,
                      minY: 0,
                      barTouchData: BarTouchData(
                        enabled: false,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (_) => Colors.transparent,
                          tooltipPadding: EdgeInsets.zero,
                          tooltipMargin: 4,
                          fitInsideVertically: true,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                              BarTooltipItem(
                                rod.toY.toStringAsFixed(0),
                                TextStyle(
                                  color: rod.color,
                                  fontWeight: .w700,
                                  fontSize: 9,
                                ),
                              ),
                        ),
                      ),
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (_) => FlLine(
                          color: context.isDark
                              ? context.navyBorder
                              : context.divider,
                          strokeWidth: 1,
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            getTitlesWidget: (v, _) => Text(
                              v.toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: .w600,
                                color: context.textSecondary,
                              ),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 32,
                            getTitlesWidget: (v, _) {
                              final i = v.toInt();
                              if (i < 0 || i >= weeks.length) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  weeks[i].format('MMM dd'),
                                  style: TextStyle(
                                    fontSize: 8.5,
                                    fontWeight: .w600,
                                    color: context.textSecondary,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      barGroups: [
                        for (var i = 0; i < weeks.length; i++)
                          BarChartGroupData(
                            x: i,
                            barsSpace: 4,
                            showingTooltipIndicators: const [0, 1],
                            barRods: [
                              BarChartRodData(
                                toY: orders[i],
                                color: context.accentBlue,
                                width: _barWidth,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(3),
                                ),
                              ),
                              BarChartRodData(
                                toY: dispatched[i],
                                color: AppColors.greenDark,
                                width: _barWidth,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(3),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          heightBox(8),
          _ScrollHint(controller: _scrollController),
          heightBox(10),
          Row(
            mainAxisAlignment: .center,
            children: [
              _LegendSquare(color: context.accentBlue, label: 'Orders'),
              widthBox(18),
              _LegendSquare(color: AppColors.greenDark, label: 'Dispatched'),
            ],
          ),
        ],
      ),
    );
  }
}

// A custom scroll-position track/thumb — the stock Material [Scrollbar]
// rendered as a flat line flush under the x-axis and read as part of the
// chart rather than a control, so this draws a clearly separate, rounded
// pill indicator instead.
class _ScrollHint extends StatelessWidget {
  final ScrollController controller;

  const _ScrollHint({required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth;
        return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            var thumbWidth = trackWidth;
            var thumbLeft = 0.0;
            if (controller.hasClients &&
                controller.position.hasContentDimensions) {
              final viewport = controller.position.viewportDimension;
              final maxExtent = controller.position.maxScrollExtent;
              final total = viewport + maxExtent;
              if (total > 0) {
                thumbWidth = ((viewport / total) * trackWidth).clamp(
                  32.0,
                  trackWidth,
                );
                final travel = trackWidth - thumbWidth;
                thumbLeft = maxExtent == 0
                    ? 0
                    : (controller.offset / maxExtent) * travel;
              }
            }
            return Container(
              height: 5,
              decoration: BoxDecoration(
                color: context.navyBorder,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 80),
                    left: thumbLeft,
                    width: thumbWidth,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.accentBlue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _LegendSquare extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendSquare({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        widthBox(6),
        Text(
          label,
          style: context.bodySmall.copyWith(color: context.textPrimary),
        ),
      ],
    );
  }
}
