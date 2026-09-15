import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../production_exports.dart';
import '../widgets/production_table.dart';

class ProductionView extends StatelessWidget {
  const ProductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductionBloc>()..add(const ProductionFetched()),
      child: const _ProductionBody(),
    );
  }
}

class _ProductionBody extends StatefulWidget {
  const _ProductionBody();

  @override
  State<_ProductionBody> createState() => _ProductionBodyState();
}

class _ProductionBodyState extends State<_ProductionBody> {
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
      final bloc = context.read<ProductionBloc>();
      if (bloc.state.hasMore) bloc.add(const ProductionLoadMore());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _fetch() {
    context.read<ProductionBloc>().add(const ProductionFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.productionLabel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.primary,
        shape: const CircleBorder(),
        child: Icon(Icons.add_rounded, color: context.white, size: 28),
      ),
      body: Column(
        children: [
          _SearchBar(
            controller: _searchController,
            onChanged: (query) => context
                .read<ProductionBloc>()
                .add(ProductionSearchChanged(query)),
          ),
          Expanded(
            child: BlocBuilder<ProductionBloc, ProductionState>(
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
                  return const AccountsEmptyState(title: 'No Production');
                }
                return ProductionTable(
                  orders: state.pagedOrders,
                  scrollController: _scrollController,
                  onView: (_) {},
                  onDelete: (_) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
          color: context.navyCard,
          borderRadius: .circular(8),
          border: Border.all(
            color: context.isDark ? context.navyBorder : context.border,
          ),
          boxShadow: context.isDark
              ? null
              : [
                  BoxShadow(
                    color: context.shadow,
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
            fillColor: Colors.transparent,
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
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            isDense: true,
          ),
        ),
      ),
    );
  }
}
