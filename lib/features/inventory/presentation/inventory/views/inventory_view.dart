import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../inventory_exports.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InventoryBloc>(),
      child: const _InventoryBody(),
    );
  }
}

// ─── Data models ──────────────────────────────────────────────────────────────

class _StockRow {
  final String  initials;
  final Color   avatarColor;
  final String  name;
  final String  city;
  final String? itemCount;
  final String? itemName;
  final String? category;
  final String  qty;
  final String  weight;

  const _StockRow({
    required this.initials,
    required this.avatarColor,
    required this.name,
    required this.city,
    this.itemCount,
    this.itemName,
    this.category,
    required this.qty,
    required this.weight,
  });
}

class _StockItem {
  final String name;
  final String category;
  final String qty;
  final String weight;
  final String total;
  final String totalWeight;

  const _StockItem({
    required this.name,
    required this.category,
    required this.qty,
    required this.weight,
    required this.total,
    required this.totalWeight,
  });
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _InventoryBody extends StatefulWidget {
  const _InventoryBody();

  @override
  State<_InventoryBody> createState() => _InventoryBodyState();
}

class _InventoryBodyState extends State<_InventoryBody> {
  int _stockFilter = 2;

  static const _stockRows = <_StockRow>[
    _StockRow(
      initials: 'AL',
      avatarColor: Color(0xFFFF9800),
      name: 'Abbas Labour Contractor',
      city: 'Okara',
      itemCount: '2 Items',
      qty: 'N/A',
      weight: '',
    ),
    _StockRow(
      initials: 'PI',
      avatarColor: Color(0xFF1B84FF),
      name: '42-504 - Punjab Iron and Pipe Store',
      city: 'Okara',
      itemCount: '7 Items',
      qty: 'N/A',
      weight: '',
    ),
    _StockRow(
      initials: 'AB',
      avatarColor: Color(0xFFE53935),
      name: 'abc',
      city: 'Multan',
      itemName: 'Basmati Rice',
      category: 'Bahoo Foods | Rice Products',
      qty: '50',
      weight: '100',
    ),
    _StockRow(
      initials: 'T',
      avatarColor: Color(0xFF9C27B0),
      name: 'Test',
      city: 'Lahore',
      itemName: 'Raw Maize',
      category: 'Bahoo Foods | Maize Products',
      qty: '100',
      weight: '4,000',
    ),
  ];

  static const _stockItems = <_StockItem>[
    _StockItem(
      name: '100% Broken Rice',
      category: 'Bahoo Foods | Rice Products',
      qty: '67',
      weight: '2,460',
      total: '67',
      totalWeight: '2,460',
    ),
    _StockItem(
      name: '1121 Pk Basmati Raw',
      category: 'Bahoo Foods | Rice Products',
      qty: '1,125',
      weight: '58,340',
      total: '1,125',
      totalWeight: '58,340',
    ),
    _StockItem(
      name: '1121 Pk Basmati Rejection',
      category: 'Bahoo Foods | Rice Products',
      qty: '-8',
      weight: '40',
      total: '-8',
      totalWeight: '40',
    ),
    _StockItem(
      name: '1121 Pk Basmati Rice 1',
      category: 'Bahoo Foods | Rice Products',
      qty: '-9',
      weight: '1,850',
      total: '-9',
      totalWeight: '1,850',
    ),
    _StockItem(
      name: '1121 Pk Sella Basmati',
      category: 'Bahoo Foods | Rice Products',
      qty: '-2,714',
      weight: '5,733',
      total: '-2,714',
      totalWeight: '5,733',
    ),
    _StockItem(
      name: '1121 Pk Sella Raw',
      category: 'Bahoo Foods | Rice Products',
      qty: '184',
      weight: '9,980',
      total: '184',
      totalWeight: '9,980',
    ),
    _StockItem(
      name: '1121 Pk Steam Basmati',
      category: 'Bahoo Foods | Rice Products',
      qty: '2',
      weight: '1,000',
      total: '2',
      totalWeight: '1,000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listenWhen: (prev, curr) => prev.apiStatus != curr.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, AppConstants.successSuccessMsg);
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: UnfocusWrapper(
        child: Scaffold(
          appBar: CustomAppBar(title: AppConstants.inventoryLabel),
          body: SingleChildScrollView(
            padding: context.pagePadding.copyWith(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StockReceivedSection(
                  rows: _stockRows,
                  selectedFilter: _stockFilter,
                  onFilterTap: (i) => setState(() => _stockFilter = i),
                ),
                const SizedBox(height: 16),
                _CurrentStockSection(items: _stockItems),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Stock Received Section ────────────────────────────────────────────────────

class _StockReceivedSection extends StatelessWidget {
  final List<_StockRow>   rows;
  final int               selectedFilter;
  final ValueChanged<int> onFilterTap;

  const _StockReceivedSection({
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
                    _OutlineChip(label: 'Open Report', onTap: () {}),
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
  final _StockRow row;
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

// ─── Current Stock Section ────────────────────────────────────────────────────

class _CurrentStockSection extends StatelessWidget {
  final List<_StockItem> items;
  const _CurrentStockSection({required this.items});

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
                _OutlineChip(label: 'Open Report', onTap: () {}),
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
  final _StockItem item;
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

// ─── Shared outline chip ──────────────────────────────────────────────────────

class _OutlineChip extends StatelessWidget {
  final String       label;
  final VoidCallback onTap;
  const _OutlineChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: context.border),
        ),
        child: Text(
          label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
