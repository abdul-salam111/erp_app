import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../routes/route_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

// ─── Drawer item model ────────────────────────────────────────────────────────

enum _DrawerItemType { tile, category, divider }

class DrawerItem {
  final _DrawerItemType _type;
  final String?   label;
  final IconData? icon;
  final String?   routeName;
  final Color?    color;

  const DrawerItem.tile({
    required this.label,
    required this.icon,
    this.routeName,
    this.color,
  }) : _type = _DrawerItemType.tile;

  const DrawerItem.category(this.label)
      : _type    = _DrawerItemType.category,
        icon      = null,
        routeName = null,
        color     = null;

  const DrawerItem.divider()
      : _type    = _DrawerItemType.divider,
        label     = null,
        icon      = null,
        routeName = null,
        color     = null;
}

// ─── App Drawer ───────────────────────────────────────────────────────────────

class AppDrawer extends StatelessWidget {
  final String          userName;
  final String          userRole;
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
      elevation: 0,
      child: Column(
        children: [
          // ── Header ──
          _DrawerHeader(userName: userName, userRole: userRole),

          // ── Nav items ──
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10, bottom: 8),
              children: items.map((item) => _buildItem(context, item)).toList(),
            ),
          ),

          // ── Logout ──
          _LogoutButton(
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
        return _DrawerTile(item: item);
      case _DrawerItemType.category:
        return _CategoryLabel(label: item.label!);
      case _DrawerItemType.divider:
        return const _ItemDivider();
    }
  }
}

// ─── Drawer tile ──────────────────────────────────────────────────────────────

class _DrawerTile extends StatelessWidget {
  final DrawerItem item;

  const _DrawerTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final color     = item.color ?? context.primary;
    final hasRoute  = item.routeName != null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          if (hasRoute) context.pushNamed(item.routeName!);
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: Row(
              children: [
                // Colored icon container
                Container(
                  width:  38,
                  height: 38,
                  decoration: BoxDecoration(
                    color:        color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item.icon, color: color, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label!,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w500,
                      color:      context.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.grey300,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Category label ───────────────────────────────────────────────────────────

class _CategoryLabel extends StatelessWidget {
  final String label;

  const _CategoryLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 16, top: 16, bottom: 6),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style: context.labelSmall.copyWith(
              color:         context.textSecondary,
              fontWeight:    .w700,
              letterSpacing: 1.0,
              fontSize:      10,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Divider(
              height:    1,
              thickness: 1,
              color:     context.border,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Divider ──────────────────────────────────────────────────────────────────

class _ItemDivider extends StatelessWidget {
  const _ItemDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent:    22,
      endIndent: 22,
      height:    20,
      thickness: 1,
      color:     context.border,
    );
  }
}

// ─── Logout button ────────────────────────────────────────────────────────────

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            color:        context.error.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(12),
            border:       Border.all(color: context.error.withValues(alpha: 0.18)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  width:  38,
                  height: 38,
                  decoration: BoxDecoration(
                    color:        context.error.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Iconsax.logout, color: context.error, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppConstants.logout,
                    style: context.bodySmall.copyWith(
                      color:      context.error,
                      fontWeight: .w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.error.withValues(alpha: 0.45),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Drawer header ────────────────────────────────────────────────────────────

class _DrawerHeader extends StatelessWidget {
  final String userName;
  final String userRole;

  const _DrawerHeader({required this.userName, required this.userRole});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Container(
      width:         double.infinity,
      clipBehavior:  .hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primary, context.primary.withValues(alpha: 0.72)],
          begin: .topLeft,
          end:   .bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -28,
            top:   top - 20,
            child: _Circle(size: 110, opacity: 0.08),
          ),
          Positioned(
            right: 50,
            top:   top + 30,
            child: _Circle(size: 55, opacity: 0.05),
          ),
          Positioned(
            left:   -20,
            bottom: -20,
            child: _Circle(size: 80, opacity: 0.06),
          ),

          // Content
          Padding(
            padding: EdgeInsets.only(
              top:    top + 22,
              bottom: 22,
              left:   20,
              right:  20,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // Avatar with ring
                Container(
                  width:  62,
                  height: 62,
                  decoration: BoxDecoration(
                    shape: .circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.45),
                      width: 2.5,
                    ),
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                  child: const Icon(
                    Iconsax.profile_circle,
                    color: Colors.white,
                    size:  30,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  userName,
                  style: context.titleSmall.copyWith(
                    color:      Colors.white,
                    fontWeight: .w700,
                  ),
                ),
                const SizedBox(height: 6),
                // Role badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color:        Colors.white.withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Icon(
                        Iconsax.shield_tick,
                        color: Colors.white.withValues(alpha: 0.90),
                        size:  11,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        userRole,
                        style: context.labelSmall.copyWith(
                          color:      Colors.white.withValues(alpha: 0.92),
                          fontWeight: .w600,
                          fontSize:   11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Decorative circle ────────────────────────────────────────────────────────

class _Circle extends StatelessWidget {
  final double size;
  final double opacity;

  const _Circle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  size,
      height: size,
      decoration: BoxDecoration(
        shape: .circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}
