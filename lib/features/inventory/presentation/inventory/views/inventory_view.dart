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

  static const _stockRows = <StockRow>[
    StockRow(
      initials: 'AL',
      avatarColor: Color(0xFFFF9800),
      name: 'Abbas Labour Contractor',
      city: 'Okara',
      itemCount: '2 Items',
      qty: 'N/A',
      weight: '',
    ),
    StockRow(
      initials: 'PI',
      avatarColor: Color(0xFF1B84FF),
      name: '42-504 - Punjab Iron and Pipe Store',
      city: 'Okara',
      itemCount: '7 Items',
      qty: 'N/A',
      weight: '',
    ),
    StockRow(
      initials: 'AB',
      avatarColor: Color(0xFFE53935),
      name: 'abc',
      city: 'Multan',
      itemName: 'Basmati Rice',
      category: 'Bahoo Foods | Rice Products',
      qty: '50',
      weight: '100',
    ),
    StockRow(
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

  static const _stockItems = <StockItem>[
    StockItem(
      name: '100% Broken Rice',
      category: 'Bahoo Foods | Rice Products',
      qty: '67',
      weight: '2,460',
      total: '67',
      totalWeight: '2,460',
    ),
    StockItem(
      name: '1121 Pk Basmati Raw',
      category: 'Bahoo Foods | Rice Products',
      qty: '1,125',
      weight: '58,340',
      total: '1,125',
      totalWeight: '58,340',
    ),
    StockItem(
      name: '1121 Pk Basmati Rejection',
      category: 'Bahoo Foods | Rice Products',
      qty: '-8',
      weight: '40',
      total: '-8',
      totalWeight: '40',
    ),
    StockItem(
      name: '1121 Pk Basmati Rice 1',
      category: 'Bahoo Foods | Rice Products',
      qty: '-9',
      weight: '1,850',
      total: '-9',
      totalWeight: '1,850',
    ),
    StockItem(
      name: '1121 Pk Sella Basmati',
      category: 'Bahoo Foods | Rice Products',
      qty: '-2,714',
      weight: '5,733',
      total: '-2,714',
      totalWeight: '5,733',
    ),
    StockItem(
      name: '1121 Pk Sella Raw',
      category: 'Bahoo Foods | Rice Products',
      qty: '184',
      weight: '9,980',
      total: '184',
      totalWeight: '9,980',
    ),
    StockItem(
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
          AppToastsUtils.showSuccessTop(
            context,
            AppConstants.successSuccessMsg,
          );
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
                StockReceivedSection(
                  rows: _stockRows,
                  selectedFilter: _stockFilter,
                  onFilterTap: (i) => setState(() => _stockFilter = i),
                ),
                const SizedBox(height: 16),
                CurrentStockSection(items: _stockItems),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
