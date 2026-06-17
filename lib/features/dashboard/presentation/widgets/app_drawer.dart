import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../routes/route_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

// ─── Drawer item model ────────────────────────────────────────────────────────

enum _DrawerItemType { tile, expandable, category, divider }

class DrawerItem {
  final _DrawerItemType  _type;
  final String?          label;
  final IconData?        icon;
  final String?          routeName;
  final Color?           color;
  final List<DrawerItem> children;

  const DrawerItem.tile({
    required this.label,
    required this.icon,
    this.routeName,
    this.color,
  })  : _type    = _DrawerItemType.tile,
        children = const [];

  const DrawerItem.expandable({
    required this.label,
    required this.icon,
    required this.children,
    this.color,
  })  : _type     = _DrawerItemType.expandable,
        routeName = null;

  const DrawerItem.category(this.label)
      : _type    = _DrawerItemType.category,
        icon      = null,
        routeName = null,
        color     = null,
        children  = const [];

  const DrawerItem.divider()
      : _type    = _DrawerItemType.divider,
        label     = null,
        icon      = null,
        routeName = null,
        color     = null,
        children  = const [];
}

// ─── App Drawer ───────────────────────────────────────────────────────────────

class AppDrawer extends StatelessWidget {
  final String           userName;
  final String           orgName;
  final List<DrawerItem> items;
  final VoidCallback?    onOrgTap;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.orgName,
    required this.items,
    this.onOrgTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.white,
      elevation: 0,
      width: 272,
      child: Column(
        children: [
          // ── Header ──
          _DrawerHeader(userName: userName, orgName: orgName, onOrgTap: onOrgTap),

          // ── Nav items ──
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 6, bottom: 8),
              children: _buildItems(context),
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

  List<Widget> _buildItems(BuildContext context) {
    final result = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final next = i + 1 < items.length ? items[i + 1] : null;
      final nextIsNavItem = next != null &&
          (next._type == _DrawerItemType.tile ||
           next._type == _DrawerItemType.expandable);

      switch (item._type) {
        case _DrawerItemType.tile:
          result.add(_DrawerTile(item: item));
          if (nextIsNavItem) {
            result.add(_tileDivider(context));
          }
        case _DrawerItemType.expandable:
          result.add(_ExpandableTile(item: item));
          if (nextIsNavItem) {
            result.add(_tileDivider(context));
          }
        case _DrawerItemType.category:
          result.add(_CategoryLabel(label: item.label!));
        case _DrawerItemType.divider:
          result.add(const _ItemDivider());
      }
    }
    return result;
  }

  Widget _tileDivider(BuildContext context) => Divider(
        height:    1,
        thickness: 0.7,
        indent:    56,
        endIndent: 16,
        color:     context.border,
      );
}

// ─── Drawer tile (leaf) ───────────────────────────────────────────────────────

class _DrawerTile extends StatelessWidget {
  final DrawerItem item;

  const _DrawerTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (item.routeName != null) context.pushNamed(item.routeName!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Row(
          children: [
            _IconBox(icon: item.icon!, color: item.color ?? context.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label!,
                style: context.bodySmall.copyWith(
                  fontWeight: .w600,
                  fontSize:   13,
                  color:      context.textPrimary,
                ),
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: 16, color: context.border),
          ],
        ),
      ),
    );
  }
}

// ─── Icon box ─────────────────────────────────────────────────────────────────

class _IconBox extends StatelessWidget {
  final IconData icon;
  final Color    color;

  const _IconBox({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  34,
      height: 34,
      decoration: BoxDecoration(
        color:        color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 17, color: color),
    );
  }
}

// ─── Expandable tile (parent with children) ───────────────────────────────────

class _ExpandableTile extends StatefulWidget {
  final DrawerItem item;

  const _ExpandableTile({required this.item});

