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
  late final TextEditingController _vendorController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _vendorController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _vendorController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.offset > 40;
    if (collapsed != _filterCollapsed) setState(() => _filterCollapsed = collapsed);
  }

  void _fetch() {
    context.read<VendorPayableBloc>().add(const VendorPayableSubmitted());
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
    return BlocListener<VendorPayableBloc, VendorPayableState>(
      listenWhen: (p, c) => p.apiStatus != c.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        backgroundColor: context.grey50,
        appBar: CustomAppBar(title: AppConstants.vendorPayableLabel),
        body: Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _filterCollapsed
                  ? AccountsCompactFilterBar(
                      label: _vendorController.text,
                      placeholder: 'Select vendor…',
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
                  : AccountsFilterForm(
                      label: 'Vendor',
                      hintText: 'Select Vendor',
                      fromDate: _fromDate,
                      toDate: _toDate,
                      items: const [],
                      isLoading: false,
                      controller: _vendorController,
                      onItemChanged: (_) {},
                      onPickFrom: () => _pickDate(true),
                      onPickTo: () => _pickDate(false),
                      onView: _fetch,
                    ),
            ),
            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<VendorPayableBloc, VendorPayableState>(
                  builder: (context, state) {
                    if (state.apiStatus == ApiStatus.LOADING) {
                      return const AccountsShimmerBody();
                    }
                    if (state.apiStatus == ApiStatus.FAILURE) {
                      return AccountsErrorBody(
                        message: state.message ?? AppConstants.somethingWentWrong,
                        onRetry: _fetch,
                      );
                    }
                    if (state.apiStatus == ApiStatus.SUCCESS) {
                      if (state.items.isEmpty) {
                        return const AccountsEmptyState();
                      }
                      return VendorPayableTable(
                        items: state.items,
                        scrollController: _scrollController,
                      );
                    }
                    return const AccountsIdleState(
                      subtitle: 'Select a vendor and tap View',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
