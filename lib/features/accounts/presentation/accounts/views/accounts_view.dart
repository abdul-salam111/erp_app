import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantic_erp_app/features/dashboard/presentation/widgets/dashboard_widgets.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';
import '../widgets/accounts_widgets.dart';


class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AccountsBloc>(),
      child: const _AccountsBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────
class _AccountsBody extends StatefulWidget {
  const _AccountsBody();
  @override
  State<_AccountsBody> createState() => _AccountsBodyState();
}

class _AccountsBodyState extends State<_AccountsBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entryCtrl;
  late final List<Animation<double>> _fades;
  late final List<Animation<Offset>> _slides;
  static const _offscreen = Offset(0, 0.06);

  static const _statItems = <OverviewItem>[
    OverviewItem(
      label: AppConstants.totalReceivedTodayLabel,
      icon: Icons.monetization_on_outlined,
      color: AppColors.green,
    ),
    OverviewItem(
      label: AppConstants.totalPostponeLabel,
      icon: Icons.attach_money_rounded,
      color: AppColors.errorBright,
    ),
    OverviewItem(
      label: AppConstants.totalDueTodayLabel,
      icon: Icons.credit_card_outlined,
      color: AppColors.orange,
    ),
  ];


  Animation<double> _fade(double start, double end) => CurvedAnimation(
    parent: _entryCtrl,
    curve: Interval(start, end, curve: Curves.easeOut),
  );

  Animation<Offset> _slide(double start, double end) =>
      Tween<Offset>(begin: _offscreen, end: Offset.zero).animate(
        CurvedAnimation(
          parent: _entryCtrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void initState() {
    super.initState();
    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fades = [
      _fade(0.00, 0.45), // section header
      _fade(0.15, 0.55), // stat cards
      _fade(0.30, 0.65), // divider + list section
    ];
    _slides = [
      _slide(0.00, 0.45),
      _slide(0.15, 0.55),
      _slide(0.30, 0.65),
    ];
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    super.dispose();
  }

  void _showRecoveryListSheet(BuildContext context) {
    final bloc = context.read<AccountsBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: const _RecoveryListSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountsBloc, AccountsState>(
      listenWhen: (prev, curr) => prev.apiStatus != curr.apiStatus,
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
          backgroundColor: context.white,
          appBar: CustomAppBar(title: AppConstants.accountsLabel),
        
          body: Column(
            crossAxisAlignment: .start,
            children: [
              if (featureAccess.has(SystemPermissionKeys.recoveryDue)) ...[
              // ── Sticky filter badges ──────────────────────────────────────
              Container(
                color: context.white,
                padding: EdgeInsets.symmetric(
                  horizontal: context.pagePadding.left,
                  vertical: 10,
                ),
                child: BlocBuilder<AccountsBloc, AccountsState>(
                  buildWhen: (p, c) => p.selectedFilter != c.selectedFilter,
                  builder: (context, state) => Row(
                    children: [
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.todayLabel,
                          selected: state.selectedFilter == FilterType.today,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.today),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.weekLabel,
                          selected: state.selectedFilter == FilterType.week,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.week),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.monthLabel,
                          selected: state.selectedFilter == FilterType.month,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.month),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.oldestLabel,
                          selected: state.selectedFilter == FilterType.oldest,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.oldest),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: AppColors.grey200),
              ],
              // ── Scrollable content ────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: context.pagePadding,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                if (featureAccess.has(SystemPermissionKeys.recoveryDue)) ...[
                // [0] ── Section header ──────────────────────────────────────
                FadeTransition(
                  opacity: _fades[0],
                  child: SlideTransition(
                    position: _slides[0],
                    child: SectionHeader(
                      title: AppConstants.recoveryDueTodayTitle,
                      trailing: context.isPhone
                          ? TextButton(
                              onPressed: () =>
                                  _showRecoveryListSheet(context),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Row(
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    AppConstants.showDetails,
                                    style: context.labelMedium.copyWith(
                                      color: context.primary,
                                      fontWeight: .w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: context.primary,
                                    size: 18,
                                  ),
                                ],
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // [1] ── Stat cards ───────────────────────────────────────────
                FadeTransition(
                  opacity: _fades[1],
                  child: SlideTransition(
                    position: _slides[1],
                    child: BlocBuilder<AccountsBloc, AccountsState>(
                      buildWhen: (p, c) =>
                          p.recoveryDueStatus != c.recoveryDueStatus ||
                          p.recoveryDue != c.recoveryDue,
                      builder: (context, state) {
                        final isLoading =
                            state.recoveryDueStatus == ApiStatus.INITIAL ||
                            state.recoveryDueStatus == ApiStatus.LOADING;
                        final rd = state.recoveryDue;
                        String fmt(double? v) => v == null
                            ? AppConstants.rs0
                            : 'Rs ${v.formatPrice()}';

                        if (isLoading) {
                          return Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: .stretch,
                                  children: [
                                    Expanded(
                                      child: ShimmerBox(height: 62, radius: 10),
                                    ),
                                    SizedBox(width: context.gridSpacing),
                                    Expanded(
                                      child: ShimmerBox(height: 62, radius: 10),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: context.gridSpacing),
                              ShimmerBox(height: 62, radius: 10),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: .stretch,
                                children: [
                                  Expanded(
                                    child: OverviewStatCard(
                                      label: _statItems[0].label,
                                      value: fmt(rd?.ttlReceivedAmount),
                                      icon: _statItems[0].icon,
                                      color: _statItems[0].color,
                                    ),
                                  ),
                                  SizedBox(width: context.gridSpacing),
                                  Expanded(
                                    child: OverviewStatCard(
                                      label: _statItems[1].label,
                                      value: fmt(rd?.ttlPostponeAmount),
                                      icon: _statItems[1].icon,
                                      color: _statItems[1].color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: context.gridSpacing),
                            OverviewStatCard(
                              label: _statItems[2].label,
                              value: fmt(rd?.ttlRecoveryAmount),
                              icon: _statItems[2].icon,
                              color: _statItems[2].color,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                // [2] ── Divider before quick actions ──────────────────────
                FadeTransition(
                  opacity: _fades[2],
                  child: SlideTransition(
                    position: _slides[2],
                    child: const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.grey200,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ],
                // [3] ── Quick actions ────────────────────────────────────────
                const AccountsQuickActions(),
                const SizedBox(height: 8),
                    ],
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

// ─── "Show list" bottom sheet — filters + recovery list ────────────────────────

class _RecoveryListSheet extends StatelessWidget {
  const _RecoveryListSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.88,
      ),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const .vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.border,
                borderRadius: .circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Container(
                  padding: .all(9),
                  decoration: BoxDecoration(
                    color: context.primary.withValues(alpha: 0.10),
                    borderRadius: .circular(10),
                  ),
                  child: Icon(
                    Icons.receipt_long_outlined,
                    color: context.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    AppConstants.recoveryDueTodayTitle,
                    style: context.titleSmall.copyWith(fontWeight: .w700),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: .all(6),
                    decoration: BoxDecoration(
                      color: context.grey100,
                      shape: .circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: context.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, thickness: 1, color: AppColors.grey200),
          // ── Fixed area: filter chips + search bar (never scrolls) ────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                BlocBuilder<AccountsBloc, AccountsState>(
                  buildWhen: (p, c) => p.selectedFilter != c.selectedFilter,
                  builder: (context, state) => Row(
                    children: [
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.todayLabel,
                          selected: state.selectedFilter == FilterType.today,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.today),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.weekLabel,
                          selected: state.selectedFilter == FilterType.week,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.week),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.monthLabel,
                          selected: state.selectedFilter == FilterType.month,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.month),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _RecoveryFilterBadge(
                          label: AppConstants.oldestLabel,
                          selected: state.selectedFilter == FilterType.oldest,
                          onTap: () => context.read<AccountsBloc>().add(
                            const RecoveryFilterChanged(FilterType.oldest),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const RecoverySearchBar(),
                const SizedBox(height: 12),
              ],
            ),
          ),
          // ── Scrollable area: only the invoice list scrolls ───────────────
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                20, 0, 20, MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
              child: const RecoveryInvoiceList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Filter badge ─────────────────────────────────────────────────────────────

class _RecoveryFilterBadge extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RecoveryFilterBadge({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: .symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? context.primary : AppColors.transparent,
          borderRadius: .circular(20),
          border: Border.all(
            color: selected ? context.primary : AppColors.grey200,
          ),
        ),
        child: Text(
          label,
          textAlign: .center,
          style: context.labelSmall.copyWith(
            color: selected ? AppColors.white : context.textSecondary,
            fontWeight: .w600,
          ),
        ),
      ),
    );
  }
}
