import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/bank_list.dart';
import '../widgets/compact_totals_bar.dart';
import '../widgets/hero_card.dart';
import '../widgets/summary_row.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class BankAndCashPositionView extends StatelessWidget {
  const BankAndCashPositionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BankAndCashPositionBloc>(),
      child: const _BankAndCashPositionBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _BankAndCashPositionBody extends StatefulWidget {
  const _BankAndCashPositionBody();

  @override
  State<_BankAndCashPositionBody> createState() =>
      _BankAndCashPositionBodyState();
}

class _BankAndCashPositionBodyState extends State<_BankAndCashPositionBody> {
  late final ScrollController _scrollController;
  bool _collapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    final pixels = position.pixels;
    // Collapsing the hero + summary frees ~240 px. If the list isn't tall
    // enough for that headroom, collapsing would snap the scroll back to 0
    // and instantly re-expand, causing oscillation. Only collapse when the
    // list can sustain the collapsed layout, and only uncollapse near the top.
    if (!_collapsed) {
      if (pixels > 80 && position.maxScrollExtent > 300) {
        setState(() => _collapsed = true);
      }
    } else {
      if (pixels < 20) {
        setState(() => _collapsed = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAndCashPositionBloc, BankAndCashPositionState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(
            context,
            state.message ?? AppConstants.somethingWentWrong,
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state.apiStatus == ApiStatus.LOADING ||
            state.apiStatus == ApiStatus.INITIAL;
        final bankCashItems = state.items;

        final bankTotal = bankCashItems
            .where((bankCashItem) => bankCashItem.isBank)
            .fold(0.0, (sum, bankCashItem) => sum + bankCashItem.amount);
        final cashTotal = bankCashItems
            .where((bankCashItem) => bankCashItem.isCash)
            .fold(0.0, (sum, bankCashItem) => sum + bankCashItem.amount);

        return Scaffold(
          backgroundColor: context.grey50,
          appBar: CustomAppBar(title: AppConstants.bankCashPositionLabel),
          body: Column(
            crossAxisAlignment: .stretch,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: _collapsed
                    ? const SizedBox.shrink()
                    : ColoredBox(
                        color: context.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: isLoading
                              ? const BankAndCashHeroCardShimmer()
                              : BankAndCashHeroCard(bankCashItems: bankCashItems),
                        ),
                      ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: _collapsed
                    ? const SizedBox.shrink()
                    : BankAndCashSummaryRow(
                        bankCashItems: bankCashItems,
                        isLoading: isLoading,
                      ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: (_collapsed && !isLoading)
                    ? BankAndCashCompactTotalsBar(
                        bankTotal: bankTotal,
                        cashTotal: cashTotal,
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: isLoading
                    ? const BankAndCashListShimmer()
                    : BankAndCashList(
                        bankCashItems: bankCashItems,
                        scrollController: _scrollController,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
