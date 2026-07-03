import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/customer_receivables_table.dart';

class CustomerRecievablesView extends StatelessWidget {
  const CustomerRecievablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerRecievablesBloc>(),
      child: const _CustomerRecievablesBody(),
    );
  }
}

class _CustomerRecievablesBody extends StatefulWidget {
  const _CustomerRecievablesBody();

  @override
  State<_CustomerRecievablesBody> createState() =>
      _CustomerRecievablesBodyState();
}

class _CustomerRecievablesBodyState extends State<_CustomerRecievablesBody> {
  late DateTime _fromDate;
  late DateTime _toDate;
  bool _filterCollapsed = false;
  late final TextEditingController _customerController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _customerController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _customerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.offset > 40;
    if (collapsed != _filterCollapsed) setState(() => _filterCollapsed = collapsed);
  }

  void _fetch() {
    context.read<CustomerRecievablesBloc>().add(
      CustomerRecievablesSubmitted(
        fromDate: _fromDate.format('yyyy-MM-dd'),
        toDate: _toDate.format('yyyy-MM-dd'),
      ),
    );
  }

  void _onPartyChanged(String name) {
    final parties = context.read<CustomerRecievablesBloc>().state.parties;
    final match = parties.where((p) => p.name == name).firstOrNull;
    if (match != null) setState(() {});
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
    return BlocListener<CustomerRecievablesBloc, CustomerRecievablesState>(
      listenWhen: (p, c) => p.apiStatus != c.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        backgroundColor: context.grey50,
        appBar: CustomAppBar(title: AppConstants.customerReceivableLabel),
        body: Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _filterCollapsed
                  ? AccountsCompactFilterBar(
                      label: _customerController.text,
                      placeholder: AppConstants.selectCustomer,
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
                  : BlocBuilder<CustomerRecievablesBloc,
                      CustomerRecievablesState>(
                      buildWhen: (p, c) =>
                          p.parties != c.parties ||
                          p.partiesStatus != c.partiesStatus,
                      builder: (context, state) => AccountsFilterForm(
                        label: AppConstants.customerBtn,
                        hintText: AppConstants.selectCustomerHint,
                        fromDate: _fromDate,
                        toDate: _toDate,
                        items: state.parties.map((p) => p.name).toList(),
                        isLoading: state.partiesStatus == ApiStatus.INITIAL ||
                            state.partiesStatus == ApiStatus.LOADING,
                        controller: _customerController,
                        onItemChanged: _onPartyChanged,
                        onPickFrom: () => _pickDate(true),
                        onPickTo: () => _pickDate(false),
                        onView: _fetch,
                      ),
                    ),
            ),
            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<CustomerRecievablesBloc,
                    CustomerRecievablesState>(
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
                      if (state.items.isEmpty) {
                        return const AccountsEmptyState();
                      }
                      return CustomerReceivablesTable(
                        items: state.items,
                        scrollController: _scrollController,
                      );
                    }
                    return const AccountsIdleState(
                      subtitle: AppConstants.selectACustomerAndTap,
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
