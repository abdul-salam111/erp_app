import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/glass_surface.dart';
import '../../../../../core/widgets/shimmer_box.dart';
import '../../../../../routes/route_names.dart';
import '../../../domain/entities/system_entity.dart';
import '../bloc/roles_bloc.dart';
import '../bloc/roles_event.dart';
import '../bloc/roles_state.dart';

class RolesView extends StatelessWidget {
  const RolesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RolesBloc>()..add(const RolesListFetched()),
      child: const _RolesBody(),
    );
  }
}

class _RolesBody extends StatefulWidget {
  const _RolesBody();

  @override
  State<_RolesBody> createState() => _RolesBodyState();
}

class _RolesBodyState extends State<_RolesBody> {
  static const _filters = <String>['All', 'Manage', 'Not Allowed'];

  final _searchController = TextEditingController();
  String _query = '';
  String _filter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _canManage(RoleEntity role) => !role.isSystemRole;

  List<RoleEntity> _filtered(List<RoleEntity> all) {
    return all.where((role) {
      final canManage = _canManage(role);
      if (_filter == 'Manage' && !canManage) return false;
      if (_filter == 'Not Allowed' && canManage) return false;
      if (_query.isEmpty) return true;
      return role.name.toLowerCase().contains(_query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Roles'),
      floatingActionButton: _NewRoleFab(
        onTap: () => context.pushNamed(RouteNames.new_role),
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
              child: BlocBuilder<RolesBloc, RolesState>(
                buildWhen: (p, c) =>
                    p.apiStatus != c.apiStatus ||
                    p.roles != c.roles ||
                    p.message != c.message,
                builder: (context, state) {
                  if (state.apiStatus == ApiStatus.LOADING) {
                    return const _RolesTableShimmer();
                  }
                  if (state.apiStatus == ApiStatus.FAILURE) {
                    return Center(
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          Icon(
                            Iconsax.warning_2,
                            size: 40,
                            color: context.textSecondary,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.message ?? 'Failed to load roles',
                            style: context.bodyMedium.copyWith(
                              color: context.textSecondary,
                            ),
                            textAlign: .center,
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: () => context
                                .read<RolesBloc>()
                                .add(const RolesListFetched()),
                            icon: const Icon(Iconsax.refresh, size: 16),
                            label: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  final rows = _filtered(
                    (state.roles ?? const <RoleEntity>[])
                        .where((r) => !r.isArchived)
                        .toList(),
                  );
                  Future<void> onRefresh() async {
                    final bloc = context.read<RolesBloc>();
                    bloc.add(const RolesListFetched());
                    await bloc.stream.firstWhere(
                      (s) => s.apiStatus != ApiStatus.LOADING,
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: onRefresh,
                    color: context.primary,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: rows.isEmpty
                          ? ListView(
                              key: const ValueKey('empty'),
                              physics:
                                  const AlwaysScrollableScrollPhysics(),
                              children: [
                                SizedBox(
                                  height: MediaQuery.sizeOf(context).height *
                                      0.5,
                                  child: Center(
                                    child: Text(
                                      'No roles found',
                                      style: context.bodyMedium.copyWith(
                                        color: context.textSecondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : _RolesTableCard(
                              key: ValueKey('$_query$_filter'),
                              rows: rows,
                              canManage: _canManage,
                            )
                              .animate()
                              .fadeIn(delay: 200.ms, duration: 450.ms)
                              .slideY(begin: 0.10, curve: Curves.easeOutCubic),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewRoleFab extends StatefulWidget {
  final VoidCallback onTap;

  const _NewRoleFab({required this.onTap});

  @override
  State<_NewRoleFab> createState() => _NewRoleFabState();
}

class _NewRoleFabState extends State<_NewRoleFab> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.96 : 1,
      duration: const Duration(milliseconds: 140),
      curve: Curves.easeOutCubic,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: .topLeft,
            end: .bottomRight,
            colors: [
              context.primary,
              context.primary.withValues(alpha: 0.82),
            ],
          ),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.18),
          ),
        ),
        child: Material(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: widget.onTap,
            onHighlightChanged: (v) => setState(() => _pressed = v),
            borderRadius: BorderRadius.circular(20),
            splashColor: AppColors.white.withValues(alpha: 0.10),
            highlightColor: AppColors.white.withValues(alpha: 0.06),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 9,
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    alignment: .center,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: AppColors.white.withValues(alpha: 0.22),
                    ),
                    child: const Icon(
                      Icons.add_rounded,
                      size: 14,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'New Role',
                    style: context.labelMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: .w700,
                      fontSize: 13,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
  final List<RoleEntity> rows;
  final bool Function(RoleEntity) canManage;

  const _RolesTableCard({
    super.key,
    required this.rows,
    required this.canManage,
  });

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
                    style: _headerStyle(context),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 130,
                  child: Text(
                    'PERMISSIONS',
                    textAlign: .center,
                    style: _headerStyle(context),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 66,
                  child: Text(
                    'ACTIONS',
                    textAlign: .center,
                    style: _headerStyle(context),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: .zero,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: rows.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                thickness: 1,
                color: context.divider.withValues(alpha: 0.5),
              ),
              itemBuilder: (context, index) => _RoleTableRow(
                role: rows[index],
                index: index,
                canManage: canManage(rows[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _headerStyle(BuildContext context) => context.labelSmall.copyWith(
        color: context.primary,
        fontWeight: .w700,
        fontSize: 10.5,
        letterSpacing: 0.7,
      );
}

class _RoleTableRow extends StatelessWidget {
  final RoleEntity role;
  final int index;
  final bool canManage;

  const _RoleTableRow({
    required this.role,
    required this.index,
    required this.canManage,
  });

  static const _palette = [
    AppColors.primary,
    AppColors.teal,
    AppColors.purple,
    AppColors.orange,
    AppColors.green,
    AppColors.deepPurple,
    AppColors.tealDark,
    AppColors.brown,
    AppColors.errorBright,
    AppColors.blueGrey,
  ];

  Color get _color => _palette[role.id.abs() % _palette.length];

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
              child: Row(
                children: [
                  _RoleAvatar(name: role.name, color: _color),
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
            SizedBox(
              width: 130,
              child: canManage
                  ? Center(
                      child: _PermissionBadge(
                        onTap: () => AppToastsUtils.showInfoTop(
                          context,
                          'Manage permissions for ${role.name} — coming soon',
                        ),
                      ),
                    )
                  : null,
            ),
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

class _RoleAvatar extends StatelessWidget {
  final String name;
  final Color color;

  const _RoleAvatar({required this.name, required this.color});

  String get _initials {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2 && words[0].isNotEmpty && words[1].isNotEmpty) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: .center,
      decoration: BoxDecoration(
        shape: .circle,
        gradient: context.isDark
            ? RadialGradient(
                colors: [
                  color.withValues(alpha: 0.28),
                  color.withValues(alpha: 0.06),
                ],
              )
            : null,
        color: context.isDark ? null : color.withValues(alpha: 0.15),
      ),
      child: Text(
        _initials,
        style: context.labelSmall.copyWith(
          color: color,
          fontWeight: .w800,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _PermissionBadge extends StatelessWidget {
  final VoidCallback onTap;

  const _PermissionBadge({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = context.primary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withValues(alpha: context.isDark ? 0.14 : 0.10),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Row(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          children: [
            Icon(Iconsax.shield_tick, size: 11, color: color),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                'Manage Permission',
                style: context.labelSmall.copyWith(
                  color: color,
                  fontWeight: .w700,
                  fontSize: 10,
                  letterSpacing: 0.2,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
          ],
        ),
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

class _RolesTableShimmer extends StatelessWidget {
  const _RolesTableShimmer();

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
                  width: 130,
                  child: Text(
                    'PERMISSIONS',
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
          for (int i = 0; i < 8; i++) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  const ShimmerBox(width: 34, height: 34, radius: 17),
                  const SizedBox(width: 12),
                  const Expanded(child: ShimmerBox(height: 12, radius: 4)),
                  const SizedBox(width: 12),
                  const SizedBox(
                    width: 130,
                    child: ShimmerBox(height: 22, radius: 11),
                  ),
                  const SizedBox(width: 10),
                  const ShimmerBox(width: 30, height: 30, radius: 8),
                  const SizedBox(width: 6),
                  const ShimmerBox(width: 30, height: 30, radius: 8),
                ],
              ),
            ),
            if (i < 7)
              Divider(
                height: 1,
                thickness: 1,
                color: context.divider.withValues(alpha: 0.5),
              ),
          ],
        ],
      ),
    );
  }
}
