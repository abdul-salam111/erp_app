import 'package:flutter/material.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import 'section_header.dart';

class NewOrdersSection extends StatelessWidget {
  const NewOrdersSection({super.key});

  static const _orders = <_OrderItem>[
    _OrderItem(
      customer: AppConstants.abbasLabourContractor,
      items: [],
      amount: 101487.12,
    ),
    _OrderItem(
      customer: AppConstants.abdullahENGOkara,
      items: [AppConstants.cornFlour],
      amount: 5000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SectionHeader(
          title: AppConstants.newOrders,
          trailing: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: .symmetric(horizontal: 10, vertical: 4),
              minimumSize: .zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              AppConstants.viewAll,
              style: context.labelMedium.copyWith(
                color: context.primary,
                fontWeight: .w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(12),
            border: Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _orders.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, thickness: 1, color: context.border),
            itemBuilder: (context, index) => _OrderTile(order: _orders[index]),
          ),
        ),
      ],
    );
  }
}

class _OrderTile extends StatelessWidget {
  final _OrderItem order;

  const _OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    final initials = order.customer
        .trim()
        .split(' ')
        .take(2)
        .map((w) => w[0].toUpperCase())
        .join();

    final subtitle = order.items.length == 1 ? order.items.first : null;

    return Padding(
      padding: .symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.10),
              borderRadius: .circular(10),
            ),
            alignment: .center,
            child: Text(
              initials,
              style: context.labelMedium.copyWith(
                color: context.primary,
                fontWeight: .w700,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  order.customer,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Rs ${order.amount.asPrice}',
            style: context.bodySmall.copyWith(
              fontWeight: .w700,
              color: context.textPrimary,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItem {
  final String customer;
  final List<String> items;
  final double amount;

  const _OrderItem({
    required this.customer,
    required this.items,
    required this.amount,
  });
}
