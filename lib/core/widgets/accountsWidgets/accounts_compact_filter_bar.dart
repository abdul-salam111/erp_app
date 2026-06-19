import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../../constants/const_exports.dart';

class AccountsCompactFilterBar extends StatelessWidget {
  final String label;
  final String placeholder;
  final DateTime fromDate;
  final DateTime toDate;
  final VoidCallback onExpand;

  const AccountsCompactFilterBar({
    super.key,
    required this.label,
    required this.placeholder,
    required this.fromDate,
    required this.toDate,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final hasLabel = label.isNotEmpty;
    return GestureDetector(
      onTap: onExpand,
      child: Container(
        decoration: BoxDecoration(color: context.grey100),
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          10,
          context.pagePadding.right,
          10,
        ),
        child: Row(
          children: [
            Icon(Iconsax.setting_4, size: 15, color: context.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                hasLabel ? label : placeholder,
                style: context.bodySmall.copyWith(
                  color: hasLabel ? context.textPrimary : context.textSecondary,
                  fontWeight: .w500,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${fromDate.format(AppConstants.ddMMMYyyyLabel)} – ${toDate.format(AppConstants.ddMMMYyyyLabel)}',
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 11,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: context.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
