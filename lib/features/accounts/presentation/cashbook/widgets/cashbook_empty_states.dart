import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';

class CashbookIdleState extends StatelessWidget {
  const CashbookIdleState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Iconsax.document_text, size: 48, color: AppColors.grey300),
          const SizedBox(height: 12),
          Text(
            AppConstants.noStatementsYet,
            style: context.bodyMedium.copyWith(
              fontWeight: .w500,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            AppConstants.selectAnAccountAndTap,
            style: context.bodySmall.copyWith(color: AppColors.grey400),
          ),
        ],
      ),
    );
  }
}

class CashbookEmptyState extends StatelessWidget {
  const CashbookEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: AppColors.grey300),
          const SizedBox(height: 12),
          Text(
            AppConstants.noRecordsFound,
            style: context.bodyMedium.copyWith(
              fontWeight: .w500,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            AppConstants.trySelectingADifferentDate,
            style: context.bodySmall.copyWith(color: AppColors.grey400),
          ),
        ],
      ),
    );
  }
}

class CashbookErrorBody extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const CashbookErrorBody({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.error_outline_rounded, size: 48, color: AppColors.grey300),
          const SizedBox(height: 12),
          Text(
            message,
            style: context.bodySmall.copyWith(color: context.textSecondary),
            textAlign: .center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: .circular(10)),
              elevation: 0,
            ),
            child: const Text(AppConstants.retry),
          ),
        ],
      ),
    );
  }
}
