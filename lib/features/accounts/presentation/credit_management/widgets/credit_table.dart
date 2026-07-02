import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/customer_receivable_aging_entity.dart';
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

    return Padding(
      padding: .symmetric(horizontal: context.pagePadding.left),
      child: Column(
        children: [
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: AppColors.grey200),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, thickness: 1, color: AppColors.grey100),
              itemBuilder: (_, i) => _CreditTableRow(item: items[i]),
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
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              'Customer',
              style: context.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: .w600,
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Text(
              'Balance',
              style: context.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: .w600,
                fontSize: 11,
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
  const _CreditTableRow({required this.item});

  @override
  State<_CreditTableRow> createState() => _CreditTableRowState();
}

class _CreditTableRowState extends State<_CreditTableRow> {
  bool _expanded = false;

  Color get _ratingColor {
    switch (widget.item.creditRating.toUpperCase()) {
      case 'A':
        return const Color(0xFF4CAF50);
      case 'B':
        return const Color(0xFFFF9800);
      case 'C':
        return const Color(0xFFFFC107);
      default:
        return const Color(0xFFE53935);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

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
              padding: .symmetric(horizontal: 5, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      item.partyName,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        fontSize: 13,
                        color: context.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: _CrBadge(
                        rating: item.creditRating,
                        color: _ratingColor,
                      ),
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
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
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
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CreditManagementDetailsView(
                                customer: item.partyName,
                                creditRating: item.creditRating,
                                ratingColor: _ratingColor,
                                balance: item.totalAmount.asPrice,
                                partyId: item.partyId,
                              ),
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
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: color, shape: .circle),
      alignment: .center,
      child: Text(
        rating,
        style: context.labelSmall.copyWith(
          color: Colors.white,
          fontSize: 11,
          fontWeight: .w700,
        ),
      ),
    );
  }
}
