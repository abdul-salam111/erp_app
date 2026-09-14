import 'package:flutter/material.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../../../features/accounts/domain/entities/shared/ledger_entry_base.dart';

typedef AccountsLedgerGroup = ({String type, List<LedgerEntryBase> entries});

class AccountsYearCard extends StatefulWidget {
  final String finYearName;
  final double balance;
  final double ttlDebit;
  final double ttlCredit;
  final List<AccountsLedgerGroup> groups;
  final Widget Function(LedgerEntryBase) rowBuilder;
  final ScrollController? scrollController;

  const AccountsYearCard({
    super.key,
    required this.finYearName,
    required this.balance,
    required this.ttlDebit,
    required this.ttlCredit,
    required this.groups,
    required this.rowBuilder,
    this.scrollController,
  });

  @override
  State<AccountsYearCard> createState() => _AccountsYearCardState();
}

class _AccountsYearCardState extends State<AccountsYearCard> {
  int _visibleCount = _pageSize;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrollController = widget.scrollController;
    if (scrollController == null || !scrollController.hasClients) return;
    if (scrollController.position.extentAfter < 300) {
      final total = _flatEntries.length;
      if (_visibleCount < total) {
        setState(() => _visibleCount = (_visibleCount + _pageSize).clamp(0, total));
      }
    }
  }

  List<_PagedEntry> get _flatEntries {
    final result = <_PagedEntry>[];
    for (final ledgerGroup in widget.groups) {
      for (final ledgerEntry in ledgerGroup.entries) {
        result.add(_PagedEntry(type: ledgerGroup.type, entry: ledgerEntry));
      }
    }
    return result;
  }

  List<Widget> _buildPagedRows(List<_PagedEntry> entries, BuildContext context) {
    final rows = <Widget>[];
    String? lastType;
    for (final pagedEntry in entries) {
      if (pagedEntry.type != lastType) {
        lastType = pagedEntry.type;
        if (pagedEntry.type.isNotEmpty) {
          rows.add(
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                border: Border(top: BorderSide(color: context.border)),
              ),
              child: Text(
                pagedEntry.type.toUpperCase(),
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
      rows.add(widget.rowBuilder(pagedEntry.entry));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final allEntries = _flatEntries;
    final hasContent = allEntries.isNotEmpty;
    final visibleEntries = allEntries.take(_visibleCount).toList();

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.grey50,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              border: Border(bottom: BorderSide(color: context.border)),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                if (widget.finYearName.trim().isNotEmpty) ...[
                  Text(
                    widget.finYearName,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w600,
                      color: context.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                Row(
                  children: [
                    Expanded(
                      child: _TotalChip(
                        label: AppConstants.balanceLabel,
                        amount:
                            '${widget.balance.abs().formatPrice()} '
                            '${widget.balance >= 0 ? AppConstants.dr : AppConstants.cr}',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: _TotalChip(
                        label: AppConstants.debit,
                        amount: widget.ttlDebit.formatPrice(),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: _TotalChip(
                        label: AppConstants.credit,
                        amount: widget.ttlCredit.formatPrice(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          hasContent
              ? Column(
                  crossAxisAlignment: .start,
                  children: _buildPagedRows(visibleEntries, context),
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    AppConstants.noLedgerDataAvailable,
                    style: context.bodySmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class _PagedEntry {
  final String type;
  final LedgerEntryBase entry;
  const _PagedEntry({required this.type, required this.entry});
}

class _TotalChip extends StatelessWidget {
  final String label;
  final String amount;

  const _TotalChip({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontWeight: .w600,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            amount,
            style: context.labelSmall.copyWith(
              color: context.textPrimary,
              fontWeight: .w700,
              fontSize: 12.5,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }
}
