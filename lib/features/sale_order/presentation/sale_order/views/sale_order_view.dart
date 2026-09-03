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
import '../../../sale_order_exports.dart';
import '../widgets/sale_order_table.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class SaleOrderView extends StatelessWidget {
  const SaleOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SaleOrderBloc>()..add(const SaleOrderFetched()),
      child: const _SaleOrderBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _SaleOrderBody extends StatefulWidget {
  const _SaleOrderBody();

  @override
  State<_SaleOrderBody> createState() => _SaleOrderBodyState();
}

class _SaleOrderBodyState extends State<_SaleOrderBody> {
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
      final bloc = context.read<SaleOrderBloc>();
      if (bloc.state.hasMore) bloc.add(const SaleOrderLoadMore());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _fetch() {
    context.read<SaleOrderBloc>().add(const SaleOrderFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.saleOrderTitle),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteNames.create_sale_order);
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
                .read<SaleOrderBloc>()
                .add(SaleOrderSearchChanged(query)),
          ),
          Expanded(
            child: BlocBuilder<SaleOrderBloc, SaleOrderState>(
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
                  return const AccountsEmptyState(title: 'No Sale Orders');
                }
                return SaleOrderTable(
                  orders: state.pagedOrders,
                  scrollController: _scrollController,
                  onView: (order) => context.pushNamed(
                    RouteNames.create_sale_order,
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
