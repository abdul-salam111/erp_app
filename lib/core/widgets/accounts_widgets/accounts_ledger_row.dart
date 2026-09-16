import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../../../features/accounts/domain/entities/shared/ledger_entry_base.dart';

class AccountsLedgerRow extends StatelessWidget {
  final LedgerEntryBase ledger;
  final void Function(BuildContext ctx, String date, String dr, String cr) onTap;

  const AccountsLedgerRow({super.key, required this.ledger, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isOpening = ledger.isOpening ?? false;
    final drAmt = (ledger.drAmount ?? 0).toDouble();
    final crAmt = (ledger.crAmount ?? 0).toDouble();
    final isDrOnly = drAmt > 0 && crAmt == 0;
    final isCrOnly = crAmt > 0 && drAmt == 0;

    final docDate = ledger.docDate;
    final date = (!isOpening && docDate != null && docDate.year > 1)
        ? DateFormat(AppConstants.ddMMMYyyyLabel).format(docDate)
        : '';

    final dr = drAmt == 0 ? '0.0' : drAmt.formatPrice();
    final cr = crAmt == 0 ? '0.0' : crAmt.formatPrice();

    final rowBalance = (ledger.balance ?? 0).toDouble();
    final rowBalanceText =
        '${rowBalance.abs().formatPrice()} '
        '${rowBalance >= 0 ? AppConstants.dr : AppConstants.cr}';

    final debitFg = context.debitColor;
    final creditFg = context.creditColor;

    final Color iconColor;
    final IconData iconData;
    if (isOpening) {
      iconColor = context.textSecondary;
      iconData = Icons.horizontal_rule_rounded;
    } else if (isDrOnly) {
      iconColor = debitFg;
      iconData = Icons.arrow_upward_rounded;
    } else if (isCrOnly) {
      iconColor = creditFg;
      iconData = Icons.arrow_downward_rounded;
    } else {
      iconColor = context.primary;
      iconData = Icons.swap_horiz_rounded;
    }

    final String amountText;
    final Color amountColor;
    if (isOpening) {
      final val = drAmt > 0 ? drAmt : crAmt;
      amountText = val.formatPrice();
      amountColor = context.textSecondary;
    } else if (isDrOnly) {
      amountText = drAmt.formatPrice();
      amountColor = debitFg;
    } else if (isCrOnly) {
      amountText = crAmt.formatPrice();
      amountColor = creditFg;
    } else {
      amountText = '${drAmt.formatPrice()} / ${crAmt.formatPrice()}';
      amountColor = context.textPrimary;
    }

    final title = isOpening
        ? AppConstants.openingBalance
        : [
            if (ledger.featureName?.isNotEmpty == true) ledger.featureName!,
            if (ledger.docNbr?.isNotEmpty == true) ledger.docNbr!,
          ].join(' • ');

    return InkWell(
      onTap: () => onTap(context, date, dr, cr),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: (context.isDark ? context.navyBorder : context.border)
                  .withValues(alpha: 0.5),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                gradient: RadialGradient(
                  colors: [
                    iconColor.withValues(alpha: 0.28),
                    iconColor.withValues(alpha: 0.06),
                  ],
                ),
              ),
              child: Icon(iconData, size: 18, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w600,
                      color: context.textPrimary,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  if (date.isNotEmpty || isOpening) ...[
                    const SizedBox(height: 3),
                    Text(
                      isOpening ? '---' : date,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: .end,
              children: [
                if (!isOpening)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: .circular(999),
                      color: amountColor.withValues(alpha: 0.14),
                    ),
                    child: Text(
                      isDrOnly
                          ? AppConstants.debit.toUpperCase()
                          : isCrOnly
                              ? AppConstants.credit.toUpperCase()
                              : AppConstants.drCr.toUpperCase(),
                      style: context.labelSmall.copyWith(
                        color: amountColor,
                        fontSize: 9,
                        fontWeight: .w700,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                if (!isOpening) const SizedBox(height: 4),
                Text(
                  amountText,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w800,
                    color: amountColor,
                    fontSize: 14,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  rowBalanceText,
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
    );
  }
}
