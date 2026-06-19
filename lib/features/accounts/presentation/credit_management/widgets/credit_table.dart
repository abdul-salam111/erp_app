import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../views/credit_management_details_view.dart';

class CreditItem {
  final String customer;
  final String city;
  final String creditRating;
  final Color ratingColor;
  final String balance;
  final int avgDays;
  final String days30;
  final String days60;
  final String days90;

  const CreditItem({
    required this.customer,
    required this.city,
    required this.creditRating,
    required this.ratingColor,
    required this.balance,
    required this.avgDays,
    required this.days30,
    required this.days60,
    required this.days90,
  });
}

class CreditTable extends StatelessWidget {
  final ScrollController? scrollController;
  const CreditTable({super.key, this.scrollController});

  static const _items = [
    CreditItem(
      customer: 'Ajwa KP Foods Bannu',
      city: 'Bannu',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '1,000 Dr',
      avgDays: 41,
      days30: '0',
      days60: '1,000',
      days90: '0',
    ),
    CreditItem(
      customer: 'Al Majara Foods Pvt Ltd',
      city: 'Islamabad',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '761,550 Dr',
      avgDays: 196,
      days30: '0',
      days60: '1,000',
      days90: '760,550',
    ),
    CreditItem(
      customer: 'AM Foods (Karachi)',
      city: 'Karachi',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '123,720 Dr',
      avgDays: 352,
      days30: '0',
      days60: '0',
      days90: '123,720',
    ),
    CreditItem(
      customer: 'Anees Brocker Karachi',
      city: 'Haydrabad',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '524,285.19 Dr',
      avgDays: 352,
      days30: '0',
      days60: '0',
      days90: '524,285.19',
    ),
    CreditItem(
      customer: 'Badar Muneer Lahore',
      city: 'Lahore',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '125 Dr',
      avgDays: 352,
      days30: '0',
      days60: '0',
      days90: '125',
    ),
    CreditItem(
      customer: 'Darm Trading Company Doha',
      city: 'Doha Qatar',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '11,989 Dr',
      avgDays: 352,
      days30: '0',
      days60: '0',
      days90: '11,989',
    ),
    CreditItem(
      customer: 'Fauji Foods Limited',
      city: 'Islamabad',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '6,553,720 Dr',
      avgDays: 263,
      days30: '0',
      days60: '0',
      days90: '6,553,720',
    ),
    CreditItem(
      customer: 'Gold Foods Multan',
      city: 'Multan',
      creditRating: 'D',
      ratingColor: Color(0xFFE53935),
      balance: '1,098,690 Dr',
      avgDays: 352,
      days30: '0',
      days60: '0',
      days90: '1,098,690',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: context.pagePadding.left),
      child: Column(
        children: [
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: AppColors.grey200),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              itemCount: _items.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, thickness: 1, color: AppColors.grey100),
              itemBuilder: (_, i) => _CreditTableRow(item: _items[i]),
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
  final CreditItem item;
  const _CreditTableRow({required this.item});

  @override
  State<_CreditTableRow> createState() => _CreditTableRowState();
}

class _CreditTableRowState extends State<_CreditTableRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
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
              padding: .symmetric(
                horizontal:5,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          widget.item.customer,
                          style: context.bodySmall.copyWith(
                            fontWeight: .w600,
                            fontSize: 13,
                            color: context.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.item.city,
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
                    flex: 1,
                    child: Center(
                      child: _CrBadge(
                        rating: widget.item.creditRating,
                        color: widget.item.ratingColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: .end,
                      children: [
                        Text(
                          widget.item.balance,
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
                          '${widget.item.avgDays} D',
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
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      children: [
                        _DayColumn(
                          label: '30 Days',
                          value: widget.item.days30,
                        ),
                        _DayColumn(
                          label: '60 Days',
                          value: widget.item.days60,
                        ),
                        _DayColumn(
                          label: '90 Days',
                          value: widget.item.days90,
                        ),
                        IconButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CreditManagementDetailsView(
                                customer: widget.item.customer,
                                city: widget.item.city,
                                creditRating: widget.item.creditRating,
                                ratingColor: widget.item.ratingColor,
                                balance: widget.item.balance,
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
