import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/glass_surface.dart';

class RolesView extends StatefulWidget {
  const RolesView({super.key});

  @override
  State<RolesView> createState() => _RolesViewState();
}

class _RolesViewState extends State<RolesView> {
  static const _roles = <_RoleRow>[
    _RoleRow(
      name: 'Admin',
      icon: Iconsax.crown,
      color: AppColors.orange,
      userCount: 3,
    ),
    _RoleRow(
      name: 'Control Panel Admin',
      icon: Iconsax.setting_2,
      color: AppColors.primary,
      userCount: 2,
    ),
    _RoleRow(
      name: 'Junior Accountant',
      icon: Iconsax.calculator,
      color: AppColors.teal,
      userCount: 5,
    ),
    _RoleRow(
      name: 'Production',
      icon: Iconsax.buildings_2,
      color: AppColors.purple,
      userCount: 8,
    ),
    _RoleRow(
      name: 'Gate and Weight',
      icon: Iconsax.truck,
      color: AppColors.deepPurple,
      userCount: 4,
    ),
    _RoleRow(
      name: 'GRN Store Clerk',
      icon: Iconsax.box,
      color: AppColors.tealDark,
      userCount: 2,
    ),
    _RoleRow(
      name: 'Prodcution',
      icon: Iconsax.setting_3,
      color: AppColors.blueGrey,
      userCount: 0,
    ),
    _RoleRow(
      name: 'Lab',
      icon: Iconsax.health,
      color: AppColors.green,
      userCount: 3,
    ),
    _RoleRow(
      name: 'Cashier',
      icon: Iconsax.money,
      color: AppColors.brown,
      userCount: 2,
    ),
    _RoleRow(
      name: 'Auditor',
      icon: Iconsax.security_user,
      color: AppColors.blueGrey,
      userCount: 1,
    ),
    _RoleRow(
      name: 'CFO',
      icon: Iconsax.chart_2,
      color: AppColors.primaryDark,
      userCount: 1,
    ),
    _RoleRow(
      name: 'Manager',
      icon: Iconsax.user_octagon,
      color: AppColors.errorBright,
      userCount: 6,
    ),
    _RoleRow(
      name: 'Director',
      icon: Iconsax.medal_star,
      color: AppColors.primary,
      userCount: 1,
    ),
  ];

  static const _filters = <String>['All', 'Active', 'Empty', 'Recently used'];

