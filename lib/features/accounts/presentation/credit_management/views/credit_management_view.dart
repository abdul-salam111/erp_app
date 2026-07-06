import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/credit_stat_cards.dart';
import '../widgets/credit_table.dart';

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
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.trim().toLowerCase());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CreditManagementBloc>().add(const CreditManagementSubmitted());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _fetch() {
    context.read<CreditManagementBloc>().add(const CreditManagementSubmitted());
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
            const SizedBox(height: 10),
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
            BlocBuilder<CreditManagementBloc, CreditManagementState>(
              buildWhen: (p, c) => p.apiStatus != c.apiStatus,
              builder: (context, state) {
                if (state.apiStatus != ApiStatus.SUCCESS) return const SizedBox.shrink();
                return Column(
                  mainAxisSize: .min,
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.pagePadding.left),
                      child: TextField(
                        controller: _searchController,
                        style: context.bodySmall.copyWith(fontSize: 13),
                        decoration: InputDecoration(
                          hintText: 'Search customer...',
                          hintStyle: context.bodySmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 13,
                          ),
                          prefixIcon: Icon(Icons.search_rounded, size: 18, color: context.textSecondary),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? GestureDetector(
                                  onTap: () => _searchController.clear(),
                                  child: Icon(Icons.close_rounded, size: 16, color: context.textSecondary),
                                )
                              : null,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 7),
                          filled: true,
                          fillColor: context.white,
                          border: OutlineInputBorder(
                            borderRadius: .circular(8),
                            borderSide: BorderSide(color: AppColors.grey200),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: .circular(8),
                            borderSide: BorderSide(color: AppColors.grey200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: .circular(8),
                            borderSide: BorderSide(color: context.primary),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            ),
            Expanded(
              child: ColoredBox(
                color: context.white,
                child: BlocBuilder<CreditManagementBloc, CreditManagementState>(
                  buildWhen: (p, c) =>
                      p.apiStatus != c.apiStatus || p.agingData != c.agingData,
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
                    final allItems = state.agingData?.partyCredits ?? const [];
                    final filtered = _searchQuery.isEmpty
                        ? allItems
                        : allItems
                            .where((c) => c.partyName
                                .toLowerCase()
                                .contains(_searchQuery))
                            .toList();
                    return CreditTable(
                      scrollController: _scrollController,
                      items: filtered,
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
    final padding = EdgeInsets.fromLTRB(
      context.pagePadding.left,
      0,
      context.pagePadding.right,
      8,
    );
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: const ShimmerBox(height: 58, radius: 10)),
              const SizedBox(width: 6),
              Expanded(child: const ShimmerBox(height: 58, radius: 10)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: const ShimmerBox(height: 58, radius: 10)),
              const SizedBox(width: 6),
              Expanded(child: const ShimmerBox(height: 58, radius: 10)),
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
          const ShimmerBox(height: 40, radius: 10),
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
                    Expanded(flex: 6, child: const ShimmerBox(height: 16, radius: 6)),
                    const SizedBox(width: 8),
                    const ShimmerBox(width: 24, height: 24, radius: 12),
                    const SizedBox(width: 8),
                    Expanded(flex: 3, child: const ShimmerBox(height: 16, radius: 6)),
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
