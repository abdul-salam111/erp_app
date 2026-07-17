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
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _fetch() {
    final query = _searchController.text.trim();
    context.read<PurchaseOrderBloc>().add(
          PurchaseOrderFetched(search: query.isEmpty ? null : query),
        );
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
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
      body: Column(
        children: [
          _SearchBar(
            controller: _searchController,
            onSearch: _fetch,
          ),
          Expanded(
            child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
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
                    state.orders.isEmpty) {
                  return const AccountsEmptyState(title: 'No Purchase Orders');
                }
                return Column(
                  children: [
                    Expanded(
                      child: PurchaseOrderTable(
                        orders: state.pagedOrders,
                        scrollController: _scrollController,
                      ),
                    ),
                    _PaginationBar(
                      currentPage: state.currentPage,
                      totalPages: state.totalPages,
                      totalCount: state.orders.length,
                      onPageChanged: (page) {
                        context
                            .read<PurchaseOrderBloc>()
                            .add(PurchaseOrderPageChanged(page));
                        if (_scrollController.hasClients) {
                          _scrollController.jumpTo(0);
                        }
                      },
                    ),
                  ],
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
  final VoidCallback onSearch;

  const _SearchBar({required this.controller, required this.onSearch});

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
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          textInputAction: .search,
          onSubmitted: (_) => onSearch(),
          style: context.bodySmall.copyWith(fontSize: 13),
          decoration: InputDecoration(
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
            suffixIcon: GestureDetector(
              onTap: onSearch,
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: context.primary,
              ),
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

// ─── Pagination Bar ───────────────────────────────────────────────────────────

class _PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final ValueChanged<int> onPageChanged;

  const _PaginationBar({
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.pagePadding.left,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.border)),
      ),
      child: Row(
        children: [
          Text(
            '$totalCount ${AppConstants.recordsLabel}',
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 11,
            ),
          ),
          const Spacer(),
          _PageButton(
            icon: Icons.chevron_left_rounded,
            enabled: currentPage > 1,
            onTap: () => onPageChanged(currentPage - 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$currentPage / $totalPages',
              style: context.bodySmall.copyWith(
                fontWeight: .w600,
                fontSize: 12,
                color: context.textPrimary,
              ),
            ),
          ),
          _PageButton(
            icon: Icons.chevron_right_rounded,
            enabled: currentPage < totalPages,
            onTap: () => onPageChanged(currentPage + 1),
          ),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _PageButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: enabled
              ? context.primary.withValues(alpha: 0.10)
              : context.grey50,
          borderRadius: .circular(6),
          border: Border.all(color: context.border),
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? context.primary : context.textSecondary,
        ),
      ),
    );
  }
}
