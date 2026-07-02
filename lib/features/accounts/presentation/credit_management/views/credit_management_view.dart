import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/compact_filter_bar.dart';
import '../widgets/credit_stat_cards.dart';
import '../widgets/credit_table.dart';
import '../widgets/filter_form.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class CreditManagementView extends StatelessWidget {
  const CreditManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreditManagementBloc>(),
      child: const _CreditManagementBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _CreditManagementBody extends StatefulWidget {
  const _CreditManagementBody();

  @override
  State<_CreditManagementBody> createState() => _CreditManagementBodyState();
}

class _CreditManagementBodyState extends State<_CreditManagementBody> {
  late final TextEditingController _partyController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
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
    final bloc = context.read<CreditManagementBloc>();
    final collapsed = _scrollController.offset > 40;
    if (collapsed != bloc.state.filterCollapsed) {
      bloc.add(CreditManagementFilterCollapsed(collapsed));
    }
  }

  void _fetch() {
    context.read<CreditManagementBloc>().add(const CreditManagementSubmitted());
  }

  void _onPartyChanged(String name) {
    final bloc = context.read<CreditManagementBloc>();
    final match = bloc.state.parties.where((p) => p.name == name).firstOrNull;
    if (match != null) bloc.add(CreditManagementPartySelected(match.id));
  }

  Future<void> _pickDate() async {
    final bloc = context.read<CreditManagementBloc>();
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: bloc.state.date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) bloc.add(CreditManagementDateChanged(picked));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditManagementBloc, CreditManagementState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(
            context,
            AppConstants.successSuccessMsg,
          );
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: UnfocusWrapper(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: context.grey50,
          appBar: CustomAppBar(title: AppConstants.creditManagmentTitle),
          body: Column(
            children: [
              BlocBuilder<CreditManagementBloc, CreditManagementState>(
                buildWhen: (p, c) =>
                    p.filterCollapsed != c.filterCollapsed ||
                    p.date != c.date ||
                    p.parties != c.parties ||
                    p.partiesStatus != c.partiesStatus,
                builder: (context, state) => AnimatedSize(
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeInOut,
                  alignment: .topCenter,
                  child: state.filterCollapsed
                      ? CompactFilterBar(
                          partyName: _partyController.text,
                          date: state.date,
                          onExpand: () {
                            context.read<CreditManagementBloc>().add(
                              const CreditManagementFilterCollapsed(false),
                            );
                            if (_scrollController.hasClients) {
                              _scrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            }
                          },
                        )
                      : FilterForm(
                          date: state.date,
                          partyController: _partyController,
                          parties: state.parties,
                          partiesStatus: state.partiesStatus,
                          onPartyChanged: _onPartyChanged,
                          onPickDate: _pickDate,
                          onView: _fetch,
                        ),
                ),
              ),
              const CreditStatCards(),
              Expanded(
                child: ColoredBox(
                  color: context.white,
                  child: BlocBuilder<CreditManagementBloc, CreditManagementState>(
                    buildWhen: (p, c) =>
                        p.apiStatus != c.apiStatus ||
                        p.message != c.message,
                    builder: (context, state) {
                      if (state.apiStatus == ApiStatus.LOADING) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.apiStatus == ApiStatus.FAILURE) {
                        return Center(
                          child: Text(
                            state.message ?? AppConstants.somethingWentWrong,
                            style: context.bodySmall.copyWith(
                              color: context.textSecondary,
                            ),
                            textAlign: .center,
                          ),
                        );
                      }
                      return CreditTable(
                          scrollController: _scrollController);
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
