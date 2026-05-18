import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../routes/route_exports.dart';

// ─── Drawer item model ────────────────────────────────────────────────────────

enum _DrawerItemType { tile, category, divider }

class DrawerItem {
  final _DrawerItemType _type;
  final String? label;
  final IconData? icon;
  final String? routeName;

  const DrawerItem.tile({
    required this.label,
    required this.icon,
    this.routeName,
  }) : _type = _DrawerItemType.tile;

  const DrawerItem.category(this.label)
      : _type = _DrawerItemType.category,
        icon = null,
        routeName = null;

  const DrawerItem.divider()
      : _type = _DrawerItemType.divider,
        label = null,
        icon = null,
        routeName = null;
}

// ─── App Drawer ───────────────────────────────────────────────────────────────

class AppDrawer extends StatelessWidget {
  final String userName;
  final String userRole;
  final List<DrawerItem> items;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.userRole,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.white,
      child: Column(
        children: [
          // ── Header ──
          _DrawerHeader(userName: userName, userRole: userRole),

          // ── Nav items ──
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: items.map((item) => _buildItem(context, item)).toList(),
            ),
          ),

          // ── Logout ──
          Divider(height: 1, color: context.border),
          ListTile(
            leading: Icon(Iconsax.logout, color: context.error, size: 20),
            title: Text(
              'Logout',
              style: context.bodySmall.copyWith(
                color: context.error,
                fontWeight: .w600,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.goNamed(RouteNames.signin);
            },
          ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom + 8),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, DrawerItem item) {
    switch (item._type) {
      case _DrawerItemType.tile:
        return ListTile(
          leading: Icon(item.icon, color: context.primary, size: 20),
          title: Text(
            item.label!,
            style: context.bodySmall.copyWith(
              fontWeight: .w500,
              color: context.textPrimary,
            ),
          ),
          dense: true,
          horizontalTitleGap: 8,
          onTap: () {
            Navigator.pop(context);
            if (item.routeName != null) context.pushNamed(item.routeName!);
          },
        );
      case _DrawerItemType.category:
        return Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
          child: Text(
            item.label!.toUpperCase(),
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontWeight: .w700,
              letterSpacing: 0.8,
              fontSize: 10,
            ),
          ),
        );
      case _DrawerItemType.divider:
        return Divider(indent: 16, endIndent: 16, color: context.border);
    }
  }
}

// ─── Drawer Header ────────────────────────────────────────────────────────────

class _DrawerHeader extends StatelessWidget {
  final String userName;
  final String userRole;

  const _DrawerHeader({required this.userName, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 20,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primary, context.primary.withValues(alpha: 0.75)],
          begin: .centerLeft,
          end: .centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: const Icon(Iconsax.profile_circle, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            userName,
            style: context.titleSmall.copyWith(
              color: Colors.white,
              fontWeight: .w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            userRole,
            style: context.labelSmall.copyWith(
              color: Colors.white.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}
