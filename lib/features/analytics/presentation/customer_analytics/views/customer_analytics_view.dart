import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class CustomerAnalyticsView extends StatefulWidget {
  const CustomerAnalyticsView({super.key});

  @override
  State<CustomerAnalyticsView> createState() => _CustomerAnalyticsViewState();
}

class _CustomerAnalyticsViewState extends State<CustomerAnalyticsView> {
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
      appBar: CustomAppBar(title: 'Customer Analytics'),
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
              placeholderHeight: 420,
              child: _SegmentationCard(),
            ),
            heightBox(context.gridSpacing * 2),
            const _ScrollReveal(
              placeholderHeight: 340,
              child: _CustomerLifecycleCard(),
            ),
            heightBox(context.gridSpacing * 2),
            const _TopCustomersCard(),
            heightBox(context.gridSpacing * 2),
            _ScrollReveal(
              placeholderHeight: 360,
              child: _CustomerTrendCard(from: _fromDate, to: _toDate),
            ),
            heightBox(context.gridSpacing * 2),
            const _LtvCard(),
            heightBox(context.gridSpacing * 2),
            _ScrollReveal(
              placeholderHeight: 300,
              child: _MonthlyBarCard(
                title: 'Month-wise New Customers Achieved',
                tag: 'Selected period',
                icon: Iconsax.user_add,
                barColor: AppColors.accentBlue,
                captionPrefix: 'Count of first-ever purchasers by month',
                from: _fromDate,
                to: _toDate,
                valueFor: (i) => const <double>[0, 1, 0, 2, 1, 1, 0][i % 7],
              ),
            ),
            heightBox(context.gridSpacing * 2),
            _ScrollReveal(
              placeholderHeight: 300,
              child: _MonthlyBarCard(
                title: 'Month-wise New Customer Sales',
                tag: 'Period sales',
                icon: Iconsax.money_recive,
                barColor: AppColors.greenDark,
                captionPrefix:
                    'Net sales from customers whose first invoice falls in that month',
                from: _fromDate,
                to: _toDate,
                compactAxis: true,
                valueFor: (i) => const <double>[
                  0,
                  8450000,
                  0,
                  22018989,
                  6300000,
                  14750000,
                  0,
                ][i % 7],
              ),
            ),
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
//
// Only the first 6 of the reference dashboard's 8 KPI cards — Repeat
// Purchase Rate and Avg Customer LTV are left out for now.

class _StatMeta {
  final String label;
  final double value;
  final double deltaPct;
  final IconData icon;
  final Color color;

  const _StatMeta({
    required this.label,
    required this.value,
    required this.deltaPct,
    required this.icon,
    required this.color,
  });
}

const _stats = <_StatMeta>[
  _StatMeta(
    label: 'Total Customers',
    value: 21,
    deltaPct: 0,
    icon: Iconsax.profile_2user,
    color: AppColors.accentBlue,
  ),
  _StatMeta(
    label: 'Active Customers',
    value: 0,
    deltaPct: -100,
    icon: Iconsax.user_tick,
    color: AppColors.greenDark,
  ),
  _StatMeta(
    label: 'New Customers',
    value: 2,
    deltaPct: -50,
    icon: Iconsax.user_add,
    color: AppColors.deepPurple,
  ),
  _StatMeta(
    label: 'Renewed Customers',
    value: 10,
    deltaPct: 900,
    icon: Iconsax.refresh_circle,
    color: AppColors.orange,
  ),
  _StatMeta(
    label: 'Inactive Customers',
    value: 4,
    deltaPct: -33.33,
    icon: Iconsax.user_remove,
    color: AppColors.marigold,
  ),
  _StatMeta(
    label: 'Lost Customers',
    value: 9,
    deltaPct: 200,
    icon: Iconsax.user_minus,
    color: AppColors.errorBright,
  ),
];

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  static double _cardHeight(BuildContext context) =>
      Responsive.value<double>(context, phone: 78, tablet: 82, ipad: 86);

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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: .start,
        // Fill the fixed card height and push the label to the bottom, so
        // the leftover space becomes a gap under the value instead of dead
        // space below the label.
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
                  meta.value.toCompact(decimals: 1),
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
              widthBox(6),
              _DeltaBadge(pct: meta.deltaPct),
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
    final isNeutral = pct == 0;
    final isNegative = pct < 0;
    final color = isNeutral
        ? context.textSecondary
        : (isNegative ? context.error : context.success);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isNeutral ? 0.1 : 0.12),
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
// Same lazy-build-on-scroll pattern as the Sales Analytics screen: the chart
// itself only plays its draw-in animation once, right when it's built, so a
// shimmer placeholder holds its place until it actually scrolls into view.

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
  final Widget? trailing;
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
              if (trailing != null) trailing!,
            ],
          ),
          heightBox(14),
          child,
        ],
      ),
    );
  }
}

