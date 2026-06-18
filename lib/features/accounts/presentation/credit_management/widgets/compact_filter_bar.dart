import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';

class CompactFilterBar extends StatelessWidget {
  final String partyName;
  final DateTime date;
  final VoidCallback onExpand;

  const CompactFilterBar({
    super.key,
    required this.partyName,
    required this.date,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final hasParty = partyName.isNotEmpty;
    return GestureDetector(
      onTap: onExpand,
      child: Container(
        decoration: BoxDecoration(color: context.grey100),
        padding: .fromLTRB(
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
                hasParty ? partyName : AppConstants.selectParty,
                style: context.bodySmall.copyWith(
                  color: hasParty ? context.textPrimary : context.textSecondary,
                  fontWeight: .w500,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date.format(AppConstants.ddMMMYyyyLabel),
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
