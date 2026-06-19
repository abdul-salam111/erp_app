import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../blocs/cashbook_bloc.dart';
import '../blocs/cashbook_event.dart';
import '../blocs/cashbook_state.dart';
import '../widgets/cashbook_compact_filter_bar.dart';
import '../widgets/cashbook_empty_states.dart';
import '../widgets/cashbook_filter_form.dart';
import '../widgets/cashbook_shimmer.dart';
import '../widgets/cashbook_statements_body.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class CashbookView extends StatelessWidget {
  const CashbookView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CashbookBloc>(),
      child: const _CashbookBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _CashbookBody extends StatefulWidget {
  const _CashbookBody();

  @override
  State<_CashbookBody> createState() => _CashbookBodyState();
}

class _CashbookBodyState extends State<_CashbookBody> {
  late final TextEditingController _accountController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _accountController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final bloc = context.read<CashbookBloc>();
    final collapsed = _scrollController.offset > 40;
    if (collapsed != bloc.state.filterCollapsed) {
      bloc.add(CashbookFilterCollapsed(collapsed));
    }
  }

  void _fetch() {
    final bloc = context.read<CashbookBloc>();
    if (bloc.state.selectedAccountId == null) {
      AppToastsUtils.showErrorTop(
          context, AppConstants.pleaseSelectAnAccountFirstErrorMsg);
      return;
    }
    bloc.add(CashbookSubmitted(
      fromDate: bloc.state.fromDate.format('yyyy-MM-dd'),
      toDate: bloc.state.toDate.format('yyyy-MM-dd'),
      accountId: bloc.state.selectedAccountId,
    ));
  }

  void _onAccountChanged(String name) {
    final bloc = context.read<CashbookBloc>();
    final match = bloc.state.accounts.where((a) => a.name == name).firstOrNull;
    if (match != null && match.id != null) bloc.add(CashbookAccountSelected(match.id!));
  }

  Future<void> _pickDate(bool isFrom) async {
    final bloc = context.read<CashbookBloc>();
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: isFrom ? bloc.state.fromDate : bloc.state.toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      bloc.add(isFrom
          ? CashbookFromDateChanged(picked)
          : CashbookToDateChanged(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashbookBloc, CashbookState>(
      listenWhen: (p, c) => p.pdfStatus != c.pdfStatus,
      listener: (context, state) {
        if (state.pdfStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
        if (state.pdfStatus == ApiStatus.SUCCESS && state.pdfUrl != null) {
          AppToastsUtils.showSuccessTop(
              context, AppConstants.invoiceReadySuccessMsg);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(title: AppConstants.cashbookLabel),
        body: Column(
          children: [
            BlocBuilder<CashbookBloc, CashbookState>(
              buildWhen: (p, c) =>
                  p.filterCollapsed != c.filterCollapsed ||
                  p.fromDate != c.fromDate ||
                  p.toDate != c.toDate ||
                  p.accounts != c.accounts ||
                  p.accountsStatus != c.accountsStatus,
              builder: (context, state) => AnimatedSize(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeInOut,
                alignment: .topCenter,
                child: state.filterCollapsed
                    ? CashbookCompactFilterBar(
                        accountName: _accountController.text,
                        fromDate: state.fromDate,
                        toDate: state.toDate,
                        onExpand: () {
                          context
                              .read<CashbookBloc>()
                              .add(const CashbookFilterCollapsed(false));
                          if (_scrollController.hasClients) {
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                      )
                    : CashbookFilterForm(
                        fromDate: state.fromDate,
                        toDate: state.toDate,
                        accountItems:
                            state.accounts.map((a) => a.name).toList(),
                        accountSubtitles:
                            state.accounts.map((a) => a.group ?? '').toList(),
                        isLoadingAccounts:
                            state.accountsStatus == ApiStatus.INITIAL ||
                                state.accountsStatus == ApiStatus.LOADING,
                        accountController: _accountController,
                        onAccountChanged: _onAccountChanged,
                        onPickFrom: () => _pickDate(true),
                        onPickTo: () => _pickDate(false),
                        onView: _fetch,
                      ),
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<CashbookBloc, CashbookState>(
                  builder: (context, state) {
                    if (state.apiStatus == ApiStatus.INITIAL) {
                      return const CashbookIdleState();
                    }
                    if (state.apiStatus == ApiStatus.LOADING) {
                      return const CashbookShimmerBody();
                    }
                    if (state.apiStatus == ApiStatus.FAILURE) {
                      return CashbookErrorBody(
                        message:
                            state.message ?? AppConstants.somethingWentWrong,
                        onRetry: _fetch,
                      );
                    }
                    if (state.apiStatus == ApiStatus.SUCCESS &&
                        state.statements.isEmpty) {
                      return const CashbookEmptyState();
                    }
                    return CashbookStatementsBody(
                      statements: state.statements,
                      scrollController: _scrollController,
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