// ─── Customer segmentation (fl_chart donut + table — dummy data) ───────────

class _SegmentDatum {
  final String label;
  final double share;
  final int customers;
  final double sales;
  final Color color;

  const _SegmentDatum(
    this.label,
    this.share,
    this.customers,
    this.sales,
    this.color,
  );
}

const _segments = <_SegmentDatum>[
  _SegmentDatum('A-High Value', 10, 2, 121935451, AppColors.accentBlue),
  _SegmentDatum('B-Medium Value', 10, 2, 17779886, AppColors.greenDark),
  _SegmentDatum('C-Low Value', 19, 4, 17417231, AppColors.yellow),
  _SegmentDatum('D-Inactive', 19, 4, 37543053, AppColors.orange),
  _SegmentDatum('E-Lost', 43, 9, 0, AppColors.errorBright),
];

class _SegmentationCard extends StatelessWidget {
  const _SegmentationCard();

  static const _shareColWidth = 40.0;
  static const _custColWidth = 60.0;
  static const _salesColWidth = 86.0;

  @override
  Widget build(BuildContext context) {
    final totalCustomers = _segments.fold<int>(0, (s, d) => s + d.customers);
    final headerStyle = context.labelSmall.copyWith(
      color: context.textSecondary,
      fontSize: 11,
      fontWeight: .w600,
    );

    return _SectionCard(
      title: 'Customer Segmentation (By Sales)',
      icon: Iconsax.diagram,
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              alignment: .center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 3,
                    centerSpaceRadius: 54,
                    sections: [
                      for (final s in _segments)
                        PieChartSectionData(
                          value: s.share,
                          color: s.color,
                          radius: 34,
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
                      '$totalCustomers',
                      style: context.titleLarge.copyWith(
                        color: context.textPrimary,
                        fontWeight: .w800,
                      ),
                    ),
                    Text(
                      'Customers',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          heightBox(16),
          Row(
            children: [
              Expanded(child: Text('Segment', style: headerStyle)),
              SizedBox(
                width: _shareColWidth,
                child: Text('Share', textAlign: .start, style: headerStyle),
              ),
              widthBox(10),
              SizedBox(
                width: _custColWidth,
                child: Text('Customer', textAlign: .center, style: headerStyle),
              ),
              widthBox(10),
              SizedBox(
                width: _salesColWidth,
                child: Text('Sales', textAlign: .end, style: headerStyle),
              ),
            ],
          ),
          heightBox(8),
          Divider(height: 1, color: context.navyBorder),
          for (final s in _segments) ...[
            heightBox(10),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: s.color,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      widthBox(8),
                      Expanded(
                        child: Text(
                          s.label,
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
                SizedBox(
                  width: _shareColWidth,
                  child: Text(
                    '${s.share.round()}%',
                    textAlign: .start,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w700,
                    ),
                  ),
                ),
                widthBox(10),
                SizedBox(
                  width: _custColWidth,
                  child: Text(
                    '${s.customers}',
                    textAlign: .center,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
                widthBox(10),
                SizedBox(
                  width: _salesColWidth,
                  child: Text(
                    s.sales.withCommas,
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
            if (s != _segments.last) ...[
              heightBox(10),
              Divider(height: 1, color: context.navyBorder),
            ],
          ],
        ],
      ),
    );
  }
}

// ─── Tag chip ────────────────────────────────────────────────────────────────

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final color = context.warning;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.18 : 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: .w700, color: color),
      ),
    );
  }
}

// ─── Customer lifecycle funnel (Syncfusion — dummy data) ───────────────────

class _LifecycleStage {
  final String caption;
  final double value;
  final Color color;

