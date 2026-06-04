import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

// ─── Model ────────────────────────────────────────────────────────────────────

class _BankItem {
  final String name;
  final String account;
  final double amount;
  final bool isCredit;

  const _BankItem({
    required this.name,
    required this.account,
    required this.amount,
    required this.isCredit,
  });
}

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

  static const _banks = <_BankItem>[
    _BankItem(name: 'AAA Bank', account: 'N/A', amount: 934750, isCredit: true),
    _BankItem(name: 'Allied Bank Limited', account: '0010053308630015', amount: 2707575, isCredit: true),
    _BankItem(name: 'Askari Bank Limited', account: '0000680420202575', amount: 47351, isCredit: false),
    _BankItem(name: 'Bank Al Falah Limited', account: '0069-1006660446', amount: 8316246, isCredit: false),
    _BankItem(name: 'Bank Al Habib Limited', account: '00235008100788001', amount: 1250000, isCredit: true),
    _BankItem(name: 'Habib Bank Limited', account: '01234567890123', amount: 3250000, isCredit: true),
    _BankItem(name: 'MCB Bank Limited', account: '1234567890123456', amount: 890000, isCredit: false),
    _BankItem(name: 'National Bank of Pakistan', account: '4567890123456789', amount: 550000, isCredit: true),
    _BankItem(name: 'United Bank Limited', account: '7890123456789012', amount: 2100000, isCredit: false),
    _BankItem(name: 'Meezan Bank Limited', account: '3456789012345678', amount: 4750000, isCredit: true),
    _BankItem(name: 'Faysal Bank Limited', account: '9012345678901234', amount: 320000, isCredit: false),
    _BankItem(name: 'Bank Islami Pakistan', account: '5678901234567890', amount: 1890000, isCredit: true),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAndCashPositionBloc, BankAndCashPositionState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message ?? 'Something went wrong');
        }
      },
      builder: (context, state) {
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
                  child: _HeroCard(banks: _banks),
                ),
              ),
              _SectionLabel(count: _banks.length),
              Expanded(child: _BankList(banks: _banks)),
            ],
          ),
        );
      },
    );
  }
}

// ─── Hero card ────────────────────────────────────────────────────────────────

class _HeroCard extends StatelessWidget {
  final List<_BankItem> banks;
  const _HeroCard({required this.banks});

  static const _creditColor = Color(0xFF6366F1);
  static const _debitColor = Color(0xFFC62828);
  static const _bgColor = Color(0xFFEEEEFF);

  @override
  Widget build(BuildContext context) {
    final maxAmount = banks.fold(0.0, (m, b) => b.amount > m ? b.amount : m);

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: .circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: .hardEdge,
      child: BarChart(
        BarChartData(
          backgroundColor: Colors.transparent,
          minY: 0,
          maxY: maxAmount * 1.2,
          barTouchData: BarTouchData(enabled: false),
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          groupsSpace: 4,
          barGroups: List.generate(
            banks.length,
            (i) => BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: banks[i].amount,
                  color: banks[i].isCredit ? _creditColor : _debitColor,
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

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final int count;
  const _SectionLabel({required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Row(
        children: [
          Text(
            'All Banks',
            style: context.bodySmall.copyWith(
              fontWeight: .w700,
              color: context.textPrimary,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
      ),
    );
  }
}

// ─── Bank list ────────────────────────────────────────────────────────────────

class _BankList extends StatelessWidget {
  final List<_BankItem> banks;
  const _BankList({required this.banks});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .fromLTRB(0, 0, 0, 12),
      decoration: BoxDecoration(
        color: context.white,

        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: .hardEdge,
      child: ListView.separated(
        padding: .zero,
        itemCount: banks.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          thickness: 1,
          color: context.border,
          indent: 62,
        ),
        itemBuilder: (context, i) => _BankTile(item: banks[i]),
      ),
    );
  }
}

// ─── Bank tile ────────────────────────────────────────────────────────────────

class _BankTile extends StatelessWidget {
  final _BankItem item;
  const _BankTile({required this.item});

  static const _avatarColors = <Color>[
    Color(0xFFE57373), Color(0xFF7986CB), Color(0xFFFF7043),
    Color(0xFF26A69A), Color(0xFF5C6BC0), Color(0xFF8D6E63),
    Color(0xFFEC407A), Color(0xFF42A5F5), Color(0xFF66BB6A),
    Color(0xFFAB47BC),
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
    final color = _avatarColor(item.name);
    final initials = _initials(item.name);
    final isCredit = item.isCredit;
    final typeColor = isCredit ? const Color(0xFF2E7D32) : const Color(0xFFC62828);
    final typeBg = isCredit
        ? const Color(0xFF2E7D32).withValues(alpha: 0.10)
        : const Color(0xFFC62828).withValues(alpha: 0.10);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                  item.name,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                    fontSize: 13,
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                if (item.account != 'N/A') ...[
                  const SizedBox(height: 2),
                  Text(
                    item.account,
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
                item.amount.withCommas,
                style: context.bodySmall.copyWith(
                  fontWeight: .w700,
                  color: context.textPrimary,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(16),
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
