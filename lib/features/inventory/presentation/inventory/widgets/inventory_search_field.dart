import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';

class InventorySearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const InventorySearchField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: context.isDark ? AppColors.navyCardDark : context.grey50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.isDark ? context.navyBorder : context.border,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(Icons.search_rounded, size: 18, color: context.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              style: context.bodyMedium.copyWith(color: context.textPrimary),
              decoration: InputDecoration(
                isDense: true,
                filled: false,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: context.bodyMedium.copyWith(
                  color: context.textSecondary,
                ),
              ),
            ),
          ),
          if (controller.text.isNotEmpty)
            GestureDetector(
              onTap: controller.clear,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: context.textSecondary,
                ),
              ),
            )
          else
            const SizedBox(width: 10),
        ],
      ),
    );
  }
}
