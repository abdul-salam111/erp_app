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
        mainAxisSize: .min,
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
          heightBox(4),
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
                yValueMapper: (d, _) => d.value,
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
