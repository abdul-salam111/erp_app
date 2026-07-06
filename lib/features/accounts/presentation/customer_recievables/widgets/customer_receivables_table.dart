import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/customer_receivable_item_entity.dart';

class CustomerReceivablesTable extends StatelessWidget {
  final List<CustomerReceivableItemEntity> items;
  final ScrollController scrollController;

  const CustomerReceivablesTable({
    super.key,
    required this.items,
    required this.scrollController,
  });

  static final _fmt = NumberFormat('#,##0.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.pagePadding.left),
      child: Column(
        children: [
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: AppColors.grey200),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, thickness: 1, color: AppColors.grey200),
              itemBuilder: (_, i) =>
                  _CustomerRow(item: items[i], fmt: _fmt),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: _HeaderText(AppConstants.partyBtn),
          ),
          Expanded(
            flex: 4,
            child: _HeaderText(AppConstants.openingLabel, align: .end),
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
  const _HeaderText(this.text, {this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: 1,
      overflow: .ellipsis,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w600,
        fontSize: 12,
      ),
    );
  }
}

// ─── Row ──────────────────────────────────────────────────────────────────────

class _CustomerRow extends StatefulWidget {
  final CustomerReceivableItemEntity item;
  final NumberFormat fmt;

  const _CustomerRow({required this.item, required this.fmt});

  @override
  State<_CustomerRow> createState() => _CustomerRowState();
}

class _CustomerRowState extends State<_CustomerRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final fmt = widget.fmt;

    return ColoredBox(
      color: _expanded
          ? context.primary.withValues(alpha: 0.05)
          : Colors.transparent,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // ── Collapsed row ─────────────────────────────────────────────────
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
                        if (item.location != null && item.location!.isNotEmpty) ...[
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
                  // Opening
                  Expanded(
                    flex: 4,
                    child: Text(
                      fmt.format(item.opening),
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
                ? Column(
                    crossAxisAlignment: .start,
                    children: [
                      Divider(height: 1, thickness: 1, color: AppColors.grey200),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                        child: Row(
                          children: [
                            _ExpandedCell(
                              label: AppConstants.debit,
                              amount: item.debit,
                              isDr: true,
                              fmt: fmt,
                              align: CrossAxisAlignment.start,
                            ),
                            _ExpandedCell(
                              label: AppConstants.credit,
                              amount: item.credit,
                              isDr: false,
                              fmt: fmt,
                              align: CrossAxisAlignment.center,
                            ),
                            _ExpandedCell(
                              label: AppConstants.balanceLabel,
                              amount: item.balance,
                              isDr: item.balanceIsDr,
                              fmt: fmt,
                              highlight: true,
                              align: CrossAxisAlignment.end,
                            ),
                          ],
                        ),
                      ),
                    ],
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
  final NumberFormat fmt;
  final bool highlight;
  final CrossAxisAlignment align;

  const _ExpandedCell({
    required this.label,
    required this.amount,
    required this.isDr,
    required this.fmt,
    this.highlight = false,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final textAlign = align == CrossAxisAlignment.end
        ? TextAlign.end
        : align == CrossAxisAlignment.center
            ? TextAlign.center
            : TextAlign.start;
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
            fmt.format(amount),
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

