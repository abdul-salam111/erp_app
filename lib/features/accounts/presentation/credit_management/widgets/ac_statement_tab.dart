import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../accounts/accounts_exports.dart';

class AcStatementTab extends StatefulWidget {
  final int? partyId;
  const AcStatementTab({super.key, this.partyId});

  @override
  State<AcStatementTab> createState() => _AcStatementTabState();
}

class _AcStatementTabState extends State<AcStatementTab> {
  late final AcStatementCubit _cubit;
  late DateTime _fromDate;
  late DateTime _toDate;
  late final ScrollController _scrollController;
  bool _filterCollapsed = false;

  @override
  void initState() {
    super.initState();
    _cubit = sl<AcStatementCubit>();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _fetch();
  }

  @override
  void dispose() {
    _cubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.offset > 40;
    if (collapsed != _filterCollapsed) setState(() => _filterCollapsed = collapsed);
  }

  void _fetch() {
    _cubit.fetch(
      fromDate: _fromDate.format('yyyy-MM-dd'),
      toDate: _toDate.format('yyyy-MM-dd'),
      partyId: widget.partyId,
    );
  }

  Future<void> _pickDate(bool isFrom) async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: isFrom ? _fromDate : _toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeInOut,
            alignment: .topCenter,
            child: _filterCollapsed
                ? _CompactDateBar(
                    fromDate: _fromDate,
                    toDate: _toDate,
                    onExpand: () {
                      setState(() => _filterCollapsed = false);
                      if (_scrollController.hasClients) {
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  )
                : _DateFilterForm(
                    fromDate: _fromDate,
                    toDate: _toDate,
                    onPickFrom: () => _pickDate(true),
                    onPickTo: () => _pickDate(false),
                    onView: _fetch,
                  ),
          ),
          Expanded(
            child: BlocBuilder<AcStatementCubit, AcStatementState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status ||
                  previous.message != current.message ||
                  previous.statements != current.statements,
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
                if (state.status == ApiStatus.SUCCESS &&
                    state.statements.isEmpty) {
                  return const AccountsEmptyState();
                }
                if (state.status == ApiStatus.SUCCESS) {
                  return AccountsStatementsBody(
                    scrollController: _scrollController,
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
                                  entries:
                                      (lt.ledgers ?? []).cast<LedgerEntryBase>(),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
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
          ),
        ],
      ),
    );
  }
}

// ─── Compact bar (collapsed) ──────────────────────────────────────────────────

class _CompactDateBar extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final VoidCallback onExpand;

  const _CompactDateBar({
    required this.fromDate,
    required this.toDate,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onExpand,
      child: Container(
        color: context.grey100,
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          10,
          context.pagePadding.right,
          10,
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 15, color: context.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${fromDate.format(AppConstants.ddMMMYyyyLabel)} – ${toDate.format(AppConstants.ddMMMYyyyLabel)}',
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontWeight: .w500,
                  fontSize: 13,
                ),
                overflow: .ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: context.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Expanded date filter form ────────────────────────────────────────────────

class _DateFilterForm extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onView;

  const _DateFilterForm({
    required this.fromDate,
    required this.toDate,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.white,
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        12,
        context.pagePadding.right,
        8,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _Label(AppConstants.fromDateBtn),
                    const SizedBox(height: 6),
                    _DateTile(
                      date: fromDate.format(AppConstants.ddMMMYyyyLabel),
                      onTap: onPickFrom,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _Label(AppConstants.toDateBtn),
                    const SizedBox(height: 6),
                    _DateTile(
                      date: toDate.format(AppConstants.ddMMMYyyyLabel),
                      onTap: onPickTo,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomButton(
            text: AppConstants.view,
            onPressed: onView,
            radius: 6,
            elevation: 0,
            fontsize: 14,
            size: const Size.fromHeight(38),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w500,
        fontSize: 12,
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  final String date;
  final VoidCallback onTap;
  const _DateTile({required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: .circular(6),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 15, color: context.textSecondary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                date,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 13,
                ),
                overflow: .ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: context.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
