import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../widgets/dashboard_widgets.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      drawer: const AppDrawer(
        userName: AppConstants.admin,
        userRole: 'Administrator',
        items: [
          DrawerItem.tile(label: 'Dashboard', icon: Iconsax.home_2),
          DrawerItem.tile(
            label: 'Alerts',
            icon: Iconsax.notification,
            routeName: RouteNames.alert_panel,
          ),
          DrawerItem.tile(
            label: 'Profile',
            icon: Iconsax.profile_circle,
            routeName: RouteNames.profile,
          ),
          DrawerItem.tile(
            label: 'Scan Document',
            icon: Iconsax.scan,
            routeName: RouteNames.scan_document,
          ),
          DrawerItem.divider(),
          DrawerItem.category('Modules'),
          DrawerItem.tile(label: 'Accounts',   icon: Iconsax.dollar_circle),
          DrawerItem.tile(label: 'Inventory',  icon: Iconsax.element_3),
          DrawerItem.tile(label: 'Purchase',   icon: Iconsax.shopping_bag,  routeName: RouteNames.purchase_order),
          DrawerItem.tile(label: 'Sales',      icon: Iconsax.truck,         routeName: RouteNames.sale_order),
          DrawerItem.tile(label: 'Production', icon: Iconsax.buildings_2),
          DrawerItem.tile(label: 'Analytics',  icon: Iconsax.chart_2),
          DrawerItem.tile(label: 'Security',   icon: Iconsax.security_user),
          DrawerItem.tile(label: 'System',     icon: Iconsax.setting_2),
          DrawerItem.tile(label: 'Assets',     icon: Iconsax.convert_3d_cube),
        ],
      ),

      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          // ── Merged greeting + app-bar header ──
          const DashboardHeader(
            userName: AppConstants.admin,
            userRole: 'Administrator',
          ),
          // ── Scrollable content ──
          Expanded(
            child: SingleChildScrollView(
              padding: context.pagePadding.copyWith(top: 20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  const TodayOverviewSection(),
                  const SizedBox(height: 20),
                  const QuickActionsSection(),
                  const SizedBox(height: 20),
                  const NewOrdersSection(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
