import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/sale_order_entity.dart';

class SaleOrderTable extends StatelessWidget {
  final List<SaleOrderEntity> orders;
  final ScrollController? scrollController;
  final void Function(SaleOrderEntity order)? onView;

  const SaleOrderTable({
    super.key,
    required this.orders,
    this.scrollController,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 10, right: 10, bottom: 20),
      child: Column(
        children: [
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: AppColors.grey200),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              itemCount: orders.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, thickness: 1, color: AppColors.grey100),
              itemBuilder: (_, i) => _OrderRow(
                order: orders[i],
                onView: onView != null ? () => onView!(orders[i]) : null,
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
    return Container(
      decoration: BoxDecoration(
        color: context.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(
              AppConstants.partyLabel,
              style: context.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: .w600,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              AppConstants.dateLabel,
              style: context.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: .w600,
                fontSize: 11,
              ),
              textAlign: .center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              AppConstants.netAmountLabel,
              style: context.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: .w600,
                fontSize: 11,
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
  final SaleOrderEntity order;
  final VoidCallback? onView;
  const _OrderRow({required this.order, this.onView});

  @override
  State<_OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<_OrderRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;

    return ColoredBox(
      color: _expanded
          ? context.primary.withValues(alpha: 0.06)
          : Colors.transparent,
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
                            color: AppColors.grey700,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          order.docNumber,
                          style: context.labelSmall.copyWith(
                            color: context.primary,
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
                      Divider(height: 1, thickness: 1, color: context.primary.withAlpha(30)),
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
                                    textAlign: TextAlign.center,
                                  ),
                                  _DetailChip(
                                    label: AppConstants.remarksLabel,
                                    value: order.remarks?.isNotEmpty == true
                                        ? order.remarks!
                                        : '—',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: widget.onView,
                              child: Icon(
                                Iconsax.eye,
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
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.end
          ? .end
          : textAlign == TextAlign.center
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
