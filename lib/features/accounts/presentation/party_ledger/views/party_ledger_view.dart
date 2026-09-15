import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/party_statements_body.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class PartyLedgerView extends StatelessWidget {
  const PartyLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PartyLedgerBloc>(),
      child: const _PartyLedgerBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _PartyLedgerBody extends StatefulWidget {
  const _PartyLedgerBody();

  @override
  State<_PartyLedgerBody> createState() => _PartyLedgerBodyState();
}

class _PartyLedgerBodyState extends State<_PartyLedgerBody> {
  late DateTime _fromDate;
  late DateTime _toDate;
  int? _selectedPartyId;
  late final TextEditingController _partyController;
  late final ScrollController _scrollController;
  bool _filterCollapsed = false;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _partyController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _partyController.dispose();
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
    if (_selectedPartyId == null) {
      AppToastsUtils.showInfoTop(
        context,
        AppConstants.pleaseSelectAPartyFirstErrorMsg,
      );
      return;
    }
    setState(() => _filterCollapsed = false);
    context.read<PartyLedgerBloc>().add(
      PartyLedgerSubmitted(
        fromDate: _fromDate.format('yyyy-MM-dd'),
        toDate: _toDate.format('yyyy-MM-dd'),
        partyId: _selectedPartyId,
      ),
    );
  }

  void _onPartyChanged(String name) {
    final parties = context.read<PartyLedgerBloc>().state.parties;
    final match = parties.where((p) => p.name == name).firstOrNull;
    if (match != null) setState(() => _selectedPartyId = match.id);
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
    return BlocListener<PartyLedgerBloc, PartyLedgerState>(
      listenWhen: (p, c) => p.pdfStatus != c.pdfStatus,
      listener: (context, state) {
        if (state.pdfStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
        if (state.pdfStatus == ApiStatus.SUCCESS && state.pdfUrl != null) {
          AppToastsUtils.showSuccessTop(
            context,
            AppConstants.invoiceReadySuccessMsg,
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.isDark ? context.background : context.surface,
        appBar: CustomAppBar(title: AppConstants.partyLedgerLabel),
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
                        label: _partyController.text,
                        placeholder: AppConstants.selectParty,
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
                    : BlocBuilder<PartyLedgerBloc, PartyLedgerState>(
                        buildWhen: (p, c) =>
                            p.parties != c.parties ||
                            p.partiesStatus != c.partiesStatus,
                        builder: (context, state) => AccountsFilterFormCompact(
                          label: AppConstants.partyBtn,
                          hintText: AppConstants.selectPartyHint,
                          items: state.parties.map((p) => p.name).toList(),
                          isLoading:
                              state.partiesStatus == ApiStatus.INITIAL ||
                              state.partiesStatus == ApiStatus.LOADING,
                          controller: _partyController,
                          onItemChanged: _onPartyChanged,
                          onPickDateRange: _showDateRangePopup,
                          onView: _fetch,
                          onPrint: _print,
                        ),
                      ),
              ),
              Expanded(
                child: ColoredBox(
                  color: context.isDark
                      ? context.background
                      : context.surfaceElevated,
                  child: BlocBuilder<PartyLedgerBloc, PartyLedgerState>(
                    buildWhen: (previous, current) =>
                        previous.apiStatus != current.apiStatus ||
                        previous.message != current.message ||
                        previous.statements != current.statements,
                    builder: (context, state) {
                      if (state.apiStatus == ApiStatus.INITIAL) {
                        return const AccountsIdleState(
                          subtitle: AppConstants.selectAPartyAndTap,
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
                      return PartyStatementsBody(
                        statements: state.statements,
                        scrollController: _scrollController,
                        partyName: _partyController.text,
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
