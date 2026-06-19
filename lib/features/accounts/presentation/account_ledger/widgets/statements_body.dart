import 'package:flutter/material.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../accounts_exports.dart';
import 'year_card.dart';

class LedgerStatementsBody extends StatelessWidget {
  final List<LedgerStatementEntity> statements;
  final ScrollController? scrollController;
  const LedgerStatementsBody({
    super.key,
    required this.statements,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.only(
        left: context.pagePadding.left,
        right: context.pagePadding.right,
        top: 12,
        bottom: 16,
      ),
      children: [
        const _SectionLabel(text: AppConstants.statementsBtn),
        const SizedBox(height: 8),
        for (final yearData in statements) ...[
          LedgerYearCard(yearData: yearData, scrollController: scrollController),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: context.labelSmall.copyWith(
        fontSize: 11,
        fontWeight: .w500,
        color: context.textSecondary,
        letterSpacing: 0.8,
      ),
    );
  }
}
