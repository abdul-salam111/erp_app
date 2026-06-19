import 'package:flutter/material.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../accounts_exports.dart';
import 'ledger_helpers.dart';
import 'ledger_row.dart';

class LedgerYearCard extends StatefulWidget {
  final LedgerStatementEntity yearData;
  final ScrollController? scrollController;
  const LedgerYearCard({super.key, required this.yearData, this.scrollController});

  @override
  State<LedgerYearCard> createState() => _LedgerYearCardState();
}

class _LedgerYearCardState extends State<LedgerYearCard> {
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
      final total = _buildFlatEntries().length;
      if (_visibleCount < total) {
        setState(
          () => _visibleCount = (_visibleCount + _pageSize).clamp(0, total),
        );
      }
    }
  }

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
      widgets.add(LedgerRow(ledger: pe.entry));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final yearData = widget.yearData;
    final allEntries = _buildFlatEntries();
    final hasContent = allEntries.isNotEmpty;
    final visibleEntries = allEntries.take(_visibleCount).toList();

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: .all(color: context.border),
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
                        formatLedgerBalance(
                          (yearData.balance ?? 0).toDouble(),
                        ),
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
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOutCubic,
            alignment: .topCenter,
            child: _expanded
                ? hasContent
                      ? Column(
                          crossAxisAlignment: .start,
                          children: [
                            ..._buildPagedRows(visibleEntries, context),
                          ],
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
  final LedgerEntryEntity entry;
  const _PagedEntry({required this.type, required this.entry});
}
