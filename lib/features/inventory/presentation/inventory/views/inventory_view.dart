import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
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
  late final TextEditingController _searchController;

  static const _dateTypes = ['today', 'week', 'month'];

  static const _avatarColors = <Color>[
    AppColors.orange,
    AppColors.primary,
    AppColors.errorBright,
    AppColors.purple,
    AppColors.cyan,
    AppColors.green,
    AppColors.redAccent,
    AppColors.blueGrey,
    AppColors.brown,
    AppColors.teal,
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<InventoryBloc>().add(const FetchInventoryData());
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        qty: hasGroup ? AppConstants.nA : _fmt(e.qty),
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
              final query = _searchController.text.trim().toLowerCase();
              final filteredItems = query.isEmpty
                  ? items
                  : items
                        .where(
                          (item) => item.name.toLowerCase().contains(query),
                        )
                        .toList();
              final hPad = context.pagePadding.left;

              return CustomScrollView(
                slivers: [
                  // ── Stock Received ──────────────────────────────────────
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: context.pagePadding.copyWith(
                        top: 16,
                        bottom: 16,
                      ),
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

                  // ── Pinned: card + search field + column headers ────────
                  // Combined into a single SliverPersistentHeader — stacking
                  // multiple separate pinned headers hits a Flutter sliver
                  // geometry bug once the keyboard shrinks the viewport.
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyStockHeaderDelegate(
                      hPad: hPad,
                      searchController: _searchController,
                    ),
                  ),

                  // ── Scrollable rows ─────────────────────────────────────
                  if (state.currentStockStatus == ApiStatus.LOADING &&
                      items.isEmpty)
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        color: context.navyCard,
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    )
                  else if (filteredItems.isEmpty)
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        color: context.navyCard,
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: Text(
                            query.isEmpty
                                ? AppConstants.noStockDataAvailable
                                : AppConstants.noItemsMatchSearch,
                            style: TextStyle(color: context.textSecondary),
                          ),
                        ),
                      ),
                    )
                  else
                    SliverList.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.symmetric(horizontal: hPad),
                        decoration: BoxDecoration(
                          color: i.isOdd
                              ? context.tableRowAlt
                              : context.navyCard,
                          border: Border(
                            left: BorderSide(
                              color: context.isDark
                                  ? context.navyBorder
                                  : context.border,
                            ),
                            right: BorderSide(
                              color: context.isDark
                                  ? context.navyBorder
                                  : context.border,
                            ),
                          ),
                        ),
                        child: CurrentStockTableRow(item: filteredItems[i]),
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
                            color: context.navyCard,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            border: Border(
                              bottom: BorderSide(
                                color: context.isDark
                                    ? context.navyBorder
                                    : context.border,
                              ),
                              left: BorderSide(
                                color: context.isDark
                                    ? context.navyBorder
                                    : context.border,
                              ),
                              right: BorderSide(
                                color: context.isDark
                                    ? context.navyBorder
                                    : context.border,
                              ),
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

// ─── Sticky header (card + search + column headers) ───────────────────────────

class _StickyStockHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double hPad;
  final TextEditingController searchController;
  const _StickyStockHeaderDelegate({
    required this.hPad,
    required this.searchController,
  });

  // Card 76 (14 top pad + ~35 row + 14 bottom pad + 2 border + 8 gap + 3
  // buffer) + search 48 (40 field + 8 gap) + column header 38 = 162.
  static const double _height = 162.0;

  @override
  double get minExtent => _height;
  @override
  double get maxExtent => _height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          _CurrentStockCard(hPad: hPad),
          _StockSearchBar(hPad: hPad, controller: searchController),
          _ColumnHeaderRow(hPad: hPad),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _StickyStockHeaderDelegate old) =>
      old.hPad != hPad || old.searchController != searchController;
}

class _CurrentStockCard extends StatelessWidget {
  final double hPad;
  const _CurrentStockCard({required this.hPad});

  static const _green = AppColors.green;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 8),
      child: Container(
        decoration: BoxDecoration(
          color: context.navyCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: context.isDark ? context.navyBorder : context.border,
          ),
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
                      AppConstants.currentStock,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      AppConstants.liveInventoryByProduct,
                      style: TextStyle(
                        fontSize: 10,
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StockSearchBar extends StatelessWidget {
  final double hPad;
  final TextEditingController controller;
  const _StockSearchBar({required this.hPad, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 8),
      child: InventorySearchField(
        controller: controller,
        hintText: AppConstants.searchStockItemHint,
      ),
    );
  }
}

class _ColumnHeaderRow extends StatelessWidget {
  final double hPad;
  const _ColumnHeaderRow({required this.hPad});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hPad),
      decoration: BoxDecoration(
        color: context.isDark
            ? AppColors.navyIconBgDark
            : context.surfaceHeader,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        border: Border(
          top: BorderSide(
            color: context.isDark ? context.navyBorder : context.border,
          ),
          left: BorderSide(
            color: context.isDark ? context.navyBorder : context.border,
          ),
          right: BorderSide(
            color: context.isDark ? context.navyBorder : context.border,
          ),
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
                      AppConstants.productLabel,
                      style: context.labelSmall.copyWith(
                        color: context.primary,
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
                        color: context.primary,
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
                        color: context.primary,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: context.isDark ? context.navyBorder : context.border,
            ),
          ],
        ),
      ),
    );
  }
}