  @override
  State<_ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<_ExpandableTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        // ── Parent row ──
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            color: _expanded
                ? context.primary.withValues(alpha: 0.08)
                : AppColors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              child: Row(
                children: [
                  _IconBox(
                    icon:  widget.item.icon!,
                    color: _expanded
                        ? context.primary
                        : (widget.item.color ?? context.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.item.label!,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        fontSize:   13,
                        color: _expanded ? context.primary : context.textPrimary,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns:    _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 280),
                    curve:    Curves.easeInOut,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size:  18,
                      color: _expanded ? context.primary : context.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // ── Children ──
        AnimatedSize(
          duration:  const Duration(milliseconds: 300),
          curve:     Curves.easeInOutCubic,
          alignment: .topCenter,
          child: _expanded
              ? _buildChildren(context)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildChildren(BuildContext context) {
    final tiles = widget.item.children
        .where((c) => c._type == _DrawerItemType.tile)
        .toList();

    return Column(
      mainAxisSize: .min,
      children: [
        for (int i = 0; i < tiles.length; i++) ...[
          _ChildTile(item: tiles[i]),
          if (i < tiles.length - 1)
            Divider(
              height:    1,
              thickness: 0.7,
              indent:    72,
              endIndent: 16,
              color:     context.border,
            ),
        ],
        const SizedBox(height: 4),
      ],
    );
  }
}

// ─── Child tile (submenu item) ────────────────────────────────────────────────

class _ChildTile extends StatelessWidget {
  final DrawerItem item;

  const _ChildTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (item.routeName != null) context.pushNamed(item.routeName!);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 52, right: 16, top: 10, bottom: 10),
        child: Row(
          children: [
            Icon(item.icon, size: 16, color: context.textSecondary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label!,
                style: context.bodySmall.copyWith(
                  fontWeight: .w400,
                  color:      context.textPrimary,
                  fontSize:   13,
                ),
              ),
            ),
          ],
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
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 6),
      child: Text(
        label.toUpperCase(),
        style: context.labelSmall.copyWith(
          color:         context.textSecondary,
          fontWeight:    .w700,
          letterSpacing: 1.0,
          fontSize:      10,
        ),
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
      indent:    16,
      endIndent: 16,
      height:    16,
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
      child: Material(
        color:        context.error.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap:        onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Icon(Iconsax.logout, color: context.error, size: 19),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    AppConstants.logout,
                    style: context.bodySmall.copyWith(
                      color:      context.error,
                      fontWeight: .w600,
                    ),
                  ),
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
  final String        userName;
  final String        orgName;
  final VoidCallback? onOrgTap;

  const _DrawerHeader({
    required this.userName,
    required this.orgName,
    this.onOrgTap,
  });

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Container(
      width:        double.infinity,
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primary, context.primary.withValues(alpha: 0.72)],
          begin:  .topLeft,
          end:    .bottomRight,
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
            child:  _Circle(size: 80, opacity: 0.06),
          ),

          // Content — horizontal: avatar | name + role
          Padding(
            padding: EdgeInsets.only(
              top:    top + 22,
              bottom: 22,
              left:   20,
              right:  20,
            ),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                // Avatar with ring
                Container(
                  width:  58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: .circle,
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.45),
                      width: 2.5,
                    ),
                    color: AppColors.white.withValues(alpha: 0.15),
                  ),
                  child: const Icon(
                    Iconsax.profile_circle,
                    color: AppColors.white,
                    size:  28,
                  ),
                ),
                const SizedBox(width: 14),
                // Name + role
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize:       .min,
                    children: [
                      Text(
                        userName,
                        style: context.titleSmall.copyWith(
                          color:      AppColors.white,
                          fontWeight: .w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Org badge — tappable to switch organisation
                      GestureDetector(
                        onTap: onOrgTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical:   4,
                          ),
                          decoration: BoxDecoration(
                            color:        AppColors.white.withValues(alpha: 0.20),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Icon(
                                Iconsax.buildings,
                                color: AppColors.white.withValues(alpha: 0.90),
                                size:  11,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                orgName,
                                style: context.labelSmall.copyWith(
                                  color:      AppColors.white.withValues(alpha: 0.92),
                                  fontWeight: .w600,
                                  fontSize:   11,
                                ),
                              ),
                              if (onOrgTap != null) ...[
                                const SizedBox(width: 5),
                                Icon(
                                  Icons.swap_horiz_rounded,
                                  color: AppColors.white.withValues(alpha: 0.85),
                                  size:  12,
                                ),
                              ],
                            ],
                          ),
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
        color: AppColors.white.withValues(alpha: opacity),
      ),
    );
  }
}
