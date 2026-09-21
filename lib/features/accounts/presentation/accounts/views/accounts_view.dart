import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
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
    ];
    _slides = [
      _slide(0.00, 0.45),
      _slide(0.15, 0.55),
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
          backgroundColor: context.background,
          appBar: CustomAppBar(title: AppConstants.accountsLabel),
        
          body: Column(
            crossAxisAlignment: .start,
            children: [
              if (featureAccess.has(SystemPermissionKeys.recoveryDue)) ...[
              // ── Sticky filter badges ──────────────────────────────────────
              Container(
                color: context.background,
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
              Divider(
                height: 1,
                thickness: 1,
                color: context.isDark ? context.navyBorder : context.divider,
              ),
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
                          ? _ShowDetailsButton(
                              onTap: () => _showRecoveryListSheet(context),
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
                        final gap = context.gridSpacing + 8;
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
                                    SizedBox(width: gap),
                                    Expanded(
                                      child: ShimmerBox(height: 62, radius: 10),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: gap),
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
                                  SizedBox(width: gap),
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
                            SizedBox(height: gap),
                            _RecoveryProgressCard(
                              label: _statItems[2].label,
                              icon: _statItems[2].icon,
                              color: _statItems[2].color,
                              target: rd?.ttlRecoveryAmount ?? 0,
                              received: rd?.ttlReceivedAmount ?? 0,
                              targetLabel: fmt(rd?.ttlRecoveryAmount),
                              receivedLabel: fmt(rd?.ttlReceivedAmount),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 28),
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
        color: context.background,
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
                color: context.isDark ? context.navyBorder : context.border,
                borderRadius: .circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: .circular(12),
                    gradient: LinearGradient(
                      begin: .topLeft,
                      end: .bottomRight,
                      colors: [
                        context.accentBlue.withValues(alpha: 0.28),
                        context.accentBlue.withValues(alpha: 0.10),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.receipt_long_outlined,
                    color: context.accentBlue,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        AppConstants.recoveryDueTodayTitle,
                        style: context.titleSmall.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Filter, search and track pending invoices',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 11.5,
                        ),
                      ),
                    ],
                  ),
                ),
                context.isDark
                    ? GlassIconButton(
                        onPressed: () => Navigator.pop(context),
                        size: 32,
                        iconSize: 14,
                        shape: GlassIconButtonShape.circle,
                        icon: Icon(
                          Icons.close_rounded,
                          size: 14,
                          color: context.textSecondary,
                        ),
                      )
                    : GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: context.surface,
                            shape: .circle,
                            border: Border.all(color: context.border),
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
          Divider(
            height: 1,
            thickness: 1,
            color: context.isDark ? context.navyBorder : context.divider,
          ),
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
    final text = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text(
        label,
        textAlign: .center,
        style: context.labelSmall.copyWith(
          color: selected ? context.whiteText : context.textSecondary,
          fontWeight: .w600,
        ),
      ),
    );

    if (selected) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: context.accentBlue,
            borderRadius: .circular(20),
            border: Border.all(color: context.accentBlue),
          ),
          child: text,
        ),
      );
    }

    if (context.isDark) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: GlassContainer(
          shape: const LiquidRoundedSuperellipse(borderRadius: 20),
          child: text,
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          border: Border.all(color: context.border),
        ),
        child: text,
      ),
    );
  }
}

// ─── Recovery progress card (full-width) ─────────────────────────────────────

class _RecoveryProgressCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final double target;
  final double received;
  final String targetLabel;
  final String receivedLabel;

  const _RecoveryProgressCard({
    required this.label,
    required this.icon,
    required this.color,
    required this.target,
    required this.received,
    required this.targetLabel,
    required this.receivedLabel,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target > 0
        ? (received / target).clamp(0.0, 1.0)
        : 0.0;
    final pctLabel = '${(progress * 100).round()}%';

    return GlassSurface(
      radius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: .circular(10),
                  gradient: context.isDark
                      ? RadialGradient(
                          colors: [
                            color.withValues(alpha: 0.28),
                            color.withValues(alpha: 0.06),
                          ],
                        )
                      : null,
                  color: context.isDark
                      ? null
                      : color.withValues(alpha: 0.10),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      targetLabel,
                      style: context.bodyMedium.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 18,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: context.isDark ? 0.18 : 0.12),
                  borderRadius: .circular(20),
                ),
                child: Text(
                  pctLabel,
                  style: context.labelSmall.copyWith(
                    color: color,
                    fontWeight: .w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: .circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: context.isDark
                  ? AppColors.white.withValues(alpha: 0.08)
                  : color.withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '$receivedLabel recovered',
                style: context.labelSmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 11,
                ),
              ),
              Text(
                'of $targetLabel',
                style: context.labelSmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShowDetailsButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ShowDetailsButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: .min,
        children: [
          Text(
            AppConstants.showDetails,
            style: context.labelMedium.copyWith(
              color: context.accentBlue,
              fontWeight: .w600,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            Icons.chevron_right_rounded,
            color: context.accentBlue,
            size: 18,
          ),
        ],
      ),
    );

    if (context.isDark) {
      return GestureDetector(
        onTap: onTap,
        child: GlassContainer(
          shape: const LiquidRoundedSuperellipse(borderRadius: 999),
          child: content,
        ),
      );
    }

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: content,
    );
  }
}
