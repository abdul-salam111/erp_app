import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/features/dashboard/presentation/widgets/dashboard_widgets.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../routes/route_exports.dart';

class AccountsQuickActions extends StatefulWidget {
  const AccountsQuickActions({super.key});

  @override
  State<AccountsQuickActions> createState() => _AccountsQuickActionsState();
}

class _AccountsQuickActionsState extends State<AccountsQuickActions> {
  static const _items = <_QAItem>[
    _QAItem(
      label: AppConstants.accountStatementsLabel,
      icon: Iconsax.document_text,
      color: AppColors.primary,
      routeName: RouteNames.account_ledger,
      permissionKey: SystemPermissionKeys.accountLedger,
    ),
    _QAItem(
      label: AppConstants.partyStatementsLabel,
      icon: Iconsax.people,
      color: AppColors.purple,
      routeName: RouteNames.party_ledger,
      permissionKey: SystemPermissionKeys.partyLedger,
    ),
    _QAItem(
      label: AppConstants.bankCashPositionLabel,
      icon: Iconsax.bank,
      color: AppColors.tealDark,
      routeName: RouteNames.bank_and_cash_position,
      permissionKey: SystemPermissionKeys.bankCashPosition,
    ),
    _QAItem(
      label: AppConstants.cashbookLabel,
      icon: Iconsax.book,
      color: AppColors.green,
      routeName: RouteNames.cashbook,
      permissionKey: SystemPermissionKeys.cashBook,
    ),
    _QAItem(
      label: AppConstants.customerReceivableLabel,
      icon: Iconsax.receive_square,
      color: AppColors.orange,
      routeName: RouteNames.customer_recievables,
      permissionKey: SystemPermissionKeys.customerReceivables,
    ),
    _QAItem(
      label: AppConstants.vendorPayableLabel,
      icon: Iconsax.send_square,
      color: AppColors.blueGrey,
      routeName: RouteNames.vendor_payable,
      permissionKey: SystemPermissionKeys.vendorPayable,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 100,
      tablet: 120,
      ipad: 130,
    );
    final spacing = context.gridSpacing + 8;

    final visibleItems = _items
        .where(
          (i) => i.permissionKey == null || featureAccess.has(i.permissionKey!),
        )
        .toList();

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.quickActionsTitle),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: cardHeight,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
          ),
          itemBuilder: (context, index) => _QACard(item: visibleItems[index]),
        ),
      ],
    );
  }
}

class _QACard extends StatelessWidget {
  final _QAItem item;

  const _QACard({required this.item});

  @override
  Widget build(BuildContext context) {
    final onTap = item.routeName != null
        ? () => context.pushNamed(item.routeName!)
        : null;
    final content = _body(context);
    return context.isDark ? _glass(context, content, onTap) : _solid(context, content, onTap);
  }

  Widget _glass(BuildContext context, Widget child, VoidCallback? onTap) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: .topLeft,
                end: .bottomRight,
                colors: [
                  AppColors.glassTintDark.withValues(alpha: 0.72),
                  AppColors.glassTintDark.withValues(alpha: 0.50),
                ],
              ),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.10),
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(10),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _solid(BuildContext context, Widget child, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: .circle,
            gradient: context.isDark
                ? RadialGradient(
                    colors: [
                      item.color.withValues(alpha: 0.28),
                      item.color.withValues(alpha: 0.06),
                    ],
                  )
                : null,
            color: context.isDark ? null : context.surfaceElevated,
            boxShadow: context.isDark
                ? null
                : [
                    BoxShadow(
                      color: item.color.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Icon(item.icon, color: item.color, size: 24),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            item.label,
            style: context.labelMedium.copyWith(
              color: context.isDark ? context.textPrimary : item.color,
              fontWeight: .w600,
              fontSize: 14,
            ),
            textAlign: .center,
            maxLines: 2,
            overflow: .ellipsis,
          ),
        ),
      ],
    );
  }
}

class _QAItem {
  final String label;
  final IconData icon;
  final Color color;
  final String? routeName;
  final String? permissionKey;

  const _QAItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.routeName,
    this.permissionKey,
  });
}
