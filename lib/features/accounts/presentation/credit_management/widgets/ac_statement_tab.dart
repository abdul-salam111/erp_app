import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../accounts/domain/entities/ledger_statement_entity.dart';

class AcStatementTab extends StatelessWidget {
  const AcStatementTab({super.key});

  static final _mockStatements = [
    LedgerStatementEntity(
      finYearId: 2,
      ttlDebit: 9200,
      ttlCredit: 5000,
      balance: 4200,
      finYear: const LedgerFinYearEntity(id: 2, name: 'FY 2024-25'),
      ledgerTypes: [
        LedgerTypeEntity(
          type: 'Sales',
          ttlDebit: 9200,
          ttlCredit: 0,
          balance: 9200,
          ledgers: [
            const LedgerEntryEntity(
              isOpening: true,
              drAmount: 0,
              crAmount: 4000,
              balance: -4000,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2401',
              docDate: DateTime(2024, 8, 15),
              drAmount: 4200,
              crAmount: 0,
              balance: 200,
              featureId: 1,
              parentEntityId: 1,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2402',
              docDate: DateTime(2024, 10, 3),
              drAmount: 3800,
              crAmount: 0,
              balance: 4000,
              featureId: 1,
              parentEntityId: 2,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2403',
              docDate: DateTime(2025, 1, 20),
              drAmount: 1200,
              crAmount: 0,
              balance: 5200,
              featureId: 1,
              parentEntityId: 3,
            ),
          ],
        ),
        LedgerTypeEntity(
          type: 'Payments',
          ttlDebit: 0,
          ttlCredit: 5000,
          balance: -5000,
          ledgers: [
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2401',
              docDate: DateTime(2024, 9, 1),
              drAmount: 0,
              crAmount: 3000,
              balance: 2200,
              featureId: 2,
              parentEntityId: 4,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2402',
              docDate: DateTime(2024, 11, 14),
              drAmount: 0,
              crAmount: 2000,
              balance: 200,
              featureId: 2,
              parentEntityId: 5,
            ),
          ],
        ),
      ],
    ),
    LedgerStatementEntity(
      finYearId: 1,
      ttlDebit: 12000,
      ttlCredit: 12000,
      balance: 0,
      finYear: const LedgerFinYearEntity(id: 1, name: 'FY 2023-24'),
      ledgerTypes: [
        LedgerTypeEntity(
          type: 'Sales',
          ttlDebit: 12000,
          ttlCredit: 0,
          balance: 12000,
          ledgers: [
            const LedgerEntryEntity(
              isOpening: true,
              drAmount: 0,
              crAmount: 0,
              balance: 0,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2301',
              docDate: DateTime(2023, 8, 10),
              drAmount: 7500,
              crAmount: 0,
              balance: 7500,
              featureId: 1,
              parentEntityId: 6,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2302',
              docDate: DateTime(2024, 2, 5),
              drAmount: 4500,
              crAmount: 0,
              balance: 12000,
              featureId: 1,
              parentEntityId: 7,
            ),
          ],
        ),
        LedgerTypeEntity(
          type: 'Payments',
          ttlDebit: 0,
          ttlCredit: 12000,
          balance: -12000,
          ledgers: [
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2301',
              docDate: DateTime(2023, 10, 20),
              drAmount: 0,
              crAmount: 7500,
              balance: 4500,
              featureId: 2,
              parentEntityId: 8,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2302',
              docDate: DateTime(2024, 3, 15),
              drAmount: 0,
              crAmount: 4500,
              balance: 0,
              featureId: 2,
              parentEntityId: 9,
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: context.pagePadding.left,
        right: context.pagePadding.right,
        top: 12,
        bottom: 16,
      ),
      children: [
        const _SectionLabel(text: AppConstants.statementsBtn),
        const SizedBox(height: 8),
        for (final yearData in _mockStatements) ...[
          _YearCard(yearData: yearData),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: context.labelSmall.copyWith(
        fontSize: 11,
        fontWeight: .w500,
        color: context.textSecondary,
        letterSpacing: 0.8,
      ),
    );
  }
}

// ─── Paged entry helper ───────────────────────────────────────────────────────

class _PagedEntry {
  final String type;
  final LedgerEntryEntity entry;
  const _PagedEntry({required this.type, required this.entry});
}

// ─── Year card ────────────────────────────────────────────────────────────────

class _YearCard extends StatefulWidget {
  final LedgerStatementEntity yearData;
  const _YearCard({required this.yearData});

  @override
  State<_YearCard> createState() => _YearCardState();
}

class _YearCardState extends State<_YearCard> {
  bool _expanded = true;

  List<_PagedEntry> _buildFlatEntries() {
    final result = <_PagedEntry>[];
    for (final lt in (widget.yearData.ledgerTypes ?? [])) {
      if ((lt.ledgers ?? []).isEmpty) continue;
      if (lt.ttlDebit == 0 && lt.ttlCredit == 0 && lt.balance == 0) continue;
      for (final l in (lt.ledgers ?? [])) {
        result.add(_PagedEntry(type: lt.type ?? '', entry: l));
      }
    }
    return result;
  }

  List<Widget> _buildPagedRows(List<_PagedEntry> entries, BuildContext context) {
    final widgets = <Widget>[];
    String? lastType;
    for (final pe in entries) {
      if (pe.type != lastType) {
        lastType = pe.type;
        if (pe.type.isNotEmpty) {
          widgets.add(
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                border: Border(top: BorderSide(color: context.border)),
              ),
              child: Text(
                pe.type.toUpperCase(),
                style: context.labelSmall.copyWith(
                  fontWeight: .w600,
                  color: context.textSecondary,
                  fontSize: 10,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          );
        }
      }
      widgets.add(_LedgerRow(ledger: pe.entry));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final yearData = widget.yearData;
    final allEntries = _buildFlatEntries();
    final hasContent = allEntries.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: .all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Year header ──────────────────────────────────────────
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: context.white,
                borderRadius: _expanded
                    ? const BorderRadius.vertical(top: Radius.circular(10))
                    : .circular(10),
                border: _expanded
                    ? Border(bottom: BorderSide(color: context.border))
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      yearData.finYear?.name ?? '',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        color: context.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      Text(
                        _formatBalance(context, (yearData.balance ?? 0).toDouble()),
                        style: context.bodySmall.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            'Rs. ${(yearData.ttlDebit ?? 0).toDouble().formatPrice()} Dr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rs. ${(yearData.ttlCredit ?? 0).toDouble().formatPrice()} Cr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: AppColors.grey400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Entries ──────────────────────────────────────────────
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOutCubic,
            alignment: .topCenter,
            child: _expanded
                ? hasContent
                      ? Column(
                          crossAxisAlignment: .start,
                          children: _buildPagedRows(allEntries, context),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            AppConstants.noLedgerDataAvailable,
                            style: context.bodySmall.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                        )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ─── Ledger row ───────────────────────────────────────────────────────────────

class _LedgerRow extends StatelessWidget {
  final LedgerEntryEntity ledger;
  const _LedgerRow({required this.ledger});

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

    final Color iconBg;
    final Color iconColor;
    final IconData iconData;
    if (isOpening) {
      iconBg = AppColors.grey100;
      iconColor = AppColors.grey500;
      iconData = Icons.horizontal_rule_rounded;
    } else if (isDrOnly) {
      iconBg = AppColors.debitContainer;
      iconColor = AppColors.debitRed;
      iconData = Icons.arrow_upward_rounded;
    } else if (isCrOnly) {
      iconBg = AppColors.creditContainer;
      iconColor = AppColors.creditGreen;
      iconData = Icons.arrow_downward_rounded;
    } else {
      iconBg = context.primary.withValues(alpha: 0.12);
      iconColor = context.primary;
      iconData = Icons.swap_horiz_rounded;
    }

    final String amountText;
    final Color amountColor;
    if (isOpening) {
      final val = drAmt > 0 ? drAmt : crAmt;
      amountText = val.formatPrice();
      amountColor = AppColors.grey600;
    } else if (isDrOnly) {
      amountText = drAmt.formatPrice();
      amountColor = AppColors.debitRed;
    } else if (isCrOnly) {
      amountText = crAmt.formatPrice();
      amountColor = AppColors.creditGreen;
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
      onTap: () => _openDetail(context, date, dr, cr),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: context.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: .circular(12),
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
                  Text(
                    isDrOnly
                        ? AppConstants.debit
                        : isCrOnly
                        ? AppConstants.credit
                        : AppConstants.drCr,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                if (!isOpening) const SizedBox(height: 2),
                Text(
                  amountText,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    color: amountColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  _formatBalance(context, (ledger.balance ?? 0).toDouble()),
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

  void _openDetail(BuildContext context, String date, String dr, String cr) {
    showDialog(
      context: context,
      builder: (_) => _LedgerDetailDialog(
        ledger: ledger,
        date: date,
        dr: dr,
        cr: cr,
      ),
    );
  }
}

// ─── Detail dialog ────────────────────────────────────────────────────────────

class _LedgerDetailDialog extends StatelessWidget {
  final LedgerEntryEntity ledger;
  final String date;
  final String dr;
  final String cr;

  const _LedgerDetailDialog({
    required this.ledger,
    required this.date,
    required this.dr,
    required this.cr,
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
              _InfoRow(label: AppConstants.docLabel, value: ledger.docNbr!),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            if (!isOpening && date.isNotEmpty) ...[
              _InfoRow(label: AppConstants.dateLabel, value: date),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],

            if (isOpening) ...[
              _AmountCard(
                label: AppConstants.openingBalance2,
                amount: 'Rs. ${hasDebit ? dr : cr}',
                bg: AppColors.grey100,
                color: AppColors.grey700,
              ),
            ] else ...[
              if (hasDebit) ...[
                _AmountCard(
                  label: AppConstants.debit,
                  amount: 'Rs. $dr',
                  bg: AppColors.debitContainer,
                  color: AppColors.debitRed,
                ),
                if (hasCredit) const SizedBox(height: 10),
              ],
              if (hasCredit)
                _AmountCard(
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
              _InfoRow(
                label: AppConstants.narrationLabel,
                value: ledger.narration!,
              ),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            _InfoRow(
              label: AppConstants.balanceAfterLabel,
              value: _formatBalance(context, (ledger.balance ?? 0).toDouble()),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.textSecondary,
                  side: BorderSide(color: context.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(AppConstants.close, style: context.bodySmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Amount card ──────────────────────────────────────────────────────────────

class _AmountCard extends StatelessWidget {
  final String label;
  final String amount;
  final Color bg;
  final Color color;

  const _AmountCard({
    required this.label,
    required this.amount,
    required this.bg,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(color: bg, borderRadius: .circular(12)),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: color.withValues(alpha: 0.75),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: context.titleSmall.copyWith(
              fontWeight: .w700,
              color: color,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Info row ─────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          label,
          style: context.bodySmall.copyWith(
            color: context.textSecondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            textAlign: .end,
            softWrap: true,
            style: context.bodySmall.copyWith(
              fontWeight: .w500,
              color: context.textPrimary,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Helper ───────────────────────────────────────────────────────────────────

String _formatBalance(BuildContext context, double balance) {
  final abs = balance.abs();
  final suffix = balance >= 0 ? AppConstants.dr : AppConstants.cr;
  return 'Rs. ${abs.formatPrice()} $suffix';
}
