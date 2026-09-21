import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../domain/entities/production_entity.dart';

class ProductionTable extends StatelessWidget {
  final List<ProductionEntity> orders;
  final ScrollController? scrollController;
  final void Function(ProductionEntity order)? onView;
  final void Function(ProductionEntity order)? onDelete;

  const ProductionTable({
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
    final labelStyle = context.labelSmall.copyWith(
      color: labelColor,
      fontWeight: .w700,
      fontSize: 12,
      letterSpacing: 0.6,
    );
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
            flex: 6,
            child: Text('PRODUCTION', style: labelStyle),
          ),
          Expanded(
            flex: 4,
            child: Text('PLANT', style: labelStyle),
          ),
          Expanded(
            flex: 3,
            child: Text('SHIFT', style: labelStyle, textAlign: .center),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _OrderRow extends StatefulWidget {
  final int index;
  final ProductionEntity order;
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
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          order.docNumber,
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
                          order.date,
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          order.plant,
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
                          order.process,
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(child: _ShiftChip(shift: order.shift)),
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
                              child: _DetailChip(
                                label: 'Consumption',
                                value: order.consumptionDoc?.isNotEmpty == true
                                    ? order.consumptionDoc!
                                    : '—',
                                subValue: order.consumptionDate,
                              ),
                            ),
                            Expanded(
                              child: _DetailChip(
                                label: 'Item',
                                value: order.itemName?.isNotEmpty == true
                                    ? order.itemName!
                                    : '—',
                              ),
                            ),
                            if (widget.onDelete != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: GestureDetector(
                                  onTap: widget.onDelete,
                                  child: Icon(
                                    Iconsax.trash,
                                    size: 20,
                                    color: AppColors.errorBright,
                                  ),
                                ),
                              ),
                            if (widget.onView != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: GestureDetector(
                                  onTap: widget.onView,
                                  child: Icon(
                                    Iconsax.eye,
                                    size: 20,
                                    color: context.primary,
                                  ),
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
  final String? subValue;
  const _DetailChip({
    required this.label,
    required this.value,
    this.subValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: context.bodySmall.copyWith(
            fontWeight: .w600,
            fontSize: 12,
            color: context.textPrimary,
          ),
          maxLines: 1,
          overflow: .ellipsis,
        ),
        if (subValue?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              subValue!,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 10,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
      ],
    );
  }
}


class _ShiftChip extends StatelessWidget {
  final String shift;
  const _ShiftChip({required this.shift});

  @override
  Widget build(BuildContext context) {
    final isNight = shift.toLowerCase().contains('night');
    final accent = isNight ? AppColors.purple : AppColors.green;
    final icon = isNight ? Iconsax.moon : Iconsax.sun_1;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.isDark
            ? AppColors.navyIconBgDark
            : accent.withValues(alpha: 0.10),
        borderRadius: .circular(20),
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(icon, size: 11, color: accent),
          const SizedBox(width: 4),
          Text(
            shift,
            style: context.labelSmall.copyWith(
              color: accent,
              fontWeight: .w700,
              fontSize: 10,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
