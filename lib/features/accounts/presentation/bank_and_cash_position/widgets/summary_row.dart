import 'package:flutter/material.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class BankAndCashSummaryRow extends StatelessWidget {
  final List<BankCashItemEntity> bankCashItems;
  final bool isLoading;
  const BankAndCashSummaryRow({
    super.key,
    required this.bankCashItems,
    required this.isLoading,
  });

  static const _bankColor = AppColors.chartPrimary;
  static const _cashColor = AppColors.green;

  @override
  Widget build(BuildContext context) {
    final bankTotal = bankCashItems
        .where((bankCashItem) => bankCashItem.isBank)
        .fold(0.0, (sum, bankCashItem) => sum + bankCashItem.amount);
    final cashTotal = bankCashItems
        .where((bankCashItem) => bankCashItem.isCash)
        .fold(0.0, (sum, bankCashItem) => sum + bankCashItem.amount);

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
    return GlassSurface(
      radius: 14,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: isLoading
          ? Column(
              crossAxisAlignment: .start,
              children: [
                ShimmerBox(height: 13, width: 60, radius: 4),
                const SizedBox(height: 8),
                ShimmerBox(height: 18, width: double.infinity, radius: 4),
              ],
            )
          : Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: .circle,
                    gradient: RadialGradient(
                      colors: [
                        color.withValues(alpha: 0.28),
                        color.withValues(alpha: 0.06),
                      ],
                    ),
                  ),
                  child: Icon(icon, color: color, size: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        label.toUpperCase(),
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontWeight: .w700,
                          fontSize: 10,
                          letterSpacing: 0.7,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        amount.abs().withCommas,
                        style: context.bodySmall.copyWith(
                          fontWeight: .w800,
                          color: context.textPrimary,
                          fontSize: 16,
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
    );
  }
}
