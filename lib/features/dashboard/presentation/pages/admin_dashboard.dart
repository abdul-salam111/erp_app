import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../widgets/dashboard_widgets.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

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
        userRole: AppConstants.administrator,
        items: [
          DrawerItem.tile(
            label: AppConstants.dashboardLabel,
            icon: Iconsax.home_2,
            color: Color(0xFF1B84FF),
            routeName: RouteNames.alert_panel,
          ),
          DrawerItem.tile(
            label: AppConstants.alertsTitle,
            icon: Iconsax.notification,
            color: Color(0xFFE53935),
            routeName: RouteNames.alert_panel,
          ),
          DrawerItem.tile(
            label: AppConstants.profileLabel,
            icon: Iconsax.profile_circle,
            color: Color(0xFF00897B),
            routeName: RouteNames.profile,
          ),
          DrawerItem.tile(
            label: AppConstants.scanDocumentLabel,
            icon: Iconsax.scan,
            color: Color(0xFF546E7A),
            routeName: RouteNames.scan_document,
          ),
          DrawerItem.divider(),
          DrawerItem.category(AppConstants.modules),
          DrawerItem.expandable(
            label: AppConstants.accountsLabel,
            icon: Iconsax.dollar_circle,
            color: Color(0xFF1B84FF),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.inventoryLabel,
            icon: Iconsax.element_3,
            color: Color(0xFF009688),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.purchaseLabel,
            icon: Iconsax.shopping_bag,
            color: Color(0xFF9C27B0),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.salesLabel,
            icon: Iconsax.truck,
            color: Color(0xFF4CAF50),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.productionLabel,
            icon: Iconsax.buildings_2,
            color: Color(0xFFFF9800),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.analyticsLabel,
            icon: Iconsax.chart_2,
            color: Color(0xFF7B1FA2),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.securityLabel,
            icon: Iconsax.security_user,
            color: Color(0xFF546E7A),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.systemLabel,
            icon: Iconsax.setting_2,
            color: Color(0xFF6D4C41),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
          DrawerItem.expandable(
            label: AppConstants.assetsLabel,
            icon: Iconsax.convert_3d_cube,
            color: Color(0xFF00897B),
            children: [
              DrawerItem.tile(label: AppConstants.menu1Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu2Label, icon: Iconsax.document),
              DrawerItem.tile(label: AppConstants.menu3Label, icon: Iconsax.document),
            ],
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          // ── Merged greeting + app-bar header ──
          const DashboardHeader(
            userName: AppConstants.admin,
            userRole: AppConstants.administrator,
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
                  const SizedBox(height: 20),
                  const MonthOverviewSection(),
                  const SizedBox(height: 20),
                  const SaleOrdersSection(),
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
