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

  static const _items = <OverviewItem>[
    OverviewItem(
      label: AppConstants.totalReceivedTodayLabel,
      icon: Icons.monetization_on_outlined,
      color: Color(0xFF4CAF50),
    ),
    OverviewItem(
      label: AppConstants.totalPostponeLabel,
      icon: Icons.attach_money_rounded,
      color: Color(0xFFE53935),
    ),
    OverviewItem(
      label: AppConstants.totalDueTodayLabel,
      icon: Icons.credit_card_outlined,
      color: Color(0xFFFF9800),
    ),
  ];

  static const _rows = <CustomerRow>[
    CustomerRow(
      initials: 'HT',
      name: 'HR Trader & Comission',
      city: 'Bahawalpur',
      invoiceNo: 'SI-0370',
      date: '01 Jul 2025',
      paid: '0.00',
      total: '98,750',
      status: CustomerStatus.actionRequired,
    ),
    CustomerRow(
      initials: 'PI',
      name: 'Pepsico Int',
      city: 'Lahore',
      invoiceNo: 'SI-0002',
      date: '02 Jul 2025',
      paid: '0.00',
      total: '1,683,588',
      status: CustomerStatus.actionRequired,
    ),
    CustomerRow(
      initials: 'NK',
      name: 'Nawab Khan',
      city: 'Peshawar',
      invoiceNo: 'SI-0004',
      date: '03 Jul 2025',
      paid: '0.00',
      total: '2,765,000',
      status: CustomerStatus.actionRequired,
    ),
    CustomerRow(
      initials: 'HR',
      name: 'Hilal Retail Brands Pvt Ltd',
      city: 'Lahore',
      invoiceNo: 'SI-0006',
      date: '04 Jul 2025',
      paid: '37,878',
      total: '120,000',
      status: CustomerStatus.partial,
    ),
    CustomerRow(
      initials: 'AM',
      name: 'Al-Madina Traders',
      city: 'Karachi',
      invoiceNo: 'SI-0010',
      date: '05 Jul 2025',
      paid: '0.00',
      total: '540,000',
      status: CustomerStatus.actionRequired,
    ),
    CustomerRow(
      initials: 'ZB',
      name: 'Zafar Brothers',
      city: 'Multan',
      invoiceNo: 'SI-0014',
      date: '06 Jul 2025',
      paid: '15,000',
      total: '75,000',
      status: CustomerStatus.partial,
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
      _fade(0.50, 0.90), // quick actions
    ];
    _slides = [
      _slide(0.00, 0.45),
      _slide(0.15, 0.55),
      _slide(0.30, 0.65),
      _slide(0.50, 0.90),
    ];
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    super.dispose();
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
          appBar: CustomAppBar(title: AppConstants.accountsLabel),
          body: SingleChildScrollView(
            padding: context.pagePadding,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // [0] ── Section header ──────────────────────────────────────
                FadeTransition(
                  opacity: _fades[0],
                  child: SlideTransition(
                    position: _slides[0],
                    child: BlocBuilder<AccountsBloc, AccountsState>(
                      buildWhen: (prev, curr) =>
                          prev.todayOverviewExpanded !=
                          curr.todayOverviewExpanded,
                      builder: (context, state) => SectionHeader(
                        title: AppConstants.recoveryDueTodayTitle,
                        trailing: context.isPhone
                            ? GestureDetector(
                                onTap: () => context.read<AccountsBloc>().add(
                                  const TodayOverviewExpansionToggled(),
                                ),
                                child: Row(
                                  mainAxisSize: .min,
                                  children: [
                                    Text(
                                      state.todayOverviewExpanded
                                          ? AppConstants.hideDetails
                                          : AppConstants.showDetails,
                                      style: context.labelMedium.copyWith(
                                        color: context.primary,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    AnimatedRotation(
                                      turns: state.todayOverviewExpanded
                                          ? 0.5
                                          : 0,
                                      duration: const Duration(
                                        milliseconds: 380,
                                      ),
                                      curve: Curves.easeInOutCubic,
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: context.primary,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // [1] ── Stat cards ───────────────────────────────────────────
                FadeTransition(
                  opacity: _fades[1],
                  child: SlideTransition(
                    position: _slides[1],
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: .stretch,
                            children: [
                              Expanded(
                                child: OverviewStatCard(
                                  label: _items[0].label,
                                  value: 'Rs 318,073',
                                  icon: _items[0].icon,
                                  color: _items[0].color,
                                ),
                              ),
                              SizedBox(width: context.gridSpacing),
                              Expanded(
                                child: OverviewStatCard(
                                  label: _items[1].label,
                                  value: 'Rs 318,073',
                                  icon: _items[1].icon,
                                  color: _items[1].color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: context.gridSpacing),
                        OverviewStatCard(
                          label: _items[2].label,
                          value: 'Rs 318,073,375.57',
                          icon: _items[2].icon,
                          color: _items[2].color,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                // [2] ── Expandable recovery list ─────────────────────────────
                FadeTransition(
                  opacity: _fades[2],
                  child: SlideTransition(
                    position: _slides[2],
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFEDEDED),
                        ),
                        const SizedBox(height: 14),
                        BlocBuilder<AccountsBloc, AccountsState>(
                          buildWhen: (prev, curr) =>
                              prev.todayOverviewExpanded !=
                              curr.todayOverviewExpanded,
                          builder: (context, state) => AnimatedSize(
                            duration: const Duration(milliseconds: 420),
                            curve: Curves.easeInOutCubic,
                            alignment: .topCenter,
                            child: state.todayOverviewExpanded
                                ? RecoveryListSection(rows: _rows)
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // [3] ── Quick actions ────────────────────────────────────────
                FadeTransition(
                  opacity: _fades[3],
                  child: SlideTransition(
                    position: _slides[3],
                    child: const AccountsQuickActions(),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
