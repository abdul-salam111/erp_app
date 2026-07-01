import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../accounts/accounts_exports.dart';

class AcStatementTab extends StatefulWidget {
  final int? accountId;
  const AcStatementTab({super.key, this.accountId});

  @override
  State<AcStatementTab> createState() => _AcStatementTabState();
}

class _AcStatementTabState extends State<AcStatementTab> {
  late final AcStatementCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<AcStatementCubit>();
    _fetch();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _fetch() {
    final now = DateTime.now();
    _cubit.fetch(
      fromDate: now.subtractMonths(1).format('yyyy-MM-dd'),
      toDate: now.format('yyyy-MM-dd'),
      accountId: widget.accountId ?? 95,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<AcStatementCubit, AcStatementState>(
        builder: (context, state) {
          if (state.status == ApiStatus.LOADING) {
            return const AccountsShimmerBody();
          }
          if (state.status == ApiStatus.FAILURE) {
            return AccountsErrorBody(
              message: state.message ?? AppConstants.somethingWentWrong,
              onRetry: _fetch,
            );
          }
          if (state.status == ApiStatus.SUCCESS && state.statements.isEmpty) {
            return const AccountsEmptyState();
          }
          if (state.status == ApiStatus.SUCCESS) {
            return AccountsStatementsBody(
              yearCards: [
                for (final s in state.statements)
                  AccountsYearCard(
                    finYearName: s.finYear?.name ?? '',
                    balance: (s.balance ?? 0).toDouble(),
                    ttlDebit: (s.ttlDebit ?? 0).toDouble(),
                    ttlCredit: (s.ttlCredit ?? 0).toDouble(),
                    groups: [
                      for (final lt in (s.ledgerTypes ?? []))
                        if ((lt.ledgers ?? []).isNotEmpty &&
                            !(lt.ttlDebit == 0 &&
                                lt.ttlCredit == 0 &&
                                lt.balance == 0))
                          (
                            type: lt.type ?? '',
                            entries: (lt.ledgers ?? []).cast<LedgerEntryBase>(),
                          ),
                    ],
                    rowBuilder: (entry) => AccountsLedgerRow(
                      ledger: entry,
                      onTap: (ctx, date, dr, cr) => showDialog(
                        context: ctx,
                        builder: (_) => AccountsLedgerDetailDialog(
                          ledger: entry,
                          date: date,
                          dr: dr,
                          cr: cr,
                          bottomSection: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: ctx.textSecondary,
                                side: BorderSide(color: ctx.border),
                                shape: RoundedRectangleBorder(
                                  borderRadius: .circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                AppConstants.close,
                                style: ctx.bodySmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
