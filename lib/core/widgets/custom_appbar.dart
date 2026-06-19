import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/current_user.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';
import '../../routes/route_names.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  static String _orgInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    return parts
        .where((p) => p.isNotEmpty)
        .map((p) => p[0].toUpperCase())
        .join();
  }

  @override
  Widget build(BuildContext context) {
    final orgName = currentUser.org.name;
    final initials = orgName.isNotEmpty ? _orgInitials(orgName) : '';

    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.white),
      title: Text(
        title,
        style: context.bodyLarge.copyWith(
          color: context.white,
          fontWeight: .bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: context.primary,
      actions: [
        if (initials.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => context.pushNamed(RouteNames.organizationSelection),
              child: _OrgInitialsChip(initials: initials),
            ),
          ),
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _OrgInitialsChip extends StatelessWidget {
  final String initials;

  const _OrgInitialsChip({required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.45),
          width: 1,
        ),
      ),
      child: Text(
        initials.characters.map((l) => l).join(),
        style: context.labelSmall.copyWith(
          color: AppColors.white,
          fontWeight: .bold,
          fontSize: 11,
        letterSpacing: 1.2,
        ),
      ),
    );
  }
}
