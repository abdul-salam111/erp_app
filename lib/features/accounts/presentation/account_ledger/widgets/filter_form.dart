import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class LedgerFilterForm extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final List<String> accountItems;
  final List<String>? accountSubtitles;
  final bool isLoadingAccounts;
  final TextEditingController accountController;
  final ValueChanged<String> onAccountChanged;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onView;

  const LedgerFilterForm({
    super.key,
    required this.fromDate,
    required this.toDate,
    required this.accountItems,
    this.accountSubtitles,
    this.isLoadingAccounts = false,
    required this.accountController,
    required this.onAccountChanged,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.white,
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        12,
        context.pagePadding.right,
        12,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _FormLabel(text: AppConstants.accountBtn),
          const SizedBox(height: 6),
          if (isLoadingAccounts)
            const ShimmerBox(height: 56, radius: 10)
          else
            SearchableDropdown(
              items: accountItems,
              subtitles: accountSubtitles,
              controller: accountController,
              hintText: AppConstants.selectAccountHint,
              onChanged: onAccountChanged,
              fieldHeight: 40,
            ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: AppConstants.fromDateBtn),
                    const SizedBox(height: 6),
                    _FieldTile(
                      icon: Iconsax.calendar_1,
                      label: fromDate.format(AppConstants.ddMMMYyyyLabel),
                      onTap: onPickFrom,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: AppConstants.toDateBtn),
                    const SizedBox(height: 6),
                    _FieldTile(
                      icon: Iconsax.calendar_1,
                      label: toDate.format(AppConstants.ddMMMYyyyLabel),
                      onTap: onPickTo,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          CustomButton(
            text: AppConstants.view,
            onPressed: onView,
            radius: 6,
            elevation: 0,
            fontsize: 14,
            size: const Size.fromHeight(40),
          ),
        ],
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w500,
        fontSize: 12,
      ),
    );
  }
}

class _FieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _FieldTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: .circular(6),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: context.textSecondary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: context.bodySmall.copyWith(
                  color: onTap != null
                      ? context.textPrimary
                      : context.textSecondary,
                  fontSize: 13,
                ),
                overflow: .ellipsis,
              ),
            ),
            if (onTap != null)
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
