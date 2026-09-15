import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/vendor_payable_table.dart';

class VendorPayableView extends StatelessWidget {
  const VendorPayableView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VendorPayableBloc>(),
      child: const _VendorPayableBody(),
    );
  }
}

class _VendorPayableBody extends StatefulWidget {
  const _VendorPayableBody();

  @override
  State<_VendorPayableBody> createState() => _VendorPayableBodyState();
}

class _VendorPayableBodyState extends State<_VendorPayableBody> {
  late DateTime _fromDate;
  late DateTime _toDate;
  bool _filterCollapsed = false;
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _searchController = TextEditingController();
    _searchController.addListener(() => setState(() {}));
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetch());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        notification.dragDetails != null) {
      final maxExtent = notification.metrics.maxScrollExtent;
      if (maxExtent <= 0) return false;
      final threshold = maxExtent < 40 ? maxExtent / 2 : 40.0;
      final collapsed = notification.metrics.pixels > threshold;
      if (collapsed != _filterCollapsed) {
        setState(() => _filterCollapsed = collapsed);
      }
    }
    return false;
  }

  void _fetch() {
    context.read<VendorPayableBloc>().add(
      VendorPayableSubmitted(
        fromDate: _fromDate.format('yyyy-MM-dd'),
        toDate: _toDate.format('yyyy-MM-dd'),
      ),
    );
  }

  Future<DateTime?> _pickDate(bool isFrom) async {
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
    return picked;
  }

  void _showDateRangePopup() {
    showAccountsDateRangeDialog(
      context,
      fromDate: _fromDate,
      toDate: _toDate,
      onPick: _pickDate,
    );
  }

  void _print() {
    // TODO: wire up once a full-statement print/export endpoint exists.
    AppToastsUtils.showInfoTop(context, AppConstants.featureComingSoonMsg);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VendorPayableBloc, VendorPayableState>(
      listenWhen: (p, c) => p.apiStatus != c.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        backgroundColor: context.isDark ? context.background : context.surface,
        appBar: CustomAppBar(title: AppConstants.vendorPayableLabel),
        body: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Column(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: _filterCollapsed
                    ? AccountsCompactFilterBar(
                        label: _searchController.text,
                        placeholder: AppConstants.vendorPayableLabel,
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
                    : AccountsFilterFormCompact(
                        selectorOverride: AccountsSearchBar(
                          controller: _searchController,
                          hintText: AppConstants.searchVendorHint,
                        ),
                        onPickDateRange: _showDateRangePopup,
                        onView: _fetch,
                        onPrint: _print,
                      ),
              ),
              Expanded(
                child: ColoredBox(
                  color: context.isDark
                      ? context.background
                      : context.surfaceElevated,
                  child: BlocBuilder<VendorPayableBloc, VendorPayableState>(
                    buildWhen: (previous, current) =>
                        previous.apiStatus != current.apiStatus ||
                        previous.message != current.message ||
                        previous.items != current.items,
                    builder: (context, state) {
                      if (state.apiStatus == ApiStatus.LOADING) {
                        return const AccountsShimmerBody();
                      }
                      if (state.apiStatus == ApiStatus.FAILURE) {
                        return AccountsErrorBody(
                          message:
                              state.message ?? AppConstants.somethingWentWrong,
                          onRetry: _fetch,
                        );
                      }
                      if (state.apiStatus == ApiStatus.SUCCESS) {
                        final query = _searchController.text
                            .trim()
                            .toLowerCase();
                        final filtered = query.isEmpty
                            ? state.items
                            : state.items
                                  .where(
                                    (i) => i.partyName.toLowerCase().contains(
                                      query,
                                    ),
                                  )
                                  .toList();
                        if (filtered.isEmpty) {
                          return const AccountsEmptyState();
                        }
                        return VendorPayableTable(
                          items: filtered,
                          scrollController: _scrollController,
                        );
                      }
                      return const AccountsIdleState(
                        subtitle: AppConstants.selectDateRangeAndTapView,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
