import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/purchase_order_entity.dart';

class PurchaseOrderTable extends StatelessWidget {
  final List<PurchaseOrderEntity> orders;
  final ScrollController? scrollController;
  final void Function(PurchaseOrderEntity order)? onView;
  final void Function(PurchaseOrderEntity order)? onDelete;

  const PurchaseOrderTable({
    super.key,
    required this.orders,
    this.scrollController,
    this.onView,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 10, right: 10, bottom: 20),
      child: Column(
        children: [
          const _TableHeader(),
          Divider(
            height: 1,
            thickness: 1,
            color: context.isDark ? context.navyBorder : context.border,
          ),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              itemCount: orders.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                thickness: 1,
                color: context.isDark ? context.navyBorder : context.divider,
              ),
              itemBuilder: (_, i) => _OrderRow(
                index: i,
                order: orders[i],
                onView: onView != null ? () => onView!(orders[i]) : null,
                onDelete: onDelete != null ? () => onDelete!(orders[i]) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    final headerColor = context.isDark
        ? AppColors.surfaceHeaderDark
        : context.primary;
    final labelColor = context.isDark ? context.accentBlue : context.white;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
        color: headerColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(
              AppConstants.partyLabel.toUpperCase(),
              style: context.labelSmall.copyWith(
                color: labelColor,
                fontWeight: .w700,
                fontSize: 12,
                letterSpacing: 0.6,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              AppConstants.dateLabel.toUpperCase(),
              style: context.labelSmall.copyWith(
                color: labelColor,
                fontWeight: .w700,
                fontSize: 12,
                letterSpacing: 0.6,
              ),
              textAlign: .center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              AppConstants.netAmountLabel.toUpperCase(),
              style: context.labelSmall.copyWith(
                color: labelColor,
                fontWeight: .w700,
                fontSize: 12,
                letterSpacing: 0.6,
              ),
              textAlign: .end,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _OrderRow extends StatefulWidget {
  final int index;
  final PurchaseOrderEntity order;
  final VoidCallback? onView;
  final VoidCallback? onDelete;
  const _OrderRow({
    required this.index,
    required this.order,
    this.onView,
    this.onDelete,
  });

  @override
  State<_OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<_OrderRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final isOdd = widget.index.isOdd;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _expanded
            ? context.primary.withValues(alpha: 0.06)
            : (isOdd ? context.tableRowAlt : context.transparent),
        border: _expanded
            ? Border(
                bottom: BorderSide(color: AppColors.primary, width: 1.5),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          order.partyName,
                          style: context.bodySmall.copyWith(
                            fontWeight: .w600,
                            fontSize: 12,
                            color: context.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          order.docNumber,
                          style: context.labelSmall.copyWith(
                            color: context.accentBlue,
                            fontSize: 11,
                            fontWeight: .w500,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      order.date,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                      textAlign: .center,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      order.netAmount.asPrice,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        fontSize: 12,
                        color: context.textPrimary,
                      ),
                      textAlign: .end,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: context.primary.withAlpha(30),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                        child: Row(
                          crossAxisAlignment: .center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                crossAxisAlignment: .start,
                                children: [
                                  _DetailChip(
                                    label: AppConstants.refNoLabel,
                                    value: order.refNo?.isNotEmpty == true
                                        ? order.refNo!
                                        : '—',
                                  ),
                                  _DetailChip(
                                    label: AppConstants.rowsLabel,
                                    value: order.rowsCount.toString(),
                                    textAlign: .center,
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: _DetailChip(
                                      label: AppConstants.remarksLabel,
                                      value: order.remarks?.isNotEmpty == true
                                          ? order.remarks!
                                          : '—',
                                      textAlign: .end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            GestureDetector(
                              onTap: widget.onView,
                              child: Icon(
                                Iconsax.edit,
                                size: 20,
                                color: context.primary,
                              ),
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

class _DetailChip extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign;
  const _DetailChip({
    required this.label,
    required this.value,
    this.textAlign = .start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == .end
          ? .end
          : textAlign == .center
          ? .center
          : .start,
      children: [
        Text(
          label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontSize: 10,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: context.bodySmall.copyWith(
            fontWeight: .w600,
            fontSize: 12,
            color: context.textPrimary,
          ),
          textAlign: textAlign,
          maxLines: 1,
          overflow: .ellipsis,
        ),
      ],
    );
  }
}
