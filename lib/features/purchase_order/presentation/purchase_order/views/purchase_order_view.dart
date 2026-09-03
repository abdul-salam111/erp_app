import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/routes/route_names.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../purchase_order_exports.dart';
import '../widgets/purchase_order_table.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class PurchaseOrderView extends StatelessWidget {
  const PurchaseOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PurchaseOrderBloc>()..add(const PurchaseOrderFetched()),
      child: const _PurchaseOrderBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _PurchaseOrderBody extends StatefulWidget {
  const _PurchaseOrderBody();

  @override
  State<_PurchaseOrderBody> createState() => _PurchaseOrderBodyState();
}

class _PurchaseOrderBodyState extends State<_PurchaseOrderBody> {
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final bloc = context.read<PurchaseOrderBloc>();
      if (bloc.state.hasMore) bloc.add(const PurchaseOrderLoadMore());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _fetch() {
    context.read<PurchaseOrderBloc>().add(const PurchaseOrderFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.purchaseOrderTitle),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteNames.create_purchase_order);
        },
        backgroundColor: context.primary,
        shape: const CircleBorder(),
        child: Icon(Icons.add_rounded, color: context.white, size: 28),
      ),
      body: Column(
        children: [
          _SearchBar(
            controller: _searchController,
            onChanged: (query) => context
                .read<PurchaseOrderBloc>()
                .add(PurchaseOrderSearchChanged(query)),
          ),
          Expanded(
            child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
              buildWhen: (previous, current) =>
                  previous.apiStatus != current.apiStatus ||
                  previous.message != current.message ||
                  previous.pagedOrders != current.pagedOrders,
              builder: (context, state) {
                if (state.apiStatus == ApiStatus.INITIAL ||
                    state.apiStatus == ApiStatus.LOADING) {
                  return const AccountsShimmerBody();
                }
                if (state.apiStatus == ApiStatus.FAILURE) {
                  return AccountsErrorBody(
                    message: state.message ?? AppConstants.somethingWentWrong,
                    onRetry: _fetch,
                  );
                }
                if (state.apiStatus == ApiStatus.SUCCESS &&
                    state.filteredOrders.isEmpty) {
                  return const AccountsEmptyState(title: 'No Purchase Orders');
                }
                return PurchaseOrderTable(
                  orders: state.pagedOrders,
                  scrollController: _scrollController,
                  onView: (order) => context.pushNamed(
                    RouteNames.create_purchase_order,
                    extra: order.id,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Search Bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        10,
        context.pagePadding.right,
        10,
      ),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: .circular(8),
          border: Border.all(color: context.border),
          boxShadow: [
            BoxShadow(
              color: context.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          textInputAction: .search,
          onChanged: onChanged,
          style: context.bodySmall.copyWith(fontSize: 13),
          decoration: InputDecoration(
            filled: false,
            hintText: AppConstants.searchByDocRefNo,
            hintStyle: context.bodySmall.copyWith(
              color: context.textSecondary,
              fontSize: 13,
            ),
            prefixIcon: Icon(
              Iconsax.search_normal,
              size: 16,
              color: context.textSecondary,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            isDense: true,
          ),
        ),
      ),
    );
  }
}

