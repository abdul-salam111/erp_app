import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../../core/constants/system_permission_keys.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../widgets/dashboard_widgets.dart';

class EmployeeDashboard extends StatelessWidget {
  const EmployeeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            routeName: RouteNames.alert_panel,
          ),
          DrawerItem.tile(
            label: AppConstants.attendanceLabel,
            icon: Iconsax.calendar_tick,
            color: AppColors.green,
            routeName: RouteNames.attendance,
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
            routeName: RouteNames.loan_and_advance,
          ),
          DrawerItem.tile(
            label: AppConstants.overtimeLabel,
            icon: Iconsax.timer_1,
            color: AppColors.cyan,
            routeName: RouteNames.overtime,
          ),
          DrawerItem.tile(
            label: AppConstants.salaryLabel,
            icon: Iconsax.wallet_money,
            color: AppColors.primary,
            routeName: RouteNames.salary_mgmt,
          ),
          DrawerItem.tile(
            label: AppConstants.acStatementsLabel,
            icon: Iconsax.document_text,
            color: AppColors.blueGrey,
            routeName: RouteNames.employee_account_ledger,
            permissionKey: SystemPermissionKeys.accountLedger,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const _EmployeeSliverAppBar(),
          SliverPadding(
            padding: context.pagePadding.copyWith(top: 20),
            sliver: const SliverToBoxAdapter(
              child: Column(
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
          ),
        ],
      ),
    );
  }
}

// ─── Employee sliver header ───────────────────────────────────────────────────

class _EmployeeSliverAppBar extends StatelessWidget {
  const _EmployeeSliverAppBar();

