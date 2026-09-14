import 'package:flutter/material.dart';
import '../../theme/theme_exports.dart';

// ─── Search bar — used in place of an account/party selector to filter an
// already-loaded list client-side, via AccountsFilterFormCompact.selectorOverride.

class AccountsSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AccountsSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: context.grey50,
        borderRadius: .circular(6),
        border: Border.all(color: context.border),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(Icons.search_rounded, size: 18, color: context.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              style: context.bodySmall.copyWith(color: context.textPrimary),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: context.bodySmall.copyWith(
                  color: context.textSecondary,
                ),
                contentPadding: const EdgeInsets.only(bottom: 2),
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
