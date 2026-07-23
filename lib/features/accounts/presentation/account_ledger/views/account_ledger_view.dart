import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/statements_body.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class AccountLedgerView extends StatelessWidget {
  final bool isEmployeeMode;
  const AccountLedgerView({super.key, this.isEmployeeMode = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AccountLedgerBloc>(),
      child: _AccountLedgerBody(isEmployeeMode: isEmployeeMode),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _AccountLedgerBody extends StatefulWidget {
  final bool isEmployeeMode;
  const _AccountLedgerBody({this.isEmployeeMode = false});

  @override
  State<_AccountLedgerBody> createState() => _AccountLedgerBodyState();
}

class _AccountLedgerBodyState extends State<_AccountLedgerBody> {
  late final TextEditingController _accountController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isEmployeeMode) {
        _fetch();
      } else {
        context.read<AccountLedgerBloc>().add(const AccountLedgerAccountsFetched());
      }
    });
  }

  @override
  void dispose() {
    _accountController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final bloc = context.read<AccountLedgerBloc>();
    final collapsed = _scrollController.offset > 40;
    if (collapsed != bloc.state.filterCollapsed) {
      bloc.add(AccountLedgerFilterCollapsed(collapsed));
    }
  }

  void _fetch() {
    final bloc = context.read<AccountLedgerBloc>();
    if (!widget.isEmployeeMode && bloc.state.selectedAccountId == null) {
      AppToastsUtils.showErrorTop(
        context,
        AppConstants.pleaseSelectAnAccountFirstErrorMsg,
      );
      return;
    }
    bloc.add(AccountLedgerSubmitted(
      fromDate: bloc.state.fromDate.format('yyyy-MM-dd'),
      toDate: bloc.state.toDate.format('yyyy-MM-dd'),
      accountId: widget.isEmployeeMode ? 95 : bloc.state.selectedAccountId,
    ));
  }

  void _onAccountChanged(String name) {
    final bloc = context.read<AccountLedgerBloc>();
    final match = bloc.state.accounts.where((a) => a.name == name).firstOrNull;
    if (match != null) bloc.add(AccountLedgerAccountSelected(match.id));
  }

  Future<void> _pickDate(bool isFrom) async {
    final bloc = context.read<AccountLedgerBloc>();
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: isFrom ? bloc.state.fromDate : bloc.state.toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      bloc.add(
        isFrom
            ? AccountLedgerFromDateChanged(picked)
            : AccountLedgerToDateChanged(picked),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountLedgerBloc, AccountLedgerState>(
      listenWhen: (p, c) => p.pdfStatus != c.pdfStatus,
      listener: (context, state) {
        if (state.pdfStatus == ApiStatus.FAILURE) {
          debugPrint('[AccountLedger] pdfStatus FAILURE: ${state.message}');
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
        if (state.pdfStatus == ApiStatus.SUCCESS && state.pdfUrl != null) {
          debugPrint('[AccountLedger] pdfStatus SUCCESS: ${state.pdfUrl}');
          AppToastsUtils.showSuccessTop(
            context,
            AppConstants.invoiceReadySuccessMsg,
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.grey50,
        appBar: CustomAppBar(title: AppConstants.accountLedgerLabel),
        body: Column(
          children: [
        
            BlocBuilder<AccountLedgerBloc, AccountLedgerState>(
              buildWhen: (p, c) =>
                  p.filterCollapsed != c.filterCollapsed ||
                  p.fromDate != c.fromDate ||
                  p.toDate != c.toDate ||
                  p.accounts != c.accounts ||
                  p.accountsStatus != c.accountsStatus,
              builder: (context, state) => AnimatedSize(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: state.filterCollapsed
                    ? AccountsCompactFilterBar(
                        label: widget.isEmployeeMode ? '' : _accountController.text,
                        placeholder: widget.isEmployeeMode ? '' : AppConstants.selectAccount,
                        fromDate: state.fromDate,
                        toDate: state.toDate,
                        onExpand: () {
                          context
                              .read<AccountLedgerBloc>()
                              .add(const AccountLedgerFilterCollapsed(false));
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
                        label: AppConstants.accountBtn,
                        hintText: AppConstants.selectAccountHint,
                        fromDate: state.fromDate,
                        toDate: state.toDate,
                        items: state.accounts.map((item) => item.name).toList(),
                        subtitles:
                            state.accounts.map((item) => item.group).toList(),
                        isLoading:
                            state.accountsStatus == ApiStatus.INITIAL ||
                            state.accountsStatus == ApiStatus.LOADING,
                        controller: _accountController,
                        onItemChanged: _onAccountChanged,
                        onPickFrom: () => _pickDate(true),
                        onPickTo: () => _pickDate(false),
                        onView: _fetch,
                        showAccountSelector: !widget.isEmployeeMode,
                      ),
              ),
            ),

            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<AccountLedgerBloc, AccountLedgerState>(
                  builder: (context, state) {
                    if (state.apiStatus == ApiStatus.INITIAL) {
                      return const AccountsIdleState(
                        subtitle: AppConstants.selectAnAccountAndTap,
                      );
                    }
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
                    if (state.apiStatus == ApiStatus.SUCCESS &&
                        state.statements.isEmpty) {
                      return const AccountsEmptyState();
                    }
                    return LedgerStatementsBody(
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
