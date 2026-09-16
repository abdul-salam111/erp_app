import 'package:flutter/material.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class BankAndCashList extends StatelessWidget {
  final List<BankCashItemEntity> bankCashItems;
  final ScrollController scrollController;
  const BankAndCashList({
    super.key,
    required this.bankCashItems,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      child: GlassSurface(
        radius: 14,
        clipBehavior: .hardEdge,
        child: ListView.separated(
          controller: scrollController,
          padding: .zero,
          itemCount: bankCashItems.length,
          separatorBuilder: (_, __) => Divider(
            height: 1,
            thickness: 1,
            color: (context.isDark ? context.navyBorder : context.border)
                .withValues(alpha: 0.5),
            indent: 62,
          ),
          itemBuilder: (context, i) => _BankTile(item: bankCashItems[i]),
        ),
      ),
    );
  }
}

class BankAndCashListShimmer extends StatelessWidget {
  const BankAndCashListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      child: GlassSurface(
        radius: 14,
        clipBehavior: .hardEdge,
        child: ListView.separated(
          padding: .zero,
          itemCount: 7,
          separatorBuilder: (_, __) => Divider(
            height: 1,
            thickness: 1,
            color: (context.isDark ? context.navyBorder : context.border)
                .withValues(alpha: 0.5),
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
                      ShimmerBox(
                        height: 13,
                        width: double.infinity,
                        radius: 4,
                      ),
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
      ),
    );
  }
}

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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: .center,
            decoration: BoxDecoration(
              borderRadius: .circular(10),
              gradient: RadialGradient(
                colors: [
                  color.withValues(alpha: 0.30),
                  color.withValues(alpha: 0.06),
                ],
              ),
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
          Column(
            crossAxisAlignment: .end,
            mainAxisSize: .min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: typeBg,
                  borderRadius: .circular(999),
                ),
                child: Text(
                  (isCredit ? AppConstants.credit : AppConstants.debit)
                      .toUpperCase(),
                  style: context.labelSmall.copyWith(
                    color: typeColor,
                    fontWeight: .w700,
                    fontSize: 9,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.amount.abs().withCommas,
                style: context.bodySmall.copyWith(
                  fontWeight: .w800,
                  color: typeColor,
                  fontSize: 14,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
