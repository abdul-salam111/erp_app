import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../inventory_exports.dart';
import '../widgets/inventory_widgets.dart';

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

// ─── Body ─────────────────────────────────────────────────────────────────────

class _InventoryBody extends StatefulWidget {
  const _InventoryBody();

  @override
  State<_InventoryBody> createState() => _InventoryBodyState();
}

class _InventoryBodyState extends State<_InventoryBody> {
  int _stockFilter = 0;

  static const _dateTypes = ['today', 'week', 'month'];

  static const _avatarColors = <Color>[
    Color(0xFFFF9800),
    Color(0xFF1B84FF),
    Color(0xFFE53935),
    Color(0xFF9C27B0),
    Color(0xFF00BCD4),
    Color(0xFF4CAF50),
    Color(0xFFFF5722),
    Color(0xFF607D8B),
    Color(0xFF795548),
    Color(0xFF009688),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<InventoryBloc>().add(const FetchInventoryData());
      }
    });
  }

  // ── Formatters ───────────────────────────────────────────────────────────

  static String _initials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';
    if (words.length == 1) return words[0][0].toUpperCase();
    return '${words[0][0]}${words[1][0]}'.toUpperCase();
  }

  static String _fmt(double v) {
    if (v == 0) return '0';
    final n = v.abs();
    final intStr = n.toInt().toString();
    final buf = StringBuffer();
    for (int i = 0; i < intStr.length; i++) {
      if (i > 0 && (intStr.length - i) % 3 == 0) buf.write(',');
      buf.write(intStr[i]);
    }
    return v < 0 ? '-${buf.toString()}' : buf.toString();
  }

  // ── Mappers ──────────────────────────────────────────────────────────────

  static List<StockRow> _toStockRows(List<StockReceivedEntity> entities) {
    return List.generate(entities.length, (i) {
      final e = entities[i];
      final hasGroup = e.itemId == 0;
      return StockRow(
        initials: _initials(e.partyName),
        avatarColor: _avatarColors[i % _avatarColors.length],
        name: e.partyName,
        city: e.locationName,
        itemCount: hasGroup ? '${e.itemCount ?? 0} Items' : null,
        itemName: hasGroup ? null : (e.itemName ?? ''),
        category: hasGroup ? null : '',
        qty: hasGroup ? 'N/A' : _fmt(e.qty),
        weight: e.weight > 0 ? _fmt(e.weight) : '',
      );
    });
  }

  static List<StockItem> _toStockItems(List<CurrentStockEntity> entities) {
    return entities.map((e) {
      final based = e.invAmountBasedOn;
      return StockItem(
        name: e.itemName,
        category: based.isNotEmpty
            ? '${based[0].toUpperCase()}${based.substring(1)} based'
            : '',
        qty: _fmt(e.currentQty),
        weight: _fmt(e.currentWeight),
        total: _fmt(e.totalQty),
        totalWeight: _fmt(e.totalWeight),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listenWhen: (prev, curr) =>
          prev.stockReceivedStatus != curr.stockReceivedStatus ||
          prev.currentStockStatus != curr.currentStockStatus,
      listener: (context, state) {
        if (state.stockReceivedStatus == ApiStatus.FAILURE &&
            state.stockReceivedError != null) {
          AppToastsUtils.showErrorTop(context, state.stockReceivedError!);
        }
        if (state.currentStockStatus == ApiStatus.FAILURE &&
            state.currentStockError != null) {
          AppToastsUtils.showErrorTop(context, state.currentStockError!);
        }
      },
      child: UnfocusWrapper(
        child: Scaffold(
          appBar: CustomAppBar(title: AppConstants.inventoryLabel),
          body: BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              final rows = _toStockRows(state.stockReceived);
              final items = _toStockItems(state.currentStock);
              final hPad = context.pagePadding.left;

              return CustomScrollView(
                slivers: [
                  // ── Stock Received ──────────────────────────────────────
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: context.pagePadding.copyWith(top: 16, bottom: 16),
                      child: StockReceivedSection(
                        rows: rows,
                        selectedFilter: _stockFilter,
                        isLoading:
                            state.stockReceivedStatus == ApiStatus.LOADING,
                        onFilterTap: (i) {
                          setState(() => _stockFilter = i);
                          context.read<InventoryBloc>().add(
                            StockReceivedDateTypeChanged(_dateTypes[i]),
                          );
                        },
                      ),
                    ),
                  ),

                  // ── Pinned: Current Stock header card ───────────────────
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _CurrentStockCardDelegate(hPad: hPad),
                  ),

                  // ── Pinned: Column headers ──────────────────────────────
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _ColumnHeaderDelegate(hPad: hPad),
                  ),

                  // ── Scrollable rows ─────────────────────────────────────
                  if (state.currentStockStatus == ApiStatus.LOADING &&
                      items.isEmpty)
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        color: context.white,
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    )
                  else if (items.isEmpty)
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        color: context.white,
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: const Center(
                          child: Text(
                            'No stock data available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  else
                    SliverList.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        height: 1,
                        color: context.border,
                      ),
                      itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        decoration: BoxDecoration(
                          color: context.white,
                          border: Border(
                            left: BorderSide(color: context.border),
                            right: BorderSide(color: context.border),
                          ),
                        ),
                        child: CurrentStockTableRow(item: items[i]),
                      ),
                    ),

                  // ── Bottom card closure + spacing ───────────────────────
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          height: 14,
                          margin: EdgeInsets.symmetric(horizontal: hPad),
                          decoration: BoxDecoration(
                            color: context.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            border: Border(
                              bottom: BorderSide(color: context.border),
                              left: BorderSide(color: context.border),
                              right: BorderSide(color: context.border),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─── Sticky Delegates ─────────────────────────────────────────────────────────

class _CurrentStockCardDelegate extends SliverPersistentHeaderDelegate {
  final double hPad;
  const _CurrentStockCardDelegate({required this.hPad});

  static const _green = Color(0xFF4CAF50);
  // 14 (top pad) + ~35 (row: text taller than icon) + 14 (bottom pad)
  // + 2 (border) + 8 (gap below card) + 3 (buffer) = 76
  static const double _height = 76.0;

  @override
  double get minExtent => _height;
  @override
  double get maxExtent => _height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 8),
        child: Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: context.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _green.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
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
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'Current Stock',
                        style: context.titleSmall.copyWith(fontWeight: .w700),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'Live inventory by product',
                        style: TextStyle(fontSize: 10, color: context.grey400),
                      ),
                    ],
                  ),
                ),
                InventoryOutlineChip(label: 'Open Report', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _CurrentStockCardDelegate old) =>
      old.hPad != hPad;
}

class _ColumnHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double hPad;
  const _ColumnHeaderDelegate({required this.hPad});

  // 10 (top pad) + ~16 (labelSmall line height) + 10 (bottom pad) + 1 (divider) + 1 (buffer) = 38
  static const double _height = 38.0;

  @override
  double get minExtent => _height;
  @override
  double get maxExtent => _height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hPad),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        border: Border(
          top: BorderSide(color: context.border),
          left: BorderSide(color: context.border),
          right: BorderSide(color: context.border),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Product',
                      style: context.labelSmall.copyWith(
                        color: Colors.black87,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      'Qty / Weight',
                      textAlign: .center,
                      style: context.labelSmall.copyWith(
                        color: Colors.black87,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 54,
                    child: Text(
                      'Total',
                      textAlign: .end,
                      style: context.labelSmall.copyWith(
                        color: Colors.black87,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: context.border),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _ColumnHeaderDelegate old) => old.hPad != hPad;
}
