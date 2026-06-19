import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class CashbookStatementsBody extends StatelessWidget {
  final List<LedgerStatementEntity> statements;
  final ScrollController? scrollController;

  const CashbookStatementsBody({super.key, required this.statements, this.scrollController});


  @override
  Widget build(BuildContext context) {
    return AccountsStatementsBody(
      scrollController: scrollController,
      yearCards: [
        for (final s in statements)
          AccountsYearCard(
            finYearName: s.finYear?.name ?? '',
            balance: (s.balance ?? 0).toDouble(),
            ttlDebit: (s.ttlDebit ?? 0).toDouble(),
            ttlCredit: (s.ttlCredit ?? 0).toDouble(),
            scrollController: scrollController,
            groups: [
              for (final lt in (s.ledgerTypes ?? []))
                if ((lt.ledgers ?? []).isNotEmpty &&
                    !(lt.ttlDebit == 0 && lt.ttlCredit == 0 && lt.balance == 0))
                  (type: lt.type ?? '', entries: (lt.ledgers ?? []).cast<LedgerEntryBase>()),
            ],
            rowBuilder: (entry) => AccountsLedgerRow(
              ledger: entry,
              onTap: (ctx, date, dr, cr) {
                final bloc = ctx.read<CashbookBloc>();
                showDialog(
                  context: ctx,
                  builder: (_) => BlocProvider.value(
                    value: bloc,
                    child: _CashbookDialog(ledger: entry, date: date, dr: dr, cr: cr),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _CashbookDialog extends StatelessWidget {
  final LedgerEntryBase ledger;
  final String date;
  final String dr;
  final String cr;

  const _CashbookDialog({required this.ledger, required this.date, required this.dr, required this.cr});

  @override
  Widget build(BuildContext context) {
    final isOpening = ledger.isOpening ?? false;
    return AccountsLedgerDetailDialog(
      ledger: ledger,
      date: date,
      dr: dr,
      cr: cr,
      bottomSection: BlocBuilder<CashbookBloc, CashbookState>(
        buildWhen: (p, c) =>
            p.isPrinting != c.isPrinting || p.printableFeatureIds != c.printableFeatureIds,
        builder: (context, state) {
          final loading = state.isPrinting;
          final canPrint = !isOpening && state.canPrint(ledger.featureId ?? 0);
          return Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.textSecondary,
                    side: BorderSide(color: context.border),
                    shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(AppConstants.close, style: context.bodySmall),
                ),
              ),
              if (canPrint) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: loading
                        ? null
                        : () => context.read<CashbookBloc>().add(
                              CashbookPrintRequested(
                                featureId: ledger.featureId ?? 0,
                                parentEntityId: ledger.parentEntityId ?? 0,
                                featureName: ledger.featureName,
                                docNbr: ledger.docNbr,
                              ),
                            ),
                    icon: loading
                        ? SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: context.textSecondary),
                          )
                        : const Icon(Icons.print_outlined, size: 16),
                    label: Text(AppConstants.printInvoiceLabel, style: context.bodySmall),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.textPrimary,
                      side: BorderSide(color: context.border),
                      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
