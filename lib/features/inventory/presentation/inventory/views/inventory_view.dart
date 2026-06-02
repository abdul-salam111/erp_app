import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
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

              return SingleChildScrollView(
                padding: context.pagePadding.copyWith(top: 16),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    StockReceivedSection(
                      rows: rows,
                      selectedFilter: _stockFilter,
                      isLoading: state.stockReceivedStatus == ApiStatus.LOADING,
                      onFilterTap: (i) {
                        setState(() => _stockFilter = i);
                        context.read<InventoryBloc>().add(
                          StockReceivedDateTypeChanged(_dateTypes[i]),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    CurrentStockSection(
                      items: items,
                      isLoading:
                          state.currentStockStatus == ApiStatus.LOADING,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
