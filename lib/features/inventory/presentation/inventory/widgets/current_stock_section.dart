import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_utils.dart';
import 'inventory_models.dart';
import 'outline_chip.dart';

class CurrentStockSection extends StatelessWidget {
  final List<StockItem> items;
  const CurrentStockSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50).withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.warehouse_outlined,
                    color: Color(0xFF4CAF50),
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Current Stock',
                  style: context.titleSmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                InventoryOutlineChip(label: 'Open Report', onTap: () {}),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          // ── Column headers ───────────────────────────────────────
          Container(
            color: context.primary.withValues(alpha: 0.07),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Product',
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Qty / Weight',
                    textAlign: TextAlign.center,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Total',
                    textAlign: TextAlign.end,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, thickness: 1, color: context.border),
            itemBuilder: (context, i) => _StockItemTile(item: items[i]),
          ),
        ],
      ),
    );
  }
}

class _StockItemTile extends StatelessWidget {
  final StockItem item;
  const _StockItemTile({required this.item});

  static bool _isNeg(String v) => v.startsWith('-');

  @override
  Widget build(BuildContext context) {
    final qtyColor =
        _isNeg(item.qty) ? const Color(0xFFE53935) : context.textPrimary;
    final totalColor =
        _isNeg(item.total) ? const Color(0xFFE53935) : context.textPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.category,
                  style: context.labelSmall.copyWith(
                    color: context.primary.withValues(alpha: 0.65),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  item.qty,
                  textAlign: TextAlign.center,
                  style: context.labelSmall.copyWith(
                    color: qtyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item.weight,
                  textAlign: TextAlign.center,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.total,
                  style: context.labelSmall.copyWith(
                    color: totalColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item.totalWeight,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
