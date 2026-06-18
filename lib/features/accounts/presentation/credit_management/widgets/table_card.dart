import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class TableCard extends StatelessWidget {
  final String title;
  final Row header;
  final List<Widget> rows;
  final String emptyMessage;

  const TableCard({
    super.key,
    required this.title,
    required this.header,
    required this.rows,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    final content =
        rows.isEmpty ? [TableEmptyRow(message: emptyMessage)] : rows;

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: .all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Text(
              title,
              style: context.bodySmall.copyWith(
                fontWeight: .w700,
                fontSize: 13,
                color: context.textPrimary,
              ),
            ),
          ),
          Container(
            color: context.primary.withValues(alpha: 0.07),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: header,
          ),
          for (int i = 0; i < content.length; i++) ...[
            content[i],
            if (i < content.length - 1)
              Divider(height: 1, thickness: 1, color: AppColors.grey100),
          ],
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class TableHeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  final TextAlign align;
  const TableHeaderCell(
    this.text, {
    super.key,
    this.flex = 1,
    this.align = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: context.labelSmall.copyWith(
          color: context.primary,
          fontWeight: .w600,
          fontSize: 11,
        ),
        textAlign: align,
        maxLines: 1,
        overflow: .ellipsis,
      ),
    );
  }
}

class TableEmptyRow extends StatelessWidget {
  final String message;
  const TableEmptyRow({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          message,
          style: context.bodySmall.copyWith(
            color: context.textSecondary,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
