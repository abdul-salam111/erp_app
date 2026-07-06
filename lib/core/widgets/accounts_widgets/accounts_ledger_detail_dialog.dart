import 'package:flutter/material.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../../features/accounts/domain/entities/shared/ledger_entry_base.dart';
import 'accounts_amount_card.dart';
import 'ledger_formate_balance.dart';
import 'accounts_info_row.dart';

class AccountsLedgerDetailDialog extends StatelessWidget {
  final LedgerEntryBase ledger;
  final String date;
  final String dr;
  final String cr;
  final Widget bottomSection;
  final String? subjectLabel;
  final String? subjectName;

  const AccountsLedgerDetailDialog({
    super.key,
    required this.ledger,
    required this.date,
    required this.dr,
    required this.cr,
    required this.bottomSection,
    this.subjectLabel,
    this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    final isOpening = ledger.isOpening ?? false;
    final hasDebit = dr != '0.0';
    final hasCredit = cr != '0.0';

    final Color accentColor;
    final IconData directionIcon;
    if (isOpening) {
      accentColor = AppColors.grey500;
      directionIcon = Icons.horizontal_rule_rounded;
    } else if (hasDebit && !hasCredit) {
      accentColor = AppColors.debitRed;
      directionIcon = Icons.arrow_upward_rounded;
    } else if (!hasDebit && hasCredit) {
      accentColor = AppColors.creditGreen;
      directionIcon = Icons.arrow_downward_rounded;
    } else {
      accentColor = context.primary;
      directionIcon = Icons.swap_horiz_rounded;
    }

    final String typeLabel = isOpening
        ? AppConstants.openingBalance2
        : hasDebit && !hasCredit
            ? AppConstants.debitTransaction
            : !hasDebit && hasCredit
                ? AppConstants.creditTransaction
                : AppConstants.drCrTransaction;

    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.10),
                borderRadius: .circular(20),
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(directionIcon, size: 13, color: accentColor),
                  const SizedBox(width: 5),
                  Text(
                    typeLabel,
                    style: context.labelSmall.copyWith(
                      fontWeight: .w600,
                      color: accentColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (!isOpening && ledger.docNbr != null) ...[
              AccountsInfoRow(label: AppConstants.docLabel, value: ledger.docNbr!),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            if (subjectLabel != null && subjectName != null && subjectName!.isNotEmpty) ...[
              AccountsInfoRow(label: subjectLabel!, value: subjectName!),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            if (!isOpening && date.isNotEmpty) ...[
              AccountsInfoRow(label: AppConstants.dateLabel, value: date),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            if (isOpening) ...[
              AccountsAmountCard(
                label: AppConstants.openingBalance2,
                amount: 'Rs. ${hasDebit ? dr : cr}',
                bg: AppColors.grey100,
                color: AppColors.grey700,
              ),
            ] else ...[
              if (hasDebit) ...[
                AccountsAmountCard(
                  label: AppConstants.debit,
                  amount: 'Rs. $dr',
                  bg: AppColors.debitContainer,
                  color: AppColors.debitRed,
                ),
                if (hasCredit) const SizedBox(height: 10),
              ],
              if (hasCredit)
                AccountsAmountCard(
                  label: AppConstants.credit,
                  amount: 'Rs. $cr',
                  bg: AppColors.creditContainer,
                  color: AppColors.creditGreen,
                ),
            ],
            const SizedBox(height: 16),
            Divider(color: context.border, height: 1),
            const SizedBox(height: 14),
            if (!isOpening && (ledger.narration?.isNotEmpty ?? false)) ...[
              AccountsInfoRow(label: AppConstants.narrationLabel, value: ledger.narration!),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            AccountsInfoRow(
              label: AppConstants.balanceAfterLabel,
              value: formatAccountsBalance((ledger.balance ?? 0).toDouble()),
            ),
            const SizedBox(height: 20),
            bottomSection,
          ],
        ),
      ),
    );
  }
}