  final _searchController = TextEditingController();
  String _query = '';
  String _filter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_RoleRow> get _filtered {
    return _roles.where((role) {
      if (_filter == 'Empty' && role.userCount > 0) return false;
      if (_filter == 'Active' && role.userCount == 0) return false;
      if (_query.isEmpty) return true;
      return role.name.toLowerCase().contains(_query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _filtered;
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Roles'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => AppToastsUtils.showInfoTop(
          context,
          'New role — coming soon',
        ),
        backgroundColor: context.primary,
        foregroundColor: AppColors.white,
        elevation: 4,
        highlightElevation: 6,
        icon: const Icon(Icons.add_rounded, size: 20),
        label: Text(
          'New Role',
          style: context.labelMedium.copyWith(
            color: AppColors.white,
            fontWeight: .w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          Padding(
            padding: context.pagePadding.copyWith(bottom: 0),
            child: _Toolbar(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v),
              filter: _filter,
              filters: _filters,
              onFilterChanged: (v) => setState(() => _filter = v),
            )
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.15, curve: Curves.easeOutCubic),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: context.pagePadding.copyWith(top: 0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: rows.isEmpty
                    ? Center(
                        key: const ValueKey('empty'),
                        child: Text(
                          'No roles found',
                          style: context.bodyMedium.copyWith(
                            color: context.textSecondary,
                          ),
                        ),
                      )
                    : Column(
                        key: ValueKey('$_query$_filter'),
                        children: [
                          Expanded(
                            child: _RolesTableCard(rows: rows)
                                .animate()
                                .fadeIn(delay: 200.ms, duration: 450.ms)
                                .slideY(begin: 0.10, curve: Curves.easeOutCubic),
                          ),
                          const SizedBox(height: 8),
                          _CountFooter(
                            shown: rows.length,
                            total: _roles.length,
                          )
                              .animate()
                              .fadeIn(delay: 400.ms, duration: 400.ms),
                          const SizedBox(height: 80),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Toolbar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String filter;
  final List<String> filters;
  final ValueChanged<String> onFilterChanged;

  const _Toolbar({
    required this.controller,
    required this.onChanged,
    required this.filter,
    required this.filters,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = context.isDark
        ? context.navyIconBg
        : context.surfaceElevated;
    final borderColor = context.isDark ? context.navyBorder : context.border;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: context.bodySmall.copyWith(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Filter Keywords',
                hintStyle: context.bodySmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Iconsax.search_normal_1,
                  size: 16,
                  color: context.textSecondary,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 7),
                filled: true,
                fillColor: fillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.primary),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        _FilterChip(
          value: filter,
          options: filters,
          onChanged: onFilterChanged,
          fillColor: fillColor,
          borderColor: borderColor,
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;
  final Color fillColor;
  final Color borderColor;

  const _FilterChip({
    required this.value,
    required this.options,
    required this.onChanged,
    required this.fillColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showPicker(context),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            Icon(Iconsax.filter, size: 14, color: context.primary),
            const SizedBox(width: 6),
            Text(
              value,
              style: context.labelMedium.copyWith(
                color: context.textPrimary,
                fontWeight: .w600,
                fontSize: 12.5,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Iconsax.arrow_down_1,
              size: 14,
              color: context.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showPicker(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.transparent,
      builder: (ctx) => Container(
        margin: const EdgeInsets.all(12),
        child: GlassSurface(
          radius: 16,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: .min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: context.textSecondary.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(Iconsax.filter, size: 16, color: context.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Filter Roles',
                        style: context.titleSmall.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                for (final o in options)
                  ListTile(
                    onTap: () => Navigator.of(ctx).pop(o),
                    dense: true,
                    leading: Icon(
                      o == value
                          ? Iconsax.tick_circle
                          : Iconsax.record_circle,
                      size: 16,
                      color: o == value
                          ? context.primary
                          : context.textSecondary,
                    ),
                    title: Text(
                      o,
                      style: context.bodySmall.copyWith(
                        color: context.textPrimary,
                        fontWeight: o == value ? .w700 : .w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    if (selected != null) onChanged(selected);
  }
}

class _RolesTableCard extends StatelessWidget {
  final List<_RoleRow> rows;

  const _RolesTableCard({required this.rows});

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 12,
      clipBehavior: .hardEdge,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.primary.withValues(
                alpha: context.isDark ? 0.14 : 0.07,
              ),
              border: Border(
                bottom: BorderSide(
                  color: context.primary.withValues(alpha: 0.22),
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ROLE',
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: .w700,
                      fontSize: 10.5,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 62,
                  child: Text(
                    'USERS',
                    textAlign: .center,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: .w700,
                      fontSize: 10.5,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 66,
                  child: Text(
                    'ACTIONS',
                    textAlign: .center,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: .w700,
                      fontSize: 10.5,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: .zero,
              itemCount: rows.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                thickness: 1,
                color: context.divider.withValues(alpha: 0.5),
              ),
              itemBuilder: (context, index) =>
                  _RoleTableRow(role: rows[index], index: index),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleTableRow extends StatelessWidget {
  final _RoleRow role;
  final int index;

  const _RoleTableRow({required this.role, required this.index});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + (index * 40).clamp(0, 400)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, (1 - value) * 8),
          child: child,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  _RoleIcon(color: role.color, icon: role.icon),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      role.name,
                      style: context.bodySmall.copyWith(
                        color: context.textPrimary,
                        fontWeight: .w600,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _UserCountBadge(count: role.userCount),
            const SizedBox(width: 10),
            _MiniAction(
              icon: Iconsax.edit_2,
              color: context.primary,
              onTap: () => AppToastsUtils.showInfoTop(
                context,
                'Edit — coming soon',
              ),
            ),
            const SizedBox(width: 6),
            _MiniAction(
              icon: Iconsax.trash,
              color: AppColors.errorBright,
              onTap: () => AppToastsUtils.showInfoTop(
                context,
                'Delete — coming soon',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _RoleIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: .center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: context.isDark
            ? RadialGradient(
                colors: [
                  color.withValues(alpha: 0.28),
                  color.withValues(alpha: 0.06),
                ],
              )
            : null,
        color: context.isDark ? null : color.withValues(alpha: 0.12),
      ),
      child: Icon(icon, color: color, size: 17),
    );
  }
}

class _UserCountBadge extends StatelessWidget {
  final int count;

  const _UserCountBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    final color = count == 0 ? context.textSecondary : context.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withValues(alpha: context.isDark ? 0.14 : 0.10),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(Iconsax.profile_2user, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            '$count',
            style: context.labelSmall.copyWith(
              color: color,
              fontWeight: .w700,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniAction extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MiniAction({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        alignment: .center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color.withValues(alpha: context.isDark ? 0.14 : 0.10),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Icon(icon, size: 14, color: color),
      ),
    );
  }
}

class _CountFooter extends StatelessWidget {
  final int shown;
  final int total;

  const _CountFooter({required this.shown, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.primary.withValues(
          alpha: context.isDark ? 0.12 : 0.06,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.primary.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        children: [
          Icon(Iconsax.info_circle, size: 12, color: context.primary),
          const SizedBox(width: 6),
          Text(
            shown == total ? '$total roles' : '$shown of $total roles',
            style: context.labelSmall.copyWith(
              color: context.primary,
              fontWeight: .w700,
              fontSize: 11,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleRow {
  final String name;
  final IconData icon;
  final Color color;
  final int userCount;

  const _RoleRow({
    required this.name,
    required this.icon,
    required this.color,
    required this.userCount,
  });
}
