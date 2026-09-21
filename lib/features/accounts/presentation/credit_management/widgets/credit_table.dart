import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../routes/route_exports.dart';
import '../../../domain/entities/credit_managment/customer_receivable_aging_entity.dart';
import '../views/credit_management_details_view.dart';

class CreditTable extends StatelessWidget {
  final ScrollController? scrollController;
  final List<PartyCreditEntity> items;

  const CreditTable({
    super.key,
    this.scrollController,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          'No data found',
          style: context.bodySmall.copyWith(color: context.textSecondary),
        ),
      );
    }

    return Column(
      children: [
        const _TableHeader(),
        Divider(height: 1, thickness: 1, color: context.divider),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: items.length,
            itemBuilder: (_, i) => _CreditTableRow(item: items[i], index: i),
          ),
        ),
      ],
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.primary.withValues(alpha: 0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.pagePadding.left,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              'CUSTOMER',
              style: context.labelSmall.copyWith(
                color: context.accentBlue,
                fontWeight: .w600,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Text(
              'BALANCE',
              style: context.labelSmall.copyWith(
                color: context.accentBlue,
                fontWeight: .w600,
                fontSize: 12,
              ),
              textAlign: .end,
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _CreditTableRow extends StatefulWidget {
  final PartyCreditEntity item;
  final int index;
  const _CreditTableRow({required this.item, required this.index});

  @override
  State<_CreditTableRow> createState() => _CreditTableRowState();
}

class _CreditTableRowState extends State<_CreditTableRow> {
  bool _expanded = false;

  Color get _ratingColor {
    switch (widget.item.creditRating.toUpperCase()) {
      case 'A':
        return AppColors.green;
      case 'B':
        return AppColors.orange;
      case 'C':
        return AppColors.yellow;
      default:
        return AppColors.errorBright;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final color = _ratingColor;
    final isOdd = widget.index.isOdd;

    return ColoredBox(
      color: _expanded
          ? context.primary.withValues(alpha: 0.06)
          : (isOdd ? context.tableRowAlt : context.transparent),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.pagePadding.left,
                vertical: 10,
              ),
              child: Row(
                children: [
                  _CrBadge(
                    rating: item.creditRating,
                    color: color.withAlpha(90),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          item.partyName,
                          style: context.bodySmall.copyWith(
                            fontWeight: .w600,
                            fontSize: 13,
                            color: context.textPrimary,
                          ),
                          maxLines: 1,
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
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: .end,
                      children: [
                        Text(
                          item.totalAmount.asPrice,
                          style: context.bodySmall.copyWith(
                            fontWeight: .w600,
                            fontSize: 12,
                            color: context.textPrimary,
                          ),
                          textAlign: .end,
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${item.avgDays.toInt()} D',
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                          ),
                          textAlign: .end,
                        ),
                      ],
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
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: context.primary, width: 1.5),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.pagePadding.left,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        _DayColumn(
                          label: '30 Days',
                          value: item.firstSegmentAmount.asPrice,
                        ),
                        _DayColumn(
                          label: '60 Days',
                          value: item.secondSegmentAmount.asPrice,
                        ),
                        _DayColumn(
                          label: '90 Days',
                          value: item.thirdSegmentAmount.asPrice,
                        ),
                        _DayColumn(
                          label: '90+ Days',
                          value: item.fourthSegmentAmount.asPrice,
                        ),
                        IconButton(
                          onPressed: () => context.pushNamed(
                            RouteNames.credit_management_details,
                            extra: CreditManagementDetailsArgs(
                              customer: item.partyName,
                              city: item.location ?? '',
                              creditRating: item.creditRating,
                              ratingColor: color,
                              balance: item.totalAmount.asPrice,
                              partyId: item.partyId,
                              firstSegmentAmount: item.firstSegmentAmount,
                              secondSegmentAmount: item.secondSegmentAmount,
                              thirdSegmentAmount: item.thirdSegmentAmount,
                              fourthSegmentAmount: item.fourthSegmentAmount,
                            ),
                          ),
                          icon: Icon(
                            Iconsax.eye,
                            size: 17,
                            color: context.primary,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: context.primary.withValues(
                              alpha: 0.08,
                            ),
                            minimumSize: const Size(28, 28),
                            maximumSize: const Size(28, 28),
                            padding: .zero,
                            tapTargetSize: .shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(6),
                            ),
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

class _DayColumn extends StatelessWidget {
  final String label;
  final String value;
  const _DayColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
        ],
      ),
    );
  }
}

class _CrBadge extends StatelessWidget {
  final String rating;
  final Color color;
  const _CrBadge({required this.rating, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(color: color, shape: .circle),
      alignment: .center,
      child: Text(
        rating,
        style: context.labelSmall.copyWith(
          color: context.textPrimary,
          fontSize: 11,
          fontWeight: .w700,
        ),
      ),
    );
  }
}
