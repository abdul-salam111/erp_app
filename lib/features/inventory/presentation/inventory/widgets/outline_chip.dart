import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_utils.dart';

class InventoryOutlineChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const InventoryOutlineChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: context.border),
        ),
        child: Text(
          label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontWeight: .w500,
          ),
        ),
      ),
    );
  }
}
