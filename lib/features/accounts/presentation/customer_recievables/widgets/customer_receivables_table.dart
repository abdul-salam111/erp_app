import 'package:flutter/material.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/customer_recievables/customer_receivable_item_entity.dart';

class CustomerReceivablesTable extends StatelessWidget {
  final List<CustomerReceivableItemEntity> items;
  final ScrollController scrollController;

  const CustomerReceivablesTable({
    super.key,
    required this.items,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TableHeader(),
        Divider(height: 1, thickness: 1, color: context.divider),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: items.length,
            itemBuilder: (_, i) => _CustomerRow(item: items[i], index: i),
          ),
        ),
      ],
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.primary.withValues(alpha: 0.2),
      padding: EdgeInsets.symmetric(
        horizontal: context.pagePadding.left,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(flex: 8, child: _HeaderText(AppConstants.partyBtn)),
          Expanded(
            flex: 4,
            child: _HeaderText(AppConstants.balanceLabel, align: .end),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;
  final TextAlign align;
  const _HeaderText(this.text, {this.align = .start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: align,
      maxLines: 1,
      overflow: .ellipsis,
      style: context.labelSmall.copyWith(
        color: context.accentBlue,
        fontWeight: .w600,
        fontSize: 12,
      ),
    );
  }
}

// ─── Row ──────────────────────────────────────────────────────────────────────

class _CustomerRow extends StatefulWidget {
  final CustomerReceivableItemEntity item;
  final int index;

  const _CustomerRow({required this.item, required this.index});

  @override
  State<_CustomerRow> createState() => _CustomerRowState();
}

class _CustomerRowState extends State<_CustomerRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final isOdd = widget.index.isOdd;

    return ColoredBox(
      color: _expanded
          ? context.primary.withValues(alpha: 0.05)
          : (isOdd ? context.tableRowAlt : context.transparent),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // ── Collapsed row ─────────────────────────────────────────────────
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.pagePadding.left,
                vertical: 8,
              ),
              child: Row(
                crossAxisAlignment: .center,
                children: [
                  // Party + location
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text(
                          item.partyName,
                          style: context.bodySmall.copyWith(
                            fontWeight: .w600,
                            fontSize: 13,
                            color: context.textPrimary,
                          ),
                          maxLines: 2,
                          overflow: .ellipsis,
                        ),
                        if (item.location != null &&
                            item.location!.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            item.location!,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Balance
                  Expanded(
                    flex: 4,
                    child: Text(
                      item.balance.withTwoDecimals,
                      textAlign: .end,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        fontSize: 12,
                        color: context.textPrimary,
                      ),
                    ),
                  ),
                  // Chevron
                  SizedBox(
                    width: 24,
                    child: AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: context.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Expanded section ──────────────────────────────────────────────
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            alignment: .topCenter,
            child: _expanded
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: context.primary, width: 1.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: context.divider,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            context.pagePadding.left,
                            8,
                            context.pagePadding.right,
                            10,
                          ),
                          child: Row(
                            children: [
                              _ExpandedCell(
                                label: AppConstants.openingLabel,
                                amount: item.opening,
                                isDr: item.openingIsDr,
                                highlight: true,
                                align: .start,
                              ),
                              _ExpandedCell(
                                label: AppConstants.debit,
                                amount: item.debit,
                                isDr: true,
                                align: .center,
                              ),
                              _ExpandedCell(
                                label: AppConstants.credit,
                                amount: item.credit,
                                isDr: false,
                                align: .end,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ─── Expanded cell ────────────────────────────────────────────────────────────

class _ExpandedCell extends StatelessWidget {
  final String label;
  final double amount;
  final bool isDr;
  final bool highlight;
  final CrossAxisAlignment align;

  const _ExpandedCell({
    required this.label,
    required this.amount,
    required this.isDr,
    this.highlight = false,
    this.align = .start,
  });

  @override
  Widget build(BuildContext context) {
    final TextAlign textAlign = align == .end
        ? .end
        : align == .center
        ? .center
        : .start;
    final amtColor = isDr ? AppColors.debitRed : AppColors.creditGreen;

    return Expanded(
      child: Column(
        crossAxisAlignment: align,
        children: [
          Text(
            label,
            textAlign: textAlign,
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            amount.withTwoDecimals,
            textAlign: textAlign,
            style: context.bodySmall.copyWith(
              fontWeight: highlight ? .w700 : .w500,
              fontSize: 12,
              color: highlight ? context.textPrimary : amtColor,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }
}
