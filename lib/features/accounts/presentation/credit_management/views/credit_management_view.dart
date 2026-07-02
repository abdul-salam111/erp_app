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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CreditManagementBloc>().add(const CreditManagementSubmitted());
    });
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
    if (name.isEmpty) {
      bloc.add(const CreditManagementPartyCleared());
      return;
    }
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
    return UnfocusWrapper(
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
            BlocBuilder<CreditManagementBloc, CreditManagementState>(
              buildWhen: (p, c) =>
                  p.agingData != c.agingData || p.apiStatus != c.apiStatus,
              builder: (context, state) {
                if (state.apiStatus == ApiStatus.LOADING) {
                  return const _StatCardsShimmer();
                }
                final data = state.agingData;
                return CreditStatCards(
                  firstSegmentAmount: data?.firstSegmentAmount ?? 0,
                  secondSegmentAmount: data?.secondSegmentAmount ?? 0,
                  thirdSegmentAmount: data?.thirdSegmentAmount ?? 0,
                  fourthSegmentAmount: data?.fourthSegmentAmount ?? 0,
                );
              },
            ),
            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<CreditManagementBloc, CreditManagementState>(
                  buildWhen: (p, c) =>
                      p.apiStatus != c.apiStatus ||
                      p.agingData != c.agingData ||
                      p.message != c.message,
                  builder: (context, state) {
                    if (state.apiStatus == ApiStatus.LOADING) {
                      return const _TableShimmer();
                    }
                    if (state.apiStatus == ApiStatus.FAILURE) {
                      return AccountsErrorBody(
                        message:
                            state.message ?? AppConstants.somethingWentWrong,
                        onRetry: _fetch,
                      );
                    }
                    return CreditTable(
                      scrollController: _scrollController,
                      items: state.agingData?.partyCredits ?? const [],
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

// ─── Shimmer: stat cards ──────────────────────────────────────────────────────

class _StatCardsShimmer extends StatelessWidget {
  const _StatCardsShimmer();

  @override
  Widget build(BuildContext context) {
    final h = EdgeInsets.fromLTRB(
      context.pagePadding.left,
      0,
      context.pagePadding.right,
      8,
    );
    return Padding(
      padding: h,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: ShimmerBox(height: 58, radius: 10)),
              const SizedBox(width: 6),
              Expanded(child: ShimmerBox(height: 58, radius: 10)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: ShimmerBox(height: 58, radius: 10)),
              const SizedBox(width: 6),
              Expanded(child: ShimmerBox(height: 58, radius: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Shimmer: table rows ──────────────────────────────────────────────────────

class _TableShimmer extends StatelessWidget {
  const _TableShimmer();

  @override
  Widget build(BuildContext context) {
    final px = context.pagePadding.left;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: px),
      child: Column(
        children: [
          ShimmerBox(height: 40, radius: 10),
          const SizedBox(height: 1),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              separatorBuilder: (_, __) => const SizedBox(height: 1),
              itemBuilder: (_, __) => Padding(
                padding: .symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(flex: 6, child: ShimmerBox(height: 16, radius: 6)),
                    const SizedBox(width: 8),
                    ShimmerBox(width: 24, height: 24, radius: 12),
                    const SizedBox(width: 8),
                    Expanded(flex: 3, child: ShimmerBox(height: 16, radius: 6)),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