  static const double _expandedHeight = 229;

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return AppConstants.goodMorning;
    if (hour < 17) return AppConstants.goodAfternoon;
    return AppConstants.goodEveningMsg;
  }

  String get _initials {
    final parts = currentUser.fullName.trim().split(' ');
    if (parts.length >= 2) return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    return parts.first.isNotEmpty ? parts.first[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final hPad = context.pagePadding.left;

    return SliverAppBar(
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.transparent,
      automaticallyImplyLeading: false,
      expandedHeight: _expandedHeight,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      leadingWidth: hPad + 38,
      leading: Padding(
        padding: EdgeInsets.only(left: hPad),
        child: Center(
          child: _HeaderIconBtn(
            icon: Icons.menu_rounded,
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      actions: [
        Center(
          child: Stack(
            clipBehavior: .none,
            children: [
              _HeaderIconBtn(
                icon: Iconsax.notification,
                onTap: () => context.pushNamed(RouteNames.alert_panel),
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
        ),
        const SizedBox(width: 8),
        Center(
          child: GestureDetector(
            onTap: () => context.pushNamed(RouteNames.profile),
            child: CircleAvatar(
              radius: 19,
              backgroundColor: AppColors.white.withValues(alpha: 0.15),
              child: const Icon(
                Iconsax.profile_circle,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
        ),
        SizedBox(width: hPad),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final minH = top + kToolbarHeight;
          final maxH = top + _expandedHeight;
          final t = ((constraints.maxHeight - minH) / (maxH - minH))
              .clamp(0.0, 1.0);
          // Expanded content fades out early; compact title fades in late —
          // the two never fully overlap mid-collapse.
          final expandedOpacity = ((t - 0.4) / 0.6).clamp(0.0, 1.0);
          final collapsedOpacity = ((0.35 - t) / 0.35).clamp(0.0, 1.0);

          return Container(
            clipBehavior: .hardEdge,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.primary,
                  context.primary.withValues(alpha: 0.72),
                ],
                begin: .topLeft,
                end: .bottomRight,
              ),
              // Corners flatten as the bar collapses into a regular app bar.
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(28 * t),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -35,
                  top: -20,
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

                // ── Toolbar title — expanded state ──
                Positioned(
                  top: top,
                  left: hPad + 48,
                  right: hPad + 94,
                  height: kToolbarHeight,
                  child: Opacity(
                    opacity: expandedOpacity,
                    child: Align(
                      alignment: .centerLeft,
                      child: Text(
                        AppConstants.employeePortalTitle,
                        style: context.titleSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: .w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Toolbar title — collapsed state (name) ──
                Positioned(
                  top: top,
                  left: hPad + 48,
                  right: hPad + 94,
                  height: kToolbarHeight,
                  child: Opacity(
                    opacity: collapsedOpacity,
                    child: Align(
                      alignment: .centerLeft,
                      child: Text(
                        currentUser.fullName,
                        style: context.titleSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: .w700,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                  ),
                ),

                // ── Expanded content — identity + attendance strip ──
                Positioned(
                  left: hPad,
                  right: hPad,
                  bottom: 18,
                  child: Opacity(
                    opacity: expandedOpacity,
                    child: Column(
                      mainAxisSize: .min,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          '$_greeting 👋',
                          style: context.labelSmall.copyWith(
                            color: AppColors.white.withValues(alpha: 0.80),
                            fontWeight: .w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: .center,
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundColor: AppColors.white.withValues(alpha: 0.20),
                              child: Text(
                                _initials,
                                style: context.titleSmall.copyWith(
                                  color: AppColors.white,
                                  fontWeight: .w700,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
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
                                  const SizedBox(height: 6),
                                  const Row(
                                    children: [
                                      _HeaderChip(
                                        icon: Iconsax.briefcase,
                                        label: 'Software Engineer',
                                      ),
                                      SizedBox(width: 6),
                                      _HeaderChip(
                                        icon: Iconsax.personalcard,
                                        label: 'EMP-0231',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        // ── Attendance strip — synced from biometric ──
                        Container(
                          padding: .symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.12),
                            borderRadius: .circular(10),
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
                ),
              ],
            ),
          );
        },
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
      label: AppConstants.leavesThisMonthLabel,
      value: '2 days',
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
    final dividerColor = context.grey50;
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.monthlySnapshotTitle),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: List.generate((_stats.length / 2).ceil(), (row) {
              final left = _stats[row * 2];
              final right = row * 2 + 1 < _stats.length ? _stats[row * 2 + 1] : null;
              return Column(
                children: [
                  if (row > 0)
                    Divider(height: 1, thickness: 1, color: dividerColor),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: _StatItem(stat: left)),
                        if (right != null) ...[
                          VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: dividerColor,
                          ),
                          Expanded(child: _StatItem(stat: right)),
                        ],
                      ],
                    ),
                  ),
                ],
              );
            }),
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

class _StatItem extends StatelessWidget {
  final _StatMeta stat;

  const _StatItem({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: stat.color.withValues(alpha: 0.10),
              borderRadius: .circular(9),
            ),
            child: Icon(stat.icon, color: stat.color, size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  stat.value,
                  style: context.labelMedium.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                    fontSize: 13,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  stat.label,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 9.5,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
      routeName: RouteNames.alert_panel,
    ),
    _MenuMeta(
      label: AppConstants.attendanceLabel,
      subtitle: AppConstants.attendanceSubtitle,
      icon: Iconsax.calendar_tick,
      color: AppColors.green,
      routeName: RouteNames.attendance,
    ),
    _MenuMeta(
      label: AppConstants.leaveRequestLabel,
      subtitle: AppConstants.leaveRequestSubtitle,
      icon: Iconsax.calendar_remove,
      color: AppColors.errorBright,
      routeName: RouteNames.leaves,
    ),
    _MenuMeta(
      label: AppConstants.loanAdvanceLabel,
      subtitle: AppConstants.loanAdvanceSubtitle,
      icon: Iconsax.money_send,
      color: AppColors.purple,
      routeName: RouteNames.loan_and_advance,
    ),
    _MenuMeta(
      label: AppConstants.overtimeLabel,
      subtitle: AppConstants.overtimeSubtitle,
      icon: Iconsax.timer_1,
      color: AppColors.cyan,
      routeName: RouteNames.overtime,
    ),
    _MenuMeta(
      label: AppConstants.salaryLabel,
      subtitle: AppConstants.salarySubtitle,
      icon: Iconsax.wallet_money,
      color: AppColors.primary,
      routeName: RouteNames.salary_mgmt,
    ),
    _MenuMeta(
      label: AppConstants.acStatementsLabel,
      subtitle: AppConstants.acStatementsSubtitle,
      icon: Iconsax.document_text,
      color: AppColors.blueGrey,
      routeName: RouteNames.employee_account_ledger,
      permissionKey: SystemPermissionKeys.accountLedger,
    ),
    _MenuMeta(
      label: AppConstants.profileLabel,
      subtitle: AppConstants.profileSubtitle,
      icon: Iconsax.profile_circle,
      color: AppColors.tealDark,
      routeName: RouteNames.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 88,
      tablet: 96,
      ipad: 104,
    );

    final visibleItems = _items
        .where((i) => i.permissionKey == null || featureAccess.has(i.permissionKey!))
        .toList();

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.myWorkspaceTitle),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          padding: .zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.gridColumnCount,
            mainAxisExtent: cardHeight,
            mainAxisSpacing: context.gridSpacing,
            crossAxisSpacing: context.gridSpacing,
          ),
          itemBuilder: (context, i) => _WorkspaceCard(item: visibleItems[i]),
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
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: .hardEdge,
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.12),
                  borderRadius: .circular(9),
                ),
                child: Icon(item.icon, color: item.color, size: 15),
              ),
              const Spacer(),
              Text(
                item.label,
                style: context.labelMedium.copyWith(
                  fontWeight: .w700,
                  color: context.textPrimary,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
              const SizedBox(height: 1),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.subtitle,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 9.5,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                  Icon(
                    Iconsax.arrow_right_3,
                    size: 11,
                    color: item.color,
                  ),
                ],
              ),
            ],
          ),
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
  final String? permissionKey;

  const _MenuMeta({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.routeName,
    this.permissionKey,
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
        borderRadius: BorderRadius.circular(8),
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
            Container(width: 3, color: notice.color),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: notice.color.withValues(alpha: 0.12),
                        borderRadius: .circular(8),
                      ),
                      child: Icon(
                        Iconsax.notification_1,
                        color: notice.color,
                        size: 13,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            notice.title,
                            style: context.labelMedium.copyWith(
                              fontWeight: .w700,
                              color: context.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            notice.snippet,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 9.5,
                              height: 1.3,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      notice.date,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 9.5,
                        fontWeight: .w600,
                      ),
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
