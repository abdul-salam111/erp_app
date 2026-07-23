import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../shimmer_box.dart';
import '../custom_dropdown_textfield.dart';
import '../custom_button.dart';

class AccountsFilterForm extends StatelessWidget {
  final String label;
  final String hintText;
  final DateTime fromDate;
  final DateTime toDate;
  final List<String> items;
  final List<String>? subtitles;
  final bool isLoading;
  final TextEditingController controller;
  final ValueChanged<String> onItemChanged;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onView;
  final bool showAccountSelector;

  const AccountsFilterForm({
    super.key,
    required this.label,
    required this.hintText,
    required this.fromDate,
    required this.toDate,
    required this.items,
    this.subtitles,
    this.isLoading = false,
    required this.controller,
    required this.onItemChanged,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onView,
    this.showAccountSelector = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.grey50,
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        12,
        context.pagePadding.right,
        12,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          12,
          context.pagePadding.right,
          12,
        ),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: .circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            if (showAccountSelector) ...[
              FormLabel(text: label),
              const SizedBox(height: 6),
              if (isLoading)
                const ShimmerBox(height: 56, radius: 10)
              else
                SearchableDropdown(
                  items: items,
                  subtitles: subtitles,
                  controller: controller,
                  hintText: hintText,
                  onChanged: onItemChanged,
                  fieldHeight: 40,
                ),
              const SizedBox(height: 10),
            ],
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      FormLabel(text: AppConstants.fromDateBtn),
                      const SizedBox(height: 6),
                      FieldTile(
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
                      FormLabel(text: AppConstants.toDateBtn),
                      const SizedBox(height: 6),
                      FieldTile(
                        icon: Iconsax.calendar_1,
                        label: toDate.format(AppConstants.ddMMMYyyyLabel),
                        onTap: onPickTo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: AppConstants.view,
              onPressed: onView,
              radius: 6,
              elevation: 0,
              fontsize: 14,
              size: const Size.fromHeight(40),
              backgroundColor: context.primary.withValues(alpha: 0.12),
              textColor: context.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class FormLabel extends StatelessWidget {
  final String text;
  const FormLabel({super.key, required this.text});

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

class FieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const FieldTile({super.key, 
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
