import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../widgets/dashboard_widgets.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

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
            routeName: RouteNames.alert_panel,
          ),
          DrawerItem.tile(
            label: AppConstants.alertsTitle,
            icon: Iconsax.notification,
            color: AppColors.errorBright,
            routeName: RouteNames.alert_panel,
          ),
          DrawerItem.tile(
            label: AppConstants.profileLabel,
            icon: Iconsax.profile_circle,
            color: AppColors.tealDark,
            routeName: RouteNames.profile,
          ),
          DrawerItem.tile(
            label: AppConstants.scanDocumentLabel,
            icon: Iconsax.scan,
            color: AppColors.blueGrey,
            routeName: RouteNames.scan_document,
          ),
          DrawerItem.tile(
            label: AppConstants.partahLabel,
            icon: Iconsax.document,
            color: AppColors.deepPurple,
            routeName: RouteNames.partah_home,
          ),
          DrawerItem.divider(),
          DrawerItem.category(AppConstants.modules),
          DrawerItem.expandable(
            label: AppConstants.accountsLabel,
            icon: Iconsax.dollar_circle,
            color: AppColors.primary,
            children: [
              DrawerItem.tile(
                label: AppConstants.accountStatementsLabel,
                icon: Iconsax.document_text,
                color: AppColors.primary,
                routeName: RouteNames.account_ledger,
                permissionKey: SystemPermissionKeys.accountLedger,
              ),
              DrawerItem.tile(
                label: AppConstants.partyStatementsLabel,
                icon: Iconsax.people,
                color: AppColors.purple,
                permissionKey: SystemPermissionKeys.partyLedger,
              ),
              DrawerItem.tile(
                label: AppConstants.bankCashPositionLabel,
                icon: Iconsax.bank,
                color: AppColors.tealDark,
                permissionKey: SystemPermissionKeys.bankCashPosition,
              ),
              DrawerItem.tile(
                label: AppConstants.cashbookLabel,
                icon: Iconsax.book,
                color: AppColors.green,
                permissionKey: SystemPermissionKeys.cashBook,
              ),
              DrawerItem.tile(
                label: AppConstants.creditManagementLabel,
                icon: Iconsax.card,
                color: AppColors.errorBright,
                permissionKey: SystemPermissionKeys.creditManagement,
              ),
              DrawerItem.tile(
                label: AppConstants.customerReceivableLabel,
                icon: Iconsax.receive_square,
                color: AppColors.orange,
                permissionKey: SystemPermissionKeys.customerReceivables,
              ),
              DrawerItem.tile(
                label: AppConstants.vendorPayableLabel,
                icon: Iconsax.send_square,
                color: AppColors.blueGrey,
                permissionKey: SystemPermissionKeys.vendorPayable,
              ),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.inventoryLabel,
            icon: Iconsax.element_3,
            color: AppColors.teal,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.purchaseLabel,
            icon: Iconsax.shopping_bag,
            color: AppColors.purple,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.salesLabel,
            icon: Iconsax.truck,
            color: AppColors.green,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.productionLabel,
            icon: Iconsax.buildings_2,
            color: AppColors.orange,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.analyticsLabel,
            icon: Iconsax.chart_2,
            color: AppColors.deepPurple,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.securityLabel,
            icon: Iconsax.security_user,
            color: AppColors.blueGrey,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
          DrawerItem.tile(
            label: AppConstants.systemLabel,
            icon: Iconsax.setting_2,
            color: AppColors.brown,
            routeName: RouteNames.system,
          ),
          DrawerItem.expandable(
            label: AppConstants.assetsLabel,
            icon: Iconsax.convert_3d_cube,
            color: AppColors.tealDark,
            children: [
              DrawerItem.tile(
                label: AppConstants.menu1Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu2Label,
                icon: Iconsax.document,
              ),
              DrawerItem.tile(
                label: AppConstants.menu3Label,
                icon: Iconsax.document,
              ),
            ],
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          const _AdminSliverAppBar(),
          SliverPadding(
            padding: context.pagePadding.copyWith(top: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  if (featureAccess.has(SystemPermissionKeys.todaysOverview)) ...[
                    const TodayOverviewSection(),
                    const SizedBox(height: 20),
                  ],
                  const QuickActionsSection(),
                  const SizedBox(height: 20),
                  if (featureAccess.has(SystemPermissionKeys.todaysOverview)) ...[
                    const NewOrdersSection(),
                    const SizedBox(height: 20),
                  ],
                  if (featureAccess.has(SystemPermissionKeys.monthlyOverview)) ...[
                    const MonthOverviewSection(),
                    const SizedBox(height: 20),
                  ],
                  if (featureAccess.has(SystemPermissionKeys.dashboardSaleOrderStatus)) ...[
                    const SaleOrdersSection(),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Admin sliver header ──────────────────────────────────────────────────────

class _AdminSliverAppBar extends StatelessWidget {
  const _AdminSliverAppBar();

  static const double _expandedHeight = 161;

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

  String get _formattedDate => DateTime.now().formatted;

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
          child: _AdminHeaderIconBtn(
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
              _AdminHeaderIconBtn(
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
                        AppConstants.eRPDashboard,
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

                // ── Expanded content — identity ──
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
                              backgroundColor:
                                  AppColors.white.withValues(alpha: 0.20),
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
                                  Row(
                                    children: [
                                      _AdminHeaderChip(
                                        icon: Iconsax.buildings,
                                        label: currentUser.org.name,
                                      ),
                                      const Spacer(),
                                      _DatePill(date: _formattedDate),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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

class _AdminHeaderIconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AdminHeaderIconBtn({required this.icon, required this.onTap});

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

class _AdminHeaderChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AdminHeaderChip({required this.icon, required this.label});

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

class _DatePill extends StatelessWidget {
  final String date;

  const _DatePill({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.15),
        borderRadius: .circular(20),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(
            Iconsax.calendar,
            color: AppColors.white.withValues(alpha: 0.85),
            size: 13,
          ),
          const SizedBox(width: 5),
          Text(
            date,
            style: context.labelSmall.copyWith(
              color: AppColors.white,
              fontWeight: .w500,
            ),
          ),
        ],
      ),
    );
  }
}
