import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../services/current_user.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';
import '../../routes/route_names.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

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
    final canPop = Navigator.of(context).canPop();
    final resolvedLeading =
        leading ?? (canPop ? const GlassBackButton() : null);

    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.white),
      leading: resolvedLeading,
      leadingWidth: resolvedLeading is GlassBackButton ? 46 : null,
      automaticallyImplyLeading: leading == null,
      title: Text(
        title,
        style: context.bodyLarge.copyWith(
          color: context.white,
          fontWeight: .bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: context.isDark ? AppColors.navyHeaderDark : context.primary,
      actions: [
        if (currentUser.isAdmin && initials.isNotEmpty)
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

class GlassBackButton extends StatelessWidget {
  const GlassBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    void handleTap() => Navigator.of(context).maybePop();

    if (context.isDark) {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Center(
          child: GlassIconButton(
            onPressed: handleTap,
            size: 30,
            iconSize: 14,
            shape: GlassIconButtonShape.roundedSquare,
            borderRadius: 8,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 14,
              color: AppColors.white,
            ),
          ),
        ),
      );
    }

    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.white,
        size: 20,
      ),
      onPressed: handleTap,
    );
  }
}

class _OrgInitialsChip extends StatelessWidget {
  final String initials;

  const _OrgInitialsChip({required this.initials});

  @override
  Widget build(BuildContext context) {
    final label = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

    if (context.isDark) {
      return GlassContainer(
        shape: const LiquidRoundedSuperellipse(borderRadius: 20),
        child: label,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.45),
          width: 1,
        ),
      ),
      child: label,
    );
  }
}
