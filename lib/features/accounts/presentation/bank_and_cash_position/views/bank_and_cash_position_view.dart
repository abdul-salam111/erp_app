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

class _BankAndCashPositionBody extends StatelessWidget {
  const _BankAndCashPositionBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAndCashPositionBloc, BankAndCashPositionState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(
              context, state.message ?? 'Something went wrong');
        }
      },
      builder: (context, state) {
        final isLoading = state.apiStatus == ApiStatus.LOADING ||
            state.apiStatus == ApiStatus.INITIAL;
        final items = state.items;

        return Scaffold(
          backgroundColor: context.grey50,
          appBar: CustomAppBar(title: 'Bank & Cash Position'),
          body: Column(
            crossAxisAlignment: .stretch,
            children: [
              ColoredBox(
                color: context.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: isLoading
                      ? _HeroCardShimmer()
                      : _HeroCard(items: items),
                ),
              ),
              _SectionLabel(count: items.length, isLoading: isLoading),
              Expanded(
                child: isLoading
                    ? _BankListShimmer()
                    : _BankList(items: items),
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

  static const _creditColor = AppColors.chartPrimary;
  static const _debitColor = AppColors.chartSecondary;
  static const _bgColor = AppColors.chartBg;

  static double _log(double v) => v > 0 ? log(v + 1) : 0;

  @override
  Widget build(BuildContext context) {
    final maxLog = items.fold(
      0.0,
      (m, b) => _log(b.amount.abs()) > m ? _log(b.amount.abs()) : m,
    );

    return Container(
      margin: const .fromLTRB(12, 12, 12, 0),
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: .circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: .hardEdge,
      child: BarChart(
        BarChartData(
          backgroundColor: AppColors.transparent,
          minY: 0,
          maxY: maxLog > 0 ? maxLog * 1.2 : 1,
          barTouchData: BarTouchData(enabled: false),
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          groupsSpace: 4,
          barGroups: List.generate(
            items.length,
            (i) => BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: _log(items[i].amount.abs()),
                  color: items[i].isCredit ? _creditColor : _debitColor,
                  width: 14,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .fromLTRB(12, 12, 12, 0),
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(
        borderRadius: .circular(20),
      ),
      clipBehavior: .hardEdge,
      child: ShimmerBox(
        height: double.infinity,
        width: double.infinity,
        radius: 20,
      ),
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final int count;
  final bool isLoading;
  const _SectionLabel({required this.count, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(16, 16, 16, 6),
      child: Row(
        children: [
          Text(
            'All Accounts',
            style: context.bodySmall.copyWith(
              fontWeight: .w700,
              color: context.textPrimary,
              fontSize: 14,
            ),
          ),
          if (!isLoading && count > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const .symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: context.primary.withValues(alpha: 0.10),
                borderRadius: .circular(20),
              ),
              child: Text(
                '$count',
                style: context.labelSmall.copyWith(
                  color: context.primary,
                  fontWeight: .w700,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Bank list ────────────────────────────────────────────────────────────────

class _BankList extends StatelessWidget {
  final List<BankCashItemEntity> items;
  const _BankList({required this.items});

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
        padding: .zero,
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          thickness: 1,
          color: context.border,
          indent: 62,
        ),
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
    AppColors.errorBright, AppColors.indigo,    AppColors.orange,
    AppColors.teal,        AppColors.blueGrey,  AppColors.brown,
    AppColors.cyan,        AppColors.info,       AppColors.green,
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
    final typeColor =
        isCredit ? AppColors.creditGreenDark : AppColors.chartSecondary;
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
                  isCredit ? 'Credit' : 'Debit',
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
        separatorBuilder: (_, __) => Divider(
          height: 1,
          thickness: 1,
          color: context.border,
          indent: 62,
        ),
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
