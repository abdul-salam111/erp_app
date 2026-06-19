import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class BankAndCashPositionView extends StatelessWidget {
  const BankAndCashPositionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BankAndCashPositionBloc>(),
      child: const _BankAndCashPositionBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _BankAndCashPositionBody extends StatefulWidget {
  const _BankAndCashPositionBody();

  @override
  State<_BankAndCashPositionBody> createState() =>
      _BankAndCashPositionBodyState();
}

class _BankAndCashPositionBodyState extends State<_BankAndCashPositionBody> {
  late final ScrollController _scrollController;
  bool _collapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.position.pixels > 80;
    if (collapsed != _collapsed) setState(() => _collapsed = collapsed);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAndCashPositionBloc, BankAndCashPositionState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(
            context,
            state.message ?? AppConstants.somethingWentWrong,
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state.apiStatus == ApiStatus.LOADING ||
            state.apiStatus == ApiStatus.INITIAL;
        final items = state.items;

        final bankTotal = items
            .where((e) => e.isBank)
            .fold(0.0, (s, e) => s + e.amount);
        final cashTotal = items
            .where((e) => e.isCash)
            .fold(0.0, (s, e) => s + e.amount);

        return Scaffold(
          backgroundColor: context.grey50,
          appBar: CustomAppBar(title: AppConstants.bankCashPositionLabel),
          body: Column(
            crossAxisAlignment: .stretch,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: _collapsed
                    ? const SizedBox.shrink()
                    : ColoredBox(
                        color: context.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: isLoading
                              ? _HeroCardShimmer()
                              : _HeroCard(items: items),
                        ),
                      ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: _collapsed
                    ? const SizedBox.shrink()
                    : _SummaryRow(items: items, isLoading: isLoading),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: (_collapsed && !isLoading)
                    ? _CompactTotalsBar(
                        bankTotal: bankTotal,
                        cashTotal: cashTotal,
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: isLoading
                    ? _BankListShimmer()
                    : _BankList(
                        items: items,
                        scrollController: _scrollController,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Hero card ────────────────────────────────────────────────────────────────

class _HeroCard extends StatelessWidget {
  final List<BankCashItemEntity> items;
  const _HeroCard({required this.items});

  static const _lineColor = AppColors.chartPrimary;

  String _compact(double v) {
    final abs = v.abs();
    if (abs >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (abs >= 1000) return '${(v / 1000).toStringAsFixed(1)}K';
    return v.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final orderedItems = items.reversed.toList();
    final spots = orderedItems
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.amount.abs()))
        .toList();

    final amounts = orderedItems.map((e) => e.amount.abs()).toList();
    final rawMin = amounts.reduce(min);
    final rawMax = amounts.reduce(max);
    final pad = (rawMax - rawMin) * 0.18;
    final minY = rawMin - pad;
    final maxY = rawMax + pad;
    final interval = (maxY - minY) / 4;

    final chartWidth = max(
      MediaQuery.sizeOf(context).width - 12,
      orderedItems.length * 72.0,
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(6, 6, 6, 0),
      height: context.screenHeight * 0.30,
      decoration: const BoxDecoration(),
      clipBehavior: .hardEdge,
      child: Row(
        children: [
          // ── Fixed Y axis ─────────────────────────────────────
          SizedBox(
            width: 50,
            child: LineChart(
              LineChartData(
                minY: minY,
                maxY: maxY,
                lineTouchData: const LineTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      interval: interval > 0 ? interval : 1,
                      getTitlesWidget: (value, meta) {
                        if (value == meta.min || value == meta.max) {
                          return const SizedBox.shrink();
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            _compact(value),
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Colors.transparent,
                    barWidth: 0,
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          // ── Scrollable chart ──────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 12,right: 12),
                child: SizedBox(
                  width: chartWidth,
                  child: LineChart(
                    LineChartData(
                      minY: minY,
                      maxY: maxY,
                      lineTouchData: LineTouchData(
                        enabled: true,
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (_) => context.surface,
                          tooltipRoundedRadius: 8,
                          tooltipBorder: BorderSide(color: context.border),
                          getTooltipItems: (spots) => spots
                              .map(
                                (s) => LineTooltipItem(
                                  _compact(s.y),
                                  context.labelSmall.copyWith(
                                    color: context.textPrimary,
                                    fontWeight: .w700,
                                    fontSize: 11,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: interval > 0 ? interval : 1,
                        getDrawingHorizontalLine: (_) => FlLine(
                          color: AppColors.border.withValues(alpha: 0.6),
                          strokeWidth: 1,
                          dashArray: [4, 4],
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          curveSmoothness: 0.35,
                          color: _lineColor,
                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, bar, index) =>
                                FlDotCirclePainter(
                                  radius: 3.5,
                                  color: _lineColor,
                                  strokeWidth: 1.5,
                                  strokeColor: AppColors.white,
                                ),
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                _lineColor.withValues(alpha: 0.22),
                                _lineColor.withValues(alpha: 0.0),
                              ],
                              begin: .topCenter,
                              end: .bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ), // LineChartData
                  ), // LineChart
                ),
              ), // SizedBox(width: chartWidth)
            ), // SingleChildScrollView
          ), // Expanded
        ], // Row children
      ), // Row
    ); // Container
  }
}

class _HeroCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .fromLTRB(12, 12, 12, 0),
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(borderRadius: .circular(20)),
      clipBehavior: .hardEdge,
      child: ShimmerBox(
        height: double.infinity,
        width: double.infinity,
        radius: 20,
      ),
    );
  }
}

// ─── Summary row ──────────────────────────────────────────────────────────────

class _SummaryRow extends StatelessWidget {
  final List<BankCashItemEntity> items;
  final bool isLoading;
  const _SummaryRow({required this.items, required this.isLoading});

  static const _bankColor = AppColors.chartPrimary;
  static const _cashColor = AppColors.green;

  @override
  Widget build(BuildContext context) {
    final bankTotal = items
        .where((e) => e.isBank)
        .fold(0.0, (sum, e) => sum + e.amount);
    final cashTotal = items
        .where((e) => e.isCash)
        .fold(0.0, (sum, e) => sum + e.amount);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      child: Row(
        children: [
          Expanded(
            child: _SummaryCard(
              label: AppConstants.bankLabel,
              amount: bankTotal,
              color: _bankColor,
              icon: Icons.account_balance_outlined,
              isLoading: isLoading,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _SummaryCard(
              label: AppConstants.cashLabel,
              amount: cashTotal,
              color: _cashColor,
              icon: Icons.payments_outlined,
              isLoading: isLoading,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;
  final IconData icon;
  final bool isLoading;
  const _SummaryCard({
    required this.label,
    required this.amount,
    required this.color,
    required this.icon,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(14),
        border: .all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isLoading
          ? Column(
              crossAxisAlignment: .start,
              children: [
                ShimmerBox(height: 13, width: 60, radius: 4),
                const SizedBox(height: 8),
                ShimmerBox(height: 16, width: double.infinity, radius: 4),
              ],
            )
          : Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 13, color: color),
                    const SizedBox(width: 4),
                    Text(
                      label,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontWeight: .w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  amount.abs().withCommas,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
    );
  }
}

// ─── Compact totals bar (shown when hero is collapsed) ────────────────────────

class _CompactTotalsBar extends StatelessWidget {
  final double bankTotal;
  final double cashTotal;
  const _CompactTotalsBar({required this.bankTotal, required this.cashTotal});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const Icon(
              Icons.account_balance_outlined,
              size: 13,
              color: AppColors.chartPrimary,
            ),
            const SizedBox(width: 5),
            Text(
              AppConstants.bankLabel,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontWeight: .w600,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              bankTotal.abs().withCommas,
              style: context.labelSmall.copyWith(
                color: context.textPrimary,
                fontWeight: .w700,
              ),
            ),
            const SizedBox(width: 18),
            const Icon(
              Icons.payments_outlined,
              size: 13,
              color: AppColors.green,
            ),
            const SizedBox(width: 5),
            Text(
              AppConstants.cashLabel,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontWeight: .w600,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              cashTotal.abs().withCommas,
              style: context.labelSmall.copyWith(
                color: context.textPrimary,
                fontWeight: .w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Bank list ────────────────────────────────────────────────────────────────

class _BankList extends StatelessWidget {
  final List<BankCashItemEntity> items;
  final ScrollController scrollController;
  const _BankList({required this.items, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .fromLTRB(0, 0, 0, 12),
      decoration: BoxDecoration(
        color: context.white,
        border: .all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: .hardEdge,
      child: ListView.separated(
        controller: scrollController,
        padding: .zero,
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, thickness: 1, color: context.border, indent: 62),
        itemBuilder: (context, i) => _BankTile(item: items[i]),
      ),
    );
  }
}

// ─── Bank tile ────────────────────────────────────────────────────────────────

class _BankTile extends StatelessWidget {
  final BankCashItemEntity item;
  const _BankTile({required this.item});

  static const _avatarColors = <Color>[
    AppColors.errorBright,
    AppColors.indigo,
    AppColors.orange,
    AppColors.teal,
    AppColors.blueGrey,
    AppColors.brown,
    AppColors.cyan,
    AppColors.info,
    AppColors.green,
    AppColors.purple,
  ];

  Color _avatarColor(String name) =>
      _avatarColors[name.hashCode.abs() % _avatarColors.length];

  String _initials(String name) {
    final parts = name.trim().split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final color = _avatarColor(item.accountTitle);
    final initials = _initials(item.accountTitle);
    final isCredit = item.isCredit;
    final typeColor = isCredit
        ? AppColors.creditGreenDark
        : AppColors.chartSecondary;
    final typeBg = isCredit
        ? AppColors.creditGreenDark.withValues(alpha: 0.10)
        : AppColors.chartSecondary.withValues(alpha: 0.10);

    return Padding(
      padding: const .symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // ── Rounded square avatar ────────────────────────────
          Container(
            width: 42,
            height: 42,
            alignment: .center,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: .circular(10),
            ),
            child: Text(
              initials,
              style: context.labelSmall.copyWith(
                color: color,
                fontWeight: .w700,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // ── Name + account number ─────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  item.accountTitle,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                    fontSize: 13,
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                if (item.accountNbr.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    item.accountNbr,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),

          // ── Amount + Cr/Dr pill ───────────────────────────────
          Column(
            crossAxisAlignment: .end,
            mainAxisSize: .min,
            children: [
              Text(
                item.amount.abs().withCommas,
                style: context.bodySmall.copyWith(
                  fontWeight: .w700,
                  color: context.textPrimary,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const .symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: typeBg,
                  borderRadius: .circular(20),
                ),
                child: Text(
                  isCredit ? AppConstants.credit : AppConstants.debit,
                  style: context.labelSmall.copyWith(
                    color: typeColor,
                    fontWeight: .w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Shimmer ──────────────────────────────────────────────────────────────────

class _BankListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .fromLTRB(0, 0, 0, 12),
      decoration: BoxDecoration(
        color: context.white,
        border: Border.all(color: context.border),
      ),
      clipBehavior: .hardEdge,
      child: ListView.separated(
        padding: .zero,
        itemCount: 7,
        separatorBuilder: (_, __) =>
            Divider(height: 1, thickness: 1, color: context.border, indent: 62),
        itemBuilder: (_, __) => Padding(
          padding: const .symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              ShimmerBox(height: 42, width: 42, radius: 10),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    ShimmerBox(height: 13, width: double.infinity, radius: 4),
                    const SizedBox(height: 5),
                    ShimmerBox(height: 11, width: 100, radius: 4),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: .end,
                mainAxisSize: .min,
                children: [
                  ShimmerBox(height: 13, width: 70, radius: 4),
                  const SizedBox(height: 5),
                  ShimmerBox(height: 18, width: 48, radius: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
