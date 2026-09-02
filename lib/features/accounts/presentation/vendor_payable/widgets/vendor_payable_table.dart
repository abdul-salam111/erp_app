import 'package:flutter/material.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/customer_recievables/customer_receivable_item_entity.dart';

class VendorPayableTable extends StatelessWidget {
  final List<CustomerReceivableItemEntity> items;
  final ScrollController scrollController;

  const VendorPayableTable({
    super.key,
    required this.items,
    required this.scrollController,
  });

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
              itemBuilder: (_, i) => _VendorRow(item: items[i]),
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
            child: const _HeaderText('Vendor'),
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
  const _HeaderText(this.text, {this.align = .start});

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

class _VendorRow extends StatefulWidget {
  final CustomerReceivableItemEntity item;

  const _VendorRow({required this.item});

  @override
  State<_VendorRow> createState() => _VendorRowState();
}

class _VendorRowState extends State<_VendorRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return ColoredBox(
      color: _expanded
          ? context.primary.withValues(alpha: 0.05)
          : Colors.transparent,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                crossAxisAlignment: .center,
                children: [
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
                  Expanded(
                    flex: 4,
                    child: Text(
                      item.opening.withTwoDecimals,
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
                              align: .start,
                            ),
                            _ExpandedCell(
                              label: AppConstants.credit,
                              amount: item.credit,
                              isDr: false,
                              align: .center,
                            ),
                            _ExpandedCell(
                              label: AppConstants.balanceLabel,
                              amount: item.balance,
                              isDr: item.balanceIsDr,
                              highlight: true,
                              align: .end,
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
