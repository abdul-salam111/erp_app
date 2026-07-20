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
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          DashboardHeader(
            userName: currentUser.fullName,
            orgName: currentUser.org.name,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: context.pagePadding.copyWith(top: 20),
              child: const Column(
                crossAxisAlignment: .start,
                children: [
                  _AttendanceHeroCard(),
                  SizedBox(height: 20),
                  _MonthlySnapshotSection(),
                  SizedBox(height: 20),
                  _WorkspaceMenuSection(),
                  SizedBox(height: 20),
                  _NoticeBoardSection(),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Attendance hero card ─────────────────────────────────────────────────────

class _AttendanceHeroCard extends StatelessWidget {
  const _AttendanceHeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: .topLeft,
          end: .bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.30),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -40,
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
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppConstants.todayAttendanceTitle,
                        style: context.titleSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: .w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: .symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.successLight.withValues(alpha: 0.22),
                        borderRadius: .circular(20),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: AppColors.successLight,
                              shape: .circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            AppConstants.onTimeLabel,
                            style: context.labelSmall.copyWith(
                              color: AppColors.white,
                              fontWeight: .w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: .center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            AppConstants.checkedInLabel,
                            style: context.labelSmall.copyWith(
                              color: AppColors.white.withValues(alpha: 0.75),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '09:04 AM',
                            style: context.headlineSmall.copyWith(
                              color: AppColors.white,
                              fontWeight: .w700,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Iconsax.clock,
                                size: 12,
                                color: AppColors.white.withValues(alpha: 0.75),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${AppConstants.shiftLabel} 09:00 – 17:00',
                                style: context.labelSmall.copyWith(
                                  color: AppColors.white.withValues(alpha: 0.80),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _CheckOutButton(onTap: () {}),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.65,
                    minHeight: 6,
                    backgroundColor: AppColors.white.withValues(alpha: 0.20),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '5h 12m ${AppConstants.workedLabel}',
                  style: context.labelSmall.copyWith(
                    color: AppColors.white.withValues(alpha: 0.80),
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

class _CheckOutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CheckOutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: .circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            const Icon(Iconsax.logout_1, color: AppColors.primary, size: 20),
            const SizedBox(height: 4),
            Text(
              AppConstants.checkOutLabel,
              style: context.labelSmall.copyWith(
                color: AppColors.primary,
                fontWeight: .w700,
              ),
            ),
          ],
        ),
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
