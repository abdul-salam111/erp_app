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
