import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../domain/entities/scanned_document.dart';

class DocCard extends StatelessWidget {
  final ScannedDocument document;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const DocCard({
    super.key,
    required this.document,
    required this.onTap,
    required this.onDelete,
  });

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onDelete,
      child: Container(
        decoration: BoxDecoration(
          color: context.grey900,
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: .hardEdge,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Image.file(
                File(document.imagePaths.first),
                fit: .cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => Center(
                  child: Icon(
                    Icons.description,
                    color: context.textDisabled,
                    size: 48,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    document.name,
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w500,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        document.imagePaths.length == 1
                            ? '1 page'
                            : '${document.imagePaths.length} pages',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                      Text(
                        _formatDate(document.createdAt),
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
