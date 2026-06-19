import 'package:flutter/material.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../../../features/accounts/domain/entities/accounts_entry_base.dart';
import 'accounts_helpers.dart';

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
  bool _expanded = true;
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
    final sc = widget.scrollController;
    if (sc == null || !sc.hasClients) return;
    if (sc.position.extentAfter < 300) {
      final total = _flatEntries.length;
      if (_visibleCount < total) {
        setState(() => _visibleCount = (_visibleCount + _pageSize).clamp(0, total));
      }
    }
  }

  List<_PagedEntry> get _flatEntries {
    final result = <_PagedEntry>[];
    for (final g in widget.groups) {
      for (final e in g.entries) {
        result.add(_PagedEntry(type: g.type, entry: e));
      }
    }
    return result;
  }

  List<Widget> _buildPagedRows(List<_PagedEntry> entries, BuildContext context) {
    final rows = <Widget>[];
    String? lastType;
    for (final pe in entries) {
      if (pe.type != lastType) {
        lastType = pe.type;
        if (pe.type.isNotEmpty) {
          rows.add(
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
      rows.add(widget.rowBuilder(pe.entry));
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
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.grey50,
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
                      widget.finYearName,
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
                        formatAccountsBalance(widget.balance),
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
                            'Rs. ${widget.ttlDebit.formatPrice()} Dr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rs. ${widget.ttlCredit.formatPrice()} Cr',
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
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOutCubic,
            alignment: .topCenter,
            child: _expanded
                ? hasContent
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
                        )
                : const SizedBox.shrink(),
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
