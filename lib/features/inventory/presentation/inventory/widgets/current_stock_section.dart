import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/widgets/shimmer_box.dart';
import 'inventory_models.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class CurrentStockSection extends StatelessWidget {
  final List<StockItem> items;
  final bool isLoading;
  const CurrentStockSection({
    super.key,
    required this.items,
    this.isLoading = false,
  });

  static const _green = AppColors.green;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // ── Header card ───────────────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: context.surfaceElevated,
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
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: Row(
              children: [
                Container(
                  padding: const .all(8),
                  decoration: BoxDecoration(
                    color: _green.withValues(alpha: 0.12),
                    borderRadius: .circular(10),
                  ),
                  child: const Icon(
                    Icons.warehouse_outlined,
                    color: _green,
                    size: 17,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        AppConstants.currentStock,
                        style: context.titleSmall.copyWith(fontWeight: .w700),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        AppConstants.liveInventoryByProduct,
                        style: TextStyle(fontSize: 10, color: context.textSecondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        // ── Table card ───────────────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: context.surfaceElevated,
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Column(
              children: [
                // ── Column headers ──
                Container(
                  color: context.surfaceHeader,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          AppConstants.productLabel,
                          style: context.labelSmall.copyWith(
                            color: context.textPrimary,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          AppConstants.qtyWeight,
                          textAlign: .center,
                          style: context.labelSmall.copyWith(
                            color: context.textPrimary,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 54,
                        child: Text(
                          AppConstants.total,
                          textAlign: .end,
                          style: context.labelSmall.copyWith(
                            color: context.textPrimary,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: context.border),
                // ── All rows (no scroll — outer screen scrolls) ──
                if (isLoading && items.isEmpty)
                  ..._buildShimmerRows(context)
                else if (items.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        AppConstants.noStockDataAvailable,
                        style: TextStyle(color: context.textSecondary),
                      ),
                    ),
                  )
                else
                  ...List.generate(items.length, (i) => Column(
                    children: [
                      CurrentStockTableRow(item: items[i]),
                      if (i < items.length - 1)
                        Divider(height: 1, thickness: 1, color: context.border),
                    ],
                  )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> _buildShimmerRows(BuildContext context) {
  return List.generate(6, (i) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: .start,
                  children: const [
                    ShimmerBox(width: 140, height: 12, radius: 4),
                    SizedBox(height: 6),
                    ShimmerBox(width: 80, height: 10, radius: 4),
                  ],
                ),
              ),
              const SizedBox(
                width: 80,
                child: Column(
                  children: [
                    ShimmerBox(width: 40, height: 12, radius: 4),
                    SizedBox(height: 4),
                    ShimmerBox(width: 30, height: 10, radius: 4),
                  ],
                ),
              ),
              const SizedBox(
                width: 54,
                child: Align(
                  alignment: .centerRight,
                  child: ShimmerBox(width: 40, height: 12, radius: 4),
                ),
              ),
            ],
          ),
        ),
        if (i < 5)
          Divider(height: 1, thickness: 1, color: context.border),
      ],
    );
  });
}

class CurrentStockTableRow extends StatelessWidget {
  final StockItem item;
  const CurrentStockTableRow({super.key, required this.item});

  static bool _isNeg(String v) => v.startsWith('-');

  @override
  Widget build(BuildContext context) {
    final qtyColor =
        _isNeg(item.qty) ? AppColors.errorBright : context.textPrimary;
    final totalColor =
        _isNeg(item.total) ? AppColors.errorBright : context.textPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          // Product + category
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  item.name,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    color: context.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  item.category,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
          // Qty / Weight
          SizedBox(
            width: 80,
            child: Column(
              children: [
                Text(
                  item.qty,
                  textAlign: .center,
                  style: context.labelSmall.copyWith(
                    color: qtyColor,
                    fontWeight: .w600,
                  ),
                ),
                Text(
                  item.weight,
                  textAlign: .center,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          // Total
          SizedBox(
            width: 54,
            child: Text(
              item.total,
              textAlign: .end,
              style: context.labelSmall.copyWith(
                color: totalColor,
                fontWeight: .w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
