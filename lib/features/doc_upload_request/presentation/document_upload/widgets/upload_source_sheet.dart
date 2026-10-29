import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';

enum UploadSource { camera, files }

Future<UploadSource?> showUploadSourceSheet(BuildContext context) {
  return showModalBottomSheet<UploadSource>(
    context: context,
    backgroundColor: context.surfaceElevated,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => const _UploadSourceSheet(),
  );
}

class _UploadSourceSheet extends StatelessWidget {
  const _UploadSourceSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.textDisabled,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Upload document',
              style: context.titleMedium.copyWith(
                color: context.textPrimary,
                fontWeight: .w600,
              ),
            ),
            const SizedBox(height: 16),
            _SourceOption(
              icon: Iconsax.scan,
              iconColor: context.accentBlue,
              title: 'Scan with Camera',
              subtitle: 'Capture pages using the document scanner',
              onTap: () => Navigator.pop(context, UploadSource.camera),
            ),
            const SizedBox(height: 10),
            _SourceOption(
              icon: Iconsax.folder_open,
              iconColor: AppColors.azure,
              title: 'Choose Files',
              subtitle: 'Pick images or a PDF from your device',
              onTap: () => Navigator.pop(context, UploadSource.files),
            ),
          ],
        ),
      ),
    );
  }
}

class _SourceOption extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SourceOption({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.navyCard,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: context.bodyMedium.copyWith(
                        color: context.textPrimary,
                        fontWeight: .w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: context.textSecondary, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
