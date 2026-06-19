import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/party_compact_filter_bar.dart';
import '../widgets/party_empty_states.dart';
import '../widgets/party_filter_form.dart';
import '../widgets/party_shimmer.dart';
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
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _partyController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.offset > 40;
    if (collapsed != _filterCollapsed) setState(() => _filterCollapsed = collapsed);
  }

  void _fetch() {
    if (_selectedPartyId == null) {
      AppToastsUtils.showErrorTop(
          context, AppConstants.pleaseSelectAPartyFirstErrorMsg);
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
    return BlocListener<PartyLedgerBloc, PartyLedgerState>(
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
        appBar: CustomAppBar(title: AppConstants.partyLedgerLabel),
        body: Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _filterCollapsed
                  ? PartyCompactFilterBar(
                      partyName: _partyController.text,
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
                      builder: (context, state) => PartyFilterForm(
                        fromDate: _fromDate,
                        toDate: _toDate,
                        partyItems: state.parties.map((p) => p.name).toList(),
                        partySubtitles:
                            state.parties.map((p) => p.partyType).toList(),
                        isLoadingParties:
                            state.partiesStatus == ApiStatus.INITIAL ||
                                state.partiesStatus == ApiStatus.LOADING,
                        partyController: _partyController,
                        onPartyChanged: _onPartyChanged,
                        onPickFrom: () => _pickDate(true),
                        onPickTo: () => _pickDate(false),
                        onView: _fetch,
                      ),
                    ),
            ),
            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<PartyLedgerBloc, PartyLedgerState>(
                  builder: (context, state) {
                    if (state.apiStatus == ApiStatus.INITIAL) {
                      return const PartyIdleState();
                    }
                    if (state.apiStatus == ApiStatus.LOADING) {
                      return const PartyShimmerBody();
                    }
                    if (state.apiStatus == ApiStatus.FAILURE) {
                      return PartyErrorBody(
                        message:
                            state.message ?? AppConstants.somethingWentWrong,
                        onRetry: _fetch,
                      );
                    }
                    if (state.apiStatus == ApiStatus.SUCCESS &&
                        state.statements.isEmpty) {
                      return const PartyEmptyState();
                    }
                    return PartyStatementsBody(
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
