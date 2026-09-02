import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import 'inventory_models.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class StockReceivedSection extends StatelessWidget {
  final List<StockRow> rows;
  final int selectedFilter;
  final ValueChanged<int> onFilterTap;
  final bool isLoading;

  const StockReceivedSection({
    super.key,
    required this.rows,
    required this.selectedFilter,
    required this.onFilterTap,
    this.isLoading = false,
  });

  static const _filters = [AppConstants.todayLabel, AppConstants.thisWeek, AppConstants.thisMonth];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // ── Header card ───────────────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(14),
            border: .all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: .fromLTRB(14, 14, 14, 14),
            child: Row(
              children: [
                Container(
                  padding: .all(8),
                  decoration: BoxDecoration(
                    color: context.primary.withValues(alpha: 0.12),
                    borderRadius: .circular(10),
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: context.primary,
                    size: 17,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        AppConstants.stockReceived,
                        style: context.titleSmall.copyWith(fontWeight: .w700),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        AppConstants.incomingStockByPartyItem,
                        style: TextStyle(fontSize: 10, color: context.grey400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),


        const SizedBox(height: 8),

        // ── Scrollable list card ──────────────────────────────────────────────
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // ── Filter row ──
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Row(
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
                                  : AppColors.transparent,
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
                                    sel ? .w600 : .w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Divider(height: 1, thickness: 1, color: context.border),
                Expanded(
                  child: isLoading && rows.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : rows.isEmpty
                          ? Center(
                              child: Text(
                                AppConstants.noStockReceived,
                                style: TextStyle(color: AppColors.grey400),
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: rows.length,
                              separatorBuilder: (_, __) => Divider(
                                height: 1,
                                thickness: 1,
                                color: context.border,
                              ),
                              itemBuilder: (context, i) =>
                                  _StockReceivedTile(row: rows[i]),
                            ),
                ),
              ],
            ),
          ),
        ),
      ],
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
            radius: 15,
            backgroundColor: row.avatarColor.withValues(alpha: 0.15),
            child: Text(
              row.initials,
              style: context.labelSmall.copyWith(
                color: row.avatarColor,
                fontWeight: .w700,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  row.name,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  row.city,
                  style: context.labelSmall.copyWith(
                    color: context.grey300,
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
                  fontWeight: .w600,
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: .end,
              children: [
                Text(
                  row.itemName!,
                  style: context.labelSmall.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w600,
                  ),
                ),
                if (row.category != null)
                  Text(
                    row.category!,
                    style: context.labelSmall.copyWith(
                      color: context.grey300,
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text(
                row.qty,
                style: context.labelSmall.copyWith(
                  color: row.qty == AppConstants.nA
                      ? context.textSecondary
                      : context.textPrimary,
                  fontWeight: .w600,
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
