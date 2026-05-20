import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/features/dashboard/presentation/widgets/dashboard_widgets.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';

class AccountsQuickActions extends StatelessWidget {
  const AccountsQuickActions({super.key});

  static const _items = <_QAItem>[
    _QAItem(
      label: AppConstants.accountStatementsLabel,
      icon: Iconsax.document_text,
      color: Color(0xFF1B84FF),
    ),
    _QAItem(
      label: AppConstants.partyStatementsLabel,
      icon: Iconsax.people,
      color: Color(0xFF9C27B0),
    ),
    _QAItem(
      label: AppConstants.bankCashPositionLabel,
      icon: Iconsax.bank,
      color: Color(0xFF00897B),
    ),
    _QAItem(
      label: AppConstants.cashbookLabel,
      icon: Iconsax.book,
      color: Color(0xFF4CAF50),
    ),
    _QAItem(
      label: AppConstants.creditManagementLabel,
      icon: Iconsax.card,
      color: Color(0xFFE53935),
    ),
    _QAItem(
      label: AppConstants.customerReceivableLabel,
      icon: Iconsax.receive_square,
      color: Color(0xFFFF9800),
    ),
    _QAItem(
      label: AppConstants.vendorPayableLabel,
      icon: Iconsax.send_square,
      color: Color(0xFF546E7A),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 100,
      tablet: 116,
      ipad: 130,
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.quickActionsTitle),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: cardHeight,
            mainAxisSpacing: context.gridSpacing,
            crossAxisSpacing: context.gridSpacing,
          ),
          itemBuilder: (_, i) => _QACard(item: _items[i]),
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
      onTap: () {},
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
                color: Colors.white,
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
  const _QAItem({required this.label, required this.icon, required this.color});
}
