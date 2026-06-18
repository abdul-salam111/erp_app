import 'package:flutter/material.dart';

import '../services/current_user.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final orgName = currentUser.org.name;

    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.white),
      title: Column(
        mainAxisSize: .min,
        children: [
          Text(
            title,
            style: context.bodyLarge.copyWith(
              color: context.white,
              fontWeight: .bold,
            ),
          ),
          if (orgName.isNotEmpty)
            Text(
              orgName,
              style: context.labelSmall.copyWith(
                color: context.white.withValues(alpha: 0.72),
                fontSize: 11,
                fontWeight: .w400,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
        ],
      ),
      centerTitle: true,
      backgroundColor: context.primary,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