  const _LifecycleStage(this.caption, this.value, this.color);

  // A literal 0 collapses to a zero-height band in the funnel chart, which
  // pushes Syncfusion to draw the label outside with a connector line
  // instead of showing a thin stage like the others. Floor the value used
  // for the chart's own proportions only — the displayed caption still
  // reads the real count.
  double get renderValue => value <= 0 ? 1 : value;
}

const _lifecycleStages = <_LifecycleStage>[
  _LifecycleStage('Total Customers: 21', 21, AppColors.accentBlue),
  _LifecycleStage('New: 2', 2, AppColors.deepPurple),
  _LifecycleStage('Active: 0', 0, AppColors.greenDark),
  _LifecycleStage('At Risk: 8', 8, AppColors.orange),
  _LifecycleStage('Inactive: 4', 4, AppColors.yellow),
  _LifecycleStage('Lost: 9', 9, AppColors.errorBright),
];

class _CustomerLifecycleCard extends StatelessWidget {
  const _CustomerLifecycleCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Customer Lifecycle',
      icon: Iconsax.filter,
      trailing: const _TagChip(label: 'Skewed Funnel'),
      child: Column(
        children: [
          SizedBox(
            height: 280,
            child: SfFunnelChart(
              margin: EdgeInsets.zero,
              series: FunnelSeries<_LifecycleStage, String>(
                // Syncfusion renders the first data point at the bottom of
                // the funnel and the last at the top, so the reading order
                // (Total → ... → Lost, widest first) has to be reversed to
                // land Total Customers at the top.
                dataSource: _lifecycleStages.reversed.toList(),
                xValueMapper: (d, _) => d.caption,
                yValueMapper: (d, _) => d.renderValue,
                textFieldMapper: (d, _) => d.caption,
                pointColorMapper: (d, _) => d.color,
                gapRatio: 0.03,
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
          heightBox(6),
          Text(
            'DW party lifecycle · Total → New → Active → At Risk → Inactive → Lost',
            textAlign: .center,
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

// ─── New vs Returning vs Renewed (fl_chart — dummy data) ───────────────────

class _CustomerTrendCard extends StatefulWidget {
  final DateTime from;
  final DateTime to;

  const _CustomerTrendCard({required this.from, required this.to});

  @override
  State<_CustomerTrendCard> createState() => _CustomerTrendCardState();
}

class _CustomerTrendCardState extends State<_CustomerTrendCard> {
  static const _newCustomers = <double>[0, 0, 1, 2, 1, 0, 0];
  static const _returning = <double>[0, 0, 0, 0, 0, 0, 0];
  static const _renewed = <double>[0, 3, 7, 5, 8, 2, 0];

  bool _showNew = true;
  bool _showReturning = true;
  bool _showRenewed = true;

  List<String> _xLabels() {
    final totalDays = widget.to.difference(widget.from).inDays;
    return List.generate(_newCustomers.length, (i) {
      final d = widget.from.add(
        Duration(days: (totalDays * i / (_newCustomers.length - 1)).round()),
      );
      return d.format('MMM dd');
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = _xLabels();

    return _SectionCard(
      title: 'New vs Returning vs Renewed',
      icon: Iconsax.trend_up,
      trailing: const _TagChip(label: 'Renewed ≥ 90d'),
      child: Column(
        children: [
          Row(
            children: [
              _TrendSummaryItem(
                label: 'New',
                value: '2',
                color: AppColors.deepPurple,
              ),
              widthBox(14),
              _TrendSummaryItem(
                label: 'Returning',
                value: '0',
                color: context.textSecondary,
              ),
              widthBox(14),
              Expanded(
                child: _TrendSummaryItem(
                  label: 'Renewed',
                  value: '10 (gap ≥ 90d)',
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
          heightBox(14),
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
                      reservedSize: 24,
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
                  if (_showNew)
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < _newCustomers.length; i++)
                          FlSpot(i.toDouble(), _newCustomers[i]),
                      ],
                      isCurved: false,
                      color: AppColors.deepPurple,
                      barWidth: 2,
                      dotData: const FlDotData(show: true),
                    ),
                  if (_showReturning)
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < _returning.length; i++)
                          FlSpot(i.toDouble(), _returning[i]),
                      ],
                      isCurved: false,
                      color: AppColors.greenDark,
                      barWidth: 2,
                      dotData: const FlDotData(show: true),
                    ),
                  if (_showRenewed)
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < _renewed.length; i++)
                          FlSpot(i.toDouble(), _renewed[i]),
                      ],
                      isCurved: true,
                      color: AppColors.orange,
                      barWidth: 2.6,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.orange.withValues(alpha: 0.08),
                      ),
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
                color: AppColors.deepPurple,
                label: 'New',
                selected: _showNew,
                onTap: () => setState(() => _showNew = !_showNew),
              ),
              widthBox(16),
              _LegendDot(
                color: AppColors.greenDark,
                label: 'Returning',
                selected: _showReturning,
                onTap: () => setState(() => _showReturning = !_showReturning),
              ),
              widthBox(16),
              _LegendDot(
                color: AppColors.orange,
                label: 'Renewed',
                selected: _showRenewed,
                onTap: () => setState(() => _showRenewed = !_showRenewed),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendSummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _TrendSummaryItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: .ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label ',
            style: context.labelSmall.copyWith(color: color, fontSize: 11),
          ),
          TextSpan(
            text: value,
            style: context.labelSmall.copyWith(
              color: context.textPrimary,
              fontWeight: .w700,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LegendDot({
    required this.color,
    required this.label,
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

// ─── Month-wise bar charts (fl_chart — dummy data) ─────────────────────────

class _MonthlyBarCard extends StatelessWidget {
  final String title;
  final String tag;
  final IconData icon;
  final Color barColor;
  final String captionPrefix;
  final DateTime from;
  final DateTime to;
  final double Function(int index) valueFor;

  /// Money axes need compacting ("22M") — raw rupee values eat the chart
  /// width on a phone. Counts stay as plain whole numbers.
  final bool compactAxis;

  const _MonthlyBarCard({
    required this.title,
    required this.tag,
    required this.icon,
    required this.barColor,
    required this.captionPrefix,
    required this.from,
    required this.to,
    required this.valueFor,
    this.compactAxis = false,
  });

  List<DateTime> _months() {
    final months = <DateTime>[];
    var d = DateTime(from.year, from.month);
    final last = DateTime(to.year, to.month);
    while (!d.isAfter(last)) {
      months.add(d);
      d = DateTime(d.year, d.month + 1);
    }
    return months.isEmpty ? [DateTime(from.year, from.month)] : months;
  }

  @override
  Widget build(BuildContext context) {
    final months = _months();
    final values = List.generate(months.length, valueFor);
    final total = values.fold(0.0, (a, b) => a + b);

    final maxVal = values.fold(0.0, (a, b) => a > b ? a : b);
    final maxY = maxVal <= 0 ? 4.0 : (maxVal * 1.25).ceilToDouble();
    // Whole-number ticks for counts — a "0.5 customers" gridline reads wrong.
    final step = compactAxis ? maxY / 4 : (maxY / 4).ceilToDouble();

    return _SectionCard(
      title: title,
      icon: icon,
      trailing: _TagChip(label: tag),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Padding(
              // Headroom so the topmost y-axis label isn't clipped.
              padding: const EdgeInsets.only(top: 12),
              child: BarChart(
                BarChartData(
                  maxY: maxY,
                  minY: 0,
                  alignment: .spaceAround,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) =>
                          context.accentBlue.withValues(alpha: 0.85),
                      getTooltipItem: (group, _, rod, _) => BarTooltipItem(
                        rod.toY.withCommas,
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: .w700,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: step,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: context.isDark
                          ? AppColors.white.withValues(alpha: 0.05)
                          : context.border,
                      strokeWidth: 0.8,
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
                        reservedSize: compactAxis ? 36 : 24,
                        interval: step,
                        getTitlesWidget: (v, _) => Text(
                          compactAxis
                              ? v.toCompact(decimals: 0)
                              : v.toStringAsFixed(0),
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
                        reservedSize: 26,
                        interval: 1,
                        getTitlesWidget: (v, _) {
                          final i = v.round();
                          if (i < 0 || i >= months.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              months[i].format('MMM yy'),
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
                    for (var i = 0; i < months.length; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: values[i],
                            color: barColor,
                            width: 16,
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
          heightBox(10),
          Text(
            '$captionPrefix · Total ${total.withCommas}',
            textAlign: .center,
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 10.5,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Top 5 customers (dummy data) ──────────────────────────────────────────

class _CustomerRow {
  final String name;
  final String sales;
  final String pct;

  const _CustomerRow(this.name, this.sales, this.pct);
}

const _topCustomers = <_CustomerRow>[
  _CustomerRow('Pepsico Int', '73,172,581', '37.6%'),
  _CustomerRow('HR Trader & Comission', '48,762,870', '25.1%'),
  _CustomerRow(
    'King Choice General Trading L.L.C Dubai Uae',
    '22,014,889',
    '11.3%',
  ),
  _CustomerRow('Herat Import & Export Inc Canada', '11,922,864', '6.1%'),
  _CustomerRow('Usman Nagori Karachi', '10,510,360', '5.4%'),
];

class _TopCustomersCard extends StatelessWidget {
  const _TopCustomersCard();

  static const _salesColWidth = 90.0;
  static const _pctColWidth = 42.0;

  @override
  Widget build(BuildContext context) {
    final headerStyle = context.labelSmall.copyWith(
      color: context.textSecondary,
      fontSize: 11,
      fontWeight: .w600,
    );

    return _SectionCard(
      title: 'Top 5 Customers by Sales',
      icon: Iconsax.profile_2user,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('Customer', style: headerStyle)),
              SizedBox(
                width: _salesColWidth,
                child: Text('Sales (Rs)', textAlign: .end, style: headerStyle),
              ),
              widthBox(8),
              SizedBox(
                width: _pctColWidth,
                child: Text('%', textAlign: .end, style: headerStyle),
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

// ─── Customer lifetime value (dummy data) ──────────────────────────────────

class _LtvRow {
  final String name;
  final double value;

  const _LtvRow(this.name, this.value);
}

const _ltvTotal = 1781412326.0;
const _ltvAverage = 84829158.0;
const _ltvHighest = 811106116.0;

const _topByLtv = <_LtvRow>[
  _LtvRow('Pepsico Int', 811106116),
  _LtvRow('HR Trader & Comission', 556241345),
  _LtvRow('Usman Nagori Karachi', 81898064),
  _LtvRow('Akhtar & Ibrar Nagori', 75611869),
  _LtvRow('Herat Import & Export Inc Canada', 42266170),
];

class _LtvCard extends StatelessWidget {
  const _LtvCard();

  static const _valueColWidth = 96.0;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Customer Lifetime Value (LTV)',
      icon: Iconsax.wallet_money,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: _LtvTile(
                  label: 'Total LTV',
                  value: _ltvTotal,
                  color: AppColors.accentBlue,
                ),
              ),
              widthBox(8),
              Expanded(
                child: _LtvTile(
                  label: 'Avg. LTV',
                  value: _ltvAverage,
                  color: AppColors.greenDark,
                ),
              ),
              widthBox(8),
              Expanded(
                child: _LtvTile(
                  label: 'Highest',
                  value: _ltvHighest,
                  color: AppColors.marigold,
                ),
              ),
            ],
          ),
          heightBox(16),
          Text(
            'Top 5 by LTV',
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 11,
              fontWeight: .w600,
            ),
          ),
          heightBox(8),
          Divider(height: 1, color: context.navyBorder),
          for (final r in _topByLtv) ...[
            heightBox(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    r.name,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w600,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
                widthBox(8),
                SizedBox(
                  width: _valueColWidth,
                  child: Text(
                    r.value.withCommas,
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
            if (r != _topByLtv.last) ...[
              heightBox(10),
              Divider(height: 1, color: context.navyBorder),
            ],
          ],
        ],
      ),
    );
  }
}

class _LtvTile extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _LtvTile({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.16 : 0.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: color,
              fontSize: 10,
              fontWeight: .w600,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          heightBox(5),
          // Compacted because the full figure (1,781,412,326) can't fit in a
          // third of a phone's width — the Top 5 rows below carry the exact
          // numbers.
          Text(
            value.toCompact(decimals: 1),
            style: context.bodyMedium.copyWith(
              color: context.textPrimary,
              fontWeight: .w700,
              fontSize: 14,
              height: 1,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }
}
