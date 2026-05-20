import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_utils.dart';
import 'inventory_models.dart';
import 'outline_chip.dart';

class StockReceivedSection extends StatelessWidget {
  final List<StockRow> rows;
  final int selectedFilter;
  final ValueChanged<int> onFilterTap;

  const StockReceivedSection({
    super.key,
    required this.rows,
    required this.selectedFilter,
    required this.onFilterTap,
  });

  static const _filters = ['Today', 'This Week', 'This Month'];

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
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: context.primary.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.inventory_2_outlined,
                        color: context.primary,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Stock Received',
                      style: context.titleSmall.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    InventoryOutlineChip(label: 'Open Report', onTap: () {}),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: List.generate(_filters.length, (i) {
                    final sel = i == selectedFilter;
                    return Padding(
                      padding: EdgeInsets.only(
                        right: i < _filters.length - 1 ? 6 : 0,
                      ),
                      child: GestureDetector(
                        onTap: () => onFilterTap(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: sel
                                ? context.primary.withValues(alpha: 0.10)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: sel
                                  ? context.primary.withValues(alpha: 0.30)
                                  : context.border,
                            ),
                          ),
                          child: Text(
                            _filters[i],
                            style: context.labelSmall.copyWith(
                              color: sel
                                  ? context.primary
                                  : context.textSecondary,
                              fontWeight:
                                  sel ? FontWeight.w600 : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: rows.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, thickness: 1, color: context.border),
            itemBuilder: (context, i) => _StockReceivedTile(row: rows[i]),
          ),
        ],
      ),
    );
  }
}

class _StockReceivedTile extends StatelessWidget {
  final StockRow row;
  const _StockReceivedTile({required this.row});

  @override
  Widget build(BuildContext context) {
    final hasGroup = row.itemCount != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: row.avatarColor.withValues(alpha: 0.15),
            child: Text(
              row.initials,
              style: context.labelSmall.copyWith(
                color: row.avatarColor,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  row.name,
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  row.city,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (hasGroup)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: context.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                row.itemCount!,
                style: context.labelSmall.copyWith(
                  color: context.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  row.itemName!,
                  style: context.labelSmall.copyWith(
                    color: context.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (row.category != null)
                  Text(
                    row.category!,
                    style: context.labelSmall.copyWith(
                      color: context.primary.withValues(alpha: 0.65),
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                row.qty,
                style: context.labelSmall.copyWith(
                  color: row.qty == 'N/A'
                      ? context.textSecondary
                      : context.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (row.weight.isNotEmpty)
                Text(
                  row.weight,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
