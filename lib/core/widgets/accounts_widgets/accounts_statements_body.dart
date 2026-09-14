import 'package:flutter/material.dart';
import '../../theme/theme_exports.dart';


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
          left: 8,
          right: 8,
          top: 6,
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
