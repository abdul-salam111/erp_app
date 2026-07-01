import 'package:flutter/material.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';

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
    return ColoredBox(
      color: context.white,
      child: ListView(
        controller: scrollController,
        padding: EdgeInsets.only(
          left: context.pagePadding.left,
          right: context.pagePadding.right,
          top: 12,
          bottom: 16,
        ),
        children: [
          for (final card in yearCards) ...[
            card,
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
