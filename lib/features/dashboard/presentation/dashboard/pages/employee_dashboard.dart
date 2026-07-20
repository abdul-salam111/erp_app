import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../widgets/dashboard_widgets.dart';

class EmployeeDashboard extends StatelessWidget {
  const EmployeeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      drawer: AppDrawer(
        userName: currentUser.fullName,
        orgName: currentUser.org.name,
        onOrgTap: () {
          Navigator.pop(context);
          context.pushNamed(RouteNames.organizationSelection);
        },
        items: [
          DrawerItem.tile(
            label: AppConstants.dashboardLabel,
            icon: Iconsax.home_2,
            color: AppColors.primary,
            routeName: RouteNames.employee_dashboard,
          ),
          DrawerItem.tile(
            label: AppConstants.profileLabel,
            icon: Iconsax.profile_circle,
            color: AppColors.tealDark,
            routeName: RouteNames.profile,
          ),
          DrawerItem.divider(),
          DrawerItem.category(AppConstants.modules),
          DrawerItem.tile(
            label: AppConstants.noticesLabel,
            icon: Iconsax.notification_bing,
            color: AppColors.orange,
          ),
          DrawerItem.tile(
            label: AppConstants.attendanceLabel,
            icon: Iconsax.calendar_tick,
            color: AppColors.green,
          ),
          DrawerItem.tile(
            label: AppConstants.leaveRequestLabel,
            icon: Iconsax.calendar_remove,
            color: AppColors.errorBright,
          ),
          DrawerItem.tile(
            label: AppConstants.loanAdvanceLabel,
            icon: Iconsax.money_send,
            color: AppColors.purple,
          ),
          DrawerItem.tile(
            label: AppConstants.overtimeLabel,
            icon: Iconsax.timer_1,
            color: AppColors.cyan,
          ),
          DrawerItem.tile(
            label: AppConstants.salaryLabel,
            icon: Iconsax.wallet_money,
            color: AppColors.primary,
          ),
          DrawerItem.tile(
            label: AppConstants.acStatementsLabel,
            icon: Iconsax.document_text,
            color: AppColors.blueGrey,
            routeName: RouteNames.account_ledger,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            const _EmployeeHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: context.pagePadding.copyWith(top: 0),
              child: const Column(
                crossAxisAlignment: .start,
                children: [
                  _MonthlySnapshotSection(),
                  SizedBox(height: 20),
                  _WorkspaceMenuSection(),
                  SizedBox(height: 20),
                  _NoticeBoardSection(),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Employee header with inline attendance strip ─────────────────────────────

class _EmployeeHeader extends StatelessWidget {
  const _EmployeeHeader();

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return AppConstants.goodMorning;
    if (hour < 17) return AppConstants.goodAfternoon;
    return AppConstants.goodEveningMsg;
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final hPad = context.pagePadding.left;

    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primary, context.primary.withValues(alpha: 0.72)],
          begin: .topLeft,
          end: .bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: top - 35,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            left: -25,
            bottom: -15,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: top + 14,
              bottom: 18,
              left: hPad,
              right: hPad,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // ── App-bar row ──
                Row(
                  children: [
                    _HeaderIconBtn(
                      icon: Icons.menu_rounded,
                      onTap: () => Scaffold.of(context).openDrawer(),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        AppConstants.employeePortalTitle,
                        style: context.titleSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: .w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    Stack(
                      clipBehavior: .none,
                      children: [
                        _HeaderIconBtn(
                          icon: Iconsax.notification,
                          onTap: () =>
                              context.pushNamed(RouteNames.alert_panel),
                        ),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.redAccent,
                              shape: .circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                // ── Identity row ──
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pushNamed(RouteNames.profile),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: .circle,
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.45),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor:
                              AppColors.white.withValues(alpha: 0.18),
                          child: Text(
                            _initials(currentUser.fullName),
                            style: context.titleMedium.copyWith(
                              color: AppColors.white,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '$_greeting 👋',
                            style: context.labelSmall.copyWith(
                              color: AppColors.white.withValues(alpha: 0.80),
                              fontWeight: .w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            currentUser.fullName,
                            style: context.titleLarge.copyWith(
                              color: AppColors.white,
                              fontWeight: .w700,
                              height: 1.1,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              const _HeaderChip(
                                icon: Iconsax.personalcard,
                                label: 'EMP-0231',
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: _HeaderChip(
                                  icon: Iconsax.buildings,
                                  label: currentUser.org.name,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // ── Attendance strip — read-only, synced from biometric ──
                Container(
                  padding: .symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.12),
                    borderRadius: .circular(14),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.14),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: _MiniStat(
                          icon: Iconsax.login,
                          label: AppConstants.checkInLabel,
                          value: '09:04 AM',
                        ),
                      ),
                      _StripDivider(),
                      Expanded(
                        child: _MiniStat(
                          icon: Iconsax.logout_1,
                          label: AppConstants.checkOutLabel,
                          value: '--:--',
                        ),
                      ),
                      _StripDivider(),
                      Expanded(
                        child: _MiniStat(
                          icon: Iconsax.timer_1,
                          label: AppConstants.totalHoursLabel,
                          value: '5h 12m',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MiniStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Icon(icon, size: 14, color: AppColors.white.withValues(alpha: 0.70)),
        const SizedBox(width: 7),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              value,
              style: context.labelMedium.copyWith(
                color: AppColors.white,
                fontWeight: .w700,
                fontSize: 12.5,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: AppColors.white.withValues(alpha: 0.60),
                fontSize: 9.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StripDivider extends StatelessWidget {
  const _StripDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 26,
      color: AppColors.white.withValues(alpha: 0.15),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.15),
        borderRadius: .circular(20),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(icon, color: AppColors.white.withValues(alpha: 0.85), size: 11),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              style: context.labelSmall.copyWith(
                color: AppColors.white.withValues(alpha: 0.90),
                fontWeight: .w500,
                fontSize: 10.5,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.15),
          borderRadius: .circular(10),
        ),
        child: Icon(icon, color: AppColors.white, size: 20),
      ),
    );
  }
}

// ─── Monthly snapshot ─────────────────────────────────────────────────────────

class _MonthlySnapshotSection extends StatelessWidget {
  const _MonthlySnapshotSection();

  static const _stats = <_StatMeta>[
    _StatMeta(
      label: AppConstants.leaveBalanceLabel,
      value: '12 days',
      icon: Iconsax.calendar_1,
      color: AppColors.green,
    ),
    _StatMeta(
      label: AppConstants.attendanceRateLabel,
      value: '96%',
      icon: Iconsax.tick_circle,
      color: AppColors.primary,
    ),
    _StatMeta(
      label: AppConstants.overtimeMonthLabel,
      value: '8h 30m',
      icon: Iconsax.timer_1,
      color: AppColors.cyan,
    ),
    _StatMeta(
      label: AppConstants.loanOutstandingLabel,
      value: 'Rs 25,000',
      icon: Iconsax.money_send,
      color: AppColors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.monthlySnapshotTitle),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          padding: .zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _stats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.gridColumnCount,
            mainAxisSpacing: context.gridSpacing,
            crossAxisSpacing: context.gridSpacing,
            childAspectRatio: context.overviewCardRatio,
          ),
          itemBuilder: (context, i) => OverviewStatCard(
            label: _stats[i].label,
            value: _stats[i].value,
            icon: _stats[i].icon,
            color: _stats[i].color,
          ),
        ),
      ],
    );
  }
}

class _StatMeta {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatMeta({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });
}

// ─── Workspace menu grid ──────────────────────────────────────────────────────

class _WorkspaceMenuSection extends StatelessWidget {
  const _WorkspaceMenuSection();

  static const _items = <_MenuMeta>[
    _MenuMeta(
      label: AppConstants.noticesLabel,
      subtitle: AppConstants.noticesSubtitle,
      icon: Iconsax.notification_bing,
      color: AppColors.orange,
    ),
    _MenuMeta(
      label: AppConstants.attendanceLabel,
      subtitle: AppConstants.attendanceSubtitle,
      icon: Iconsax.calendar_tick,
      color: AppColors.green,
    ),
    _MenuMeta(
      label: AppConstants.leaveRequestLabel,
      subtitle: AppConstants.leaveRequestSubtitle,
      icon: Iconsax.calendar_remove,
      color: AppColors.errorBright,
    ),
    _MenuMeta(
      label: AppConstants.loanAdvanceLabel,
      subtitle: AppConstants.loanAdvanceSubtitle,
      icon: Iconsax.money_send,
      color: AppColors.purple,
    ),
    _MenuMeta(
      label: AppConstants.overtimeLabel,
      subtitle: AppConstants.overtimeSubtitle,
      icon: Iconsax.timer_1,
      color: AppColors.cyan,
    ),
    _MenuMeta(
      label: AppConstants.salaryLabel,
      subtitle: AppConstants.salarySubtitle,
      icon: Iconsax.wallet_money,
      color: AppColors.primary,
    ),
    _MenuMeta(
      label: AppConstants.acStatementsLabel,
      subtitle: AppConstants.acStatementsSubtitle,
      icon: Iconsax.document_text,
      color: AppColors.blueGrey,
      routeName: RouteNames.account_ledger,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 118,
      tablet: 128,
      ipad: 138,
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.myWorkspaceTitle),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          padding: .zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.gridColumnCount,
            mainAxisExtent: cardHeight,
            mainAxisSpacing: context.gridSpacing,
            crossAxisSpacing: context.gridSpacing,
          ),
          itemBuilder: (context, i) => _WorkspaceCard(item: _items[i]),
        ),
      ],
    );
  }
}

class _WorkspaceCard extends StatelessWidget {
  final _MenuMeta item;

  const _WorkspaceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.routeName != null
          ? () => context.pushNamed(item.routeName!)
          : null,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        clipBehavior: .hardEdge,
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -22,
              right: -22,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: item.color.withValues(alpha: 0.08),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: item.color.withValues(alpha: 0.12),
                      borderRadius: .circular(12),
                    ),
                    child: Icon(item.icon, color: item.color, size: 20),
                  ),
                  const Spacer(),
                  Text(
                    item.label,
                    style: context.labelLarge.copyWith(
                      fontWeight: .w700,
                      color: context.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.subtitle,
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 10.5,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ),
                      Icon(
                        Iconsax.arrow_right_3,
                        size: 13,
                        color: item.color,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuMeta {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? routeName;

  const _MenuMeta({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.routeName,
  });
}

// ─── Notice board ─────────────────────────────────────────────────────────────

class _NoticeBoardSection extends StatelessWidget {
  const _NoticeBoardSection();

  static const _notices = <_NoticeMeta>[
    _NoticeMeta(
      title: 'Eid Holidays Announcement',
      snippet: 'Office will remain closed from 27th to 30th. Plan handovers accordingly.',
      date: 'Jul 18',
      color: AppColors.green,
    ),
    _NoticeMeta(
      title: 'Salary Disbursement Update',
      snippet: 'July salaries will be credited by the 1st of next month.',
      date: 'Jul 15',
      color: AppColors.primary,
    ),
    _NoticeMeta(
      title: 'Biometric Attendance Policy',
      snippet: 'All employees must mark attendance via the biometric device from Aug 1.',
      date: 'Jul 12',
      color: AppColors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SectionHeader(
          title: AppConstants.noticeBoardTitle,
          trailing: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisSize: .min,
              children: [
                Text(
                  AppConstants.viewAll,
                  style: context.labelMedium.copyWith(
                    color: context.primary,
                    fontWeight: .w600,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: context.primary,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(_notices.length, (i) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: i == _notices.length - 1 ? 0 : context.gridSpacing,
            ),
            child: _NoticeTile(notice: _notices[i]),
          );
        }),
      ],
    );
  }
}

class _NoticeTile extends StatelessWidget {
  final _NoticeMeta notice;

  const _NoticeTile({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            Container(width: 4, color: notice.color),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: notice.color.withValues(alpha: 0.12),
                            borderRadius: .circular(9),
                          ),
                          child: Icon(
                            Iconsax.notification_1,
                            color: notice.color,
                            size: 15,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            notice.title,
                            style: context.labelLarge.copyWith(
                              fontWeight: .w700,
                              color: context.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: .symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: context.grey50,
                            borderRadius: .circular(20),
                          ),
                          child: Text(
                            notice.date,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 10,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notice.snippet,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        height: 1.35,
                      ),
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoticeMeta {
  final String title;
  final String snippet;
  final String date;
  final Color color;

  const _NoticeMeta({
    required this.title,
    required this.snippet,
    required this.date,
    required this.color,
  });
}
