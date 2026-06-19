import 'package:flutter/material.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';

class BankAndCashCompactTotalsBar extends StatelessWidget {
  final double bankTotal;
  final double cashTotal;
  const BankAndCashCompactTotalsBar({
    super.key,
    required this.bankTotal,
    required this.cashTotal,
  });

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
