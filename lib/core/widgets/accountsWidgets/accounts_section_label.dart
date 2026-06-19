import 'package:flutter/material.dart';
import '../../theme/theme_exports.dart';

class AccountsSectionLabel extends StatelessWidget {
  final String text;
  const AccountsSectionLabel({super.key, required this.text});

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
