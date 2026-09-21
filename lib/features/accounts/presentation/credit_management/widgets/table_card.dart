import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class TableCard extends StatelessWidget {
  final String title;
  final Widget? titleTrailing;
  final Row header;
  final List<Widget> rows;
  final String emptyMessage;

  const TableCard({
    super.key,
    required this.title,
    this.titleTrailing,
    required this.header,
    required this.rows,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    final content =
        rows.isEmpty ? [TableEmptyRow(message: emptyMessage)] : rows;

    return GlassSurface(
      radius: 10,
      clipBehavior: .hardEdge,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w700,
                      fontSize: 13,
                      color: context.textPrimary,
                    ),
                  ),
                ),
                if (titleTrailing != null) titleTrailing!,
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.primary.withValues(
                alpha: context.isDark ? 0.14 : 0.07,
              ),
              border: Border(
                bottom: BorderSide(
                  color: context.primary.withValues(alpha: 0.22),
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: header,
          ),
          for (int i = 0; i < content.length; i++) ...[
            content[i],
            if (i < content.length - 1)
              Divider(height: 1, thickness: 1, color: context.divider),
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
    this.align = .start,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text.toUpperCase(),
        style: context.labelSmall.copyWith(
          color: context.accentBlue,
          fontWeight: .w700,
          fontSize: 10.5,
          letterSpacing: 0.7,
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
