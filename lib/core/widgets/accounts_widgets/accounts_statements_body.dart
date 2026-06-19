import 'package:flutter/material.dart';
import '../../constants/const_exports.dart';
import '../../utils/utils_exports.dart';
import 'accounts_section_label.dart';

class AccountsStatementsBody extends StatelessWidget {
  final List<Widget> yearCards;
  final ScrollController? scrollController;

  const AccountsStatementsBody({
    super.key,
    required this.yearCards,
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
        const AccountsSectionLabel(text: AppConstants.statementsBtn),
        const SizedBox(height: 8),
        for (final card in yearCards) ...[
          card,
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
