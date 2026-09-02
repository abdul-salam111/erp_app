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

class _AccountsQuickActionsState extends State<AccountsQuickActions>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 100,
      tablet: 116,
      ipad: 130,
    );

    final visibleItems = _items
        .where((i) => i.permissionKey == null || featureAccess.has(i.permissionKey!))
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
            crossAxisCount: context.gridColumnCount,
            mainAxisExtent: cardHeight,
            mainAxisSpacing: context.gridSpacing,
            crossAxisSpacing: context.gridSpacing,
          ),
          itemBuilder: (_, i) {
            final start = (i * 0.1).clamp(0.0, 0.55);
            final end   = (start + 0.5).clamp(0.0, 1.0);
            final curve = CurvedAnimation(
              parent: _controller,
              curve:  Interval(start, end, curve: Curves.easeOut),
            );
            return FadeTransition(
              opacity: curve,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.22, 0),
                  end:   Offset.zero,
                ).animate(curve),
                child: _QACard(item: visibleItems[i]),
              ),
            );
          },
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
    return InkWell(
      onTap: () {
        if (item.routeName != null) context.pushNamed(item.routeName!);
      },
      borderRadius: .circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: 0.10),
          borderRadius: .circular(10),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: .circle,
                boxShadow: [
                  BoxShadow(
                    color: item.color.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(item.icon, color: item.color, size: 18),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: .symmetric(horizontal: 4),
              child: Text(
                item.label,
                style: context.labelSmall.copyWith(
                  color: item.color,
                  fontWeight: .w600,
                  fontSize: 10,
                ),
                textAlign: .center,
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ),
          ],
        ),
      ),
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
    this.routeName,
    this.permissionKey,
  });
}
