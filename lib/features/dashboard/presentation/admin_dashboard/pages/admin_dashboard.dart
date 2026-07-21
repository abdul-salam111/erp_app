import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/core/utils/utils_exports.dart';
import 'package:mantic_erp_app/routes/route_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../../core/theme/colors.dart';
import '../../widgets/dashboard_widgets.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

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
            label: AppConstants.employeeLabel,
            icon: Iconsax.user_octagon,
            color: AppColors.indigo,
            routeName: RouteNames.employee_dashboard,
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
              ),
              DrawerItem.tile(
                label: AppConstants.partyStatementsLabel,
                icon: Iconsax.people,
                color: AppColors.purple,
              ),
              DrawerItem.tile(
                label: AppConstants.bankCashPositionLabel,
                icon: Iconsax.bank,
                color: AppColors.tealDark,
              ),
              DrawerItem.tile(
                label: AppConstants.cashbookLabel,
                icon: Iconsax.book,
                color: AppColors.green,
              ),
              DrawerItem.tile(
                label: AppConstants.creditManagementLabel,
                icon: Iconsax.card,
                color: AppColors.errorBright,
              ),
              DrawerItem.tile(
                label: AppConstants.customerReceivableLabel,
                icon: Iconsax.receive_square,
                color: AppColors.orange,
              ),
              DrawerItem.tile(
                label: AppConstants.vendorPayableLabel,
                icon: Iconsax.send_square,
                color: AppColors.blueGrey,
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

      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          // ── Merged greeting + app-bar header ──
          DashboardHeader(
            userName: currentUser.fullName,
            orgName: currentUser.org.name,
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
