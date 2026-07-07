import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../domain/entities/scanned_document.dart';

class DocCard extends StatelessWidget {
  final ScannedDocument document;
  final bool isSelecting;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const DocCard({
    super.key,
    required this.document,
    required this.onTap,
    required this.onLongPress,
    this.isSelecting = false,
    this.isSelected = false,
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
      onLongPress: onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? context.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: .hardEdge,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    File(document.imagePaths.first),
                    fit: .cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: context.grey50,
                      child: Center(
                        child: Icon(
                          Icons.description_outlined,
                          color: context.grey300,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                  // Dim overlay when selected
                  if (isSelected)
                    const ColoredBox(color: Color(0x221E88E5)),
                  // Page count badge
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: context.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        document.imagePaths.length == 1
                            ? '1 page'
                            : '${document.imagePaths.length} pages',
                        style: context.labelSmall.copyWith(
                          color: context.white,
                          fontWeight: .w600,
                        ),
                      ),
                    ),
                  ),
                  // Selection checkbox
                  if (isSelecting)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: isSelected
                            ? _CheckCircle(
                                key: const ValueKey(true),
                                checked: true,
                                color: context.primary,
                              )
                            : _CheckCircle(
                                key: const ValueKey(false),
                                checked: false,
                                color: context.primary,
                              ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      document.name,
                      style: context.bodySmall.copyWith(
                        color: context.black,
                        fontWeight: .w600,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 11,
                          color: context.grey400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(document.createdAt),
                          style: context.labelSmall.copyWith(
                            color: context.grey400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckCircle extends StatelessWidget {
  final bool checked;
  final Color color;

  const _CheckCircle({super.key, required this.checked, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: .circle,
        color: checked ? color : Colors.white.withValues(alpha: 0.85),
        border: Border.all(
          color: checked ? color : Colors.white,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x33000000), blurRadius: 4),
        ],
      ),
      child: checked
          ? const Icon(Icons.check, color: Colors.white, size: 14)
          : null,
    );
  }
}
