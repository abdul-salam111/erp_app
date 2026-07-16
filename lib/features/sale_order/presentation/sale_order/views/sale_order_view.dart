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
      create: (_) => sl<SaleOrderBloc>(),
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
  late DateTime _fromDate;
  late DateTime _toDate;
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;
  bool _filterCollapsed = false;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.offset > 40;
    if (collapsed != _filterCollapsed) setState(() => _filterCollapsed = collapsed);
  }

  void _fetch() {
    setState(() => _filterCollapsed = false);
    context.read<SaleOrderBloc>().add(
          SaleOrderFetched(
            fromDate: _fromDate.format('yyyy-MM-dd'),
            toDate: _toDate.format('yyyy-MM-dd'),
            search: _searchController.text.trim().isEmpty
                ? null
                : _searchController.text.trim(),
          ),
        );
  }

  Future<void> _pickDate(bool isFrom) async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: isFrom ? _fromDate : _toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.saleOrders),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteNames.create_sale_order);
        },
        backgroundColor: context.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _filterCollapsed
                ? AccountsCompactFilterBar(
                    label: _searchController.text,
                    placeholder: AppConstants.searchByDocRefNo,
                    fromDate: _fromDate,
                    toDate: _toDate,
                    onExpand: () {
                      setState(() => _filterCollapsed = false);
                      if (_scrollController.hasClients) {
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  )
                : _FilterForm(
                    searchController: _searchController,
                    fromDate: _fromDate,
                    toDate: _toDate,
                    onPickFrom: () => _pickDate(true),
                    onPickTo: () => _pickDate(false),
                    onView: _fetch,
                  ),
          ),
          Expanded(
            child: ColoredBox(
              color: context.white,
              child: BlocBuilder<SaleOrderBloc, SaleOrderState>(
                builder: (context, state) {
                  if (state.apiStatus == ApiStatus.INITIAL) {
                    return const AccountsIdleState(
                      title: 'No Sale Orders',
                      subtitle: AppConstants.selectDateRangeAndTap,
                    );
                  }
                  if (state.apiStatus == ApiStatus.LOADING) {
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
                    return const AccountsEmptyState(title: 'No Sale Orders');
                  }
                  return SaleOrderTable(
                    orders: state.orders,
                    scrollController: _scrollController,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Filter Form ──────────────────────────────────────────────────────────────

class _FilterForm extends StatelessWidget {
  final TextEditingController searchController;
  final DateTime fromDate;
  final DateTime toDate;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onView;

  const _FilterForm({
    required this.searchController,
    required this.fromDate,
    required this.toDate,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.grey50,
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        12,
        context.pagePadding.right,
        12,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          12,
          context.pagePadding.right,
          12,
        ),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: .circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _FormLabel(text: AppConstants.searchByDocRefNo),
            const SizedBox(height: 6),
            _SearchField(controller: searchController),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _FormLabel(text: AppConstants.fromDateBtn),
                      const SizedBox(height: 6),
                      _DateTile(
                        label: fromDate.format(AppConstants.ddMMMYyyyLabel),
                        onTap: onPickFrom,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _FormLabel(text: AppConstants.toDateBtn),
                      const SizedBox(height: 6),
                      _DateTile(
                        label: toDate.format(AppConstants.ddMMMYyyyLabel),
                        onTap: onPickTo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: AppConstants.view,
              onPressed: onView,
              radius: 6,
              elevation: 0,
              fontsize: 14,
              size: const Size.fromHeight(40),
              backgroundColor: context.primary.withValues(alpha: 0.12),
              textColor: context.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w500,
        fontSize: 12,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  const _SearchField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: context.grey50,
        borderRadius: .circular(6),
        border: Border.all(color: context.border),
      ),
      child: TextField(
        controller: controller,
        style: context.bodySmall.copyWith(fontSize: 13),
        decoration: InputDecoration(
          hintText: AppConstants.searchByDocRefNo,
          hintStyle: context.bodySmall.copyWith(
            color: context.textSecondary,
            fontSize: 13,
          ),
          prefixIcon: Icon(Iconsax.search_normal, size: 16, color: context.textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          isDense: true,
        ),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DateTile({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: .circular(6),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 16, color: context.textSecondary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 13,
                ),
                overflow: .ellipsis,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: context.textSecondary),
          ],
        ),
      ),
    );
  }
}
