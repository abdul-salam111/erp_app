import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/glass_surface.dart';
import '../../../../../routes/route_names.dart';
import '../../../system_exports.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SecurityBloc>(),
      child: const _SecurityBody(),
    );
  }
}

class _SecurityBody extends StatefulWidget {
  const _SecurityBody();

  @override
  State<_SecurityBody> createState() => _SecurityBodyState();
}

class _SecurityBodyState extends State<_SecurityBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Users'),
      body: const _UsersContent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(RouteNames.new_user),
        backgroundColor: context.primary,
        foregroundColor: AppColors.white,
        elevation: 4,
        highlightElevation: 6,
        icon: const Icon(Icons.add_rounded, size: 20),
        label: Text(
          'New User',
          style: context.labelMedium.copyWith(
            color: AppColors.white,
            fontWeight: .w700,
          ),
        ),
      ),
    );
  }
}

class _UsersContent extends StatefulWidget {
  const _UsersContent();

  @override
  State<_UsersContent> createState() => _UsersContentState();
}

class _UsersContentState extends State<_UsersContent> {
  static const _users = <_UserRow>[
    _UserRow(
      name: '',
      email: 'HrCommisionagent@gmail.com',
      designation: 'Owner',
      department: 'Department',
      active: false,
    ),
    _UserRow(
      name: 'Tayyab Bahir',
      email: 'tayyabb@bahooricemills.com',
      designation: 'Owner',
      department: 'Department',
      active: false,
    ),
    _UserRow(
      name: 'Bilal Khalid',
      email: 'ST-team@bahoofoods.com',
      designation: 'Admin Officer',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Altaf Hussain',
      email: 'admin@bahoofoods.com',
      designation: 'Accounts',
      department: 'Department',
      active: false,
    ),
    _UserRow(
      name: 'Saddam Hussain',
      email: 'saddam@bahoofoods.com',
      designation: 'Accounts',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Ghulam Abbas',
      email: 'abbas@bahoofoods.com',
      designation: 'Accounts',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Muneeb UR Rehman',
      email: 'muneeb@bahoofoods.com',
      designation: 'Gate Clerk',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Ayesha Rehman',
      email: 'ayesha@bahoofoods.com',
      designation: 'Quality Executive',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Nimra Shakir',
      email: 'nimrashakir@bahoofoods.com',
      designation: 'QA',
      department: 'Department',
      active: true,
    ),
  ];

  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_UserRow> get _filtered {
    return _users.where((user) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return user.name.toLowerCase().contains(q) ||
          user.email.toLowerCase().contains(q) ||
          user.designation.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _filtered;
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Padding(
          padding: context.pagePadding.copyWith(bottom: 0),
          child: _Toolbar(
            controller: _searchController,
            onChanged: (v) => setState(() => _query = v),
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
                        'No users found',
                        style: context.bodyMedium.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                    )
                  : _UsersTableCard(key: ValueKey(_query), rows: rows)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 450.ms)
                      .slideY(begin: 0.10, curve: Curves.easeOutCubic),
            ),
          ),
        ),
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _Toolbar({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = context.isDark
        ? context.navyIconBg
        : context.surfaceElevated;
    final borderColor = context.isDark ? context.navyBorder : context.border;

    return SizedBox(
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
    );
  }
}

class _UsersTableCard extends StatelessWidget {
  final List<_UserRow> rows;

  const _UsersTableCard({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    final showAllColumns = !context.isPhone;
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
                _HeaderCell('Name', flex: 4),
                const SizedBox(width: 12),
                _HeaderCell('Designation', flex: 2),
                if (showAllColumns) ...[
                  const SizedBox(width: 12),
                  _HeaderCell('Department', flex: 2),
                ],
                const SizedBox(width: 20),
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
              itemBuilder: (context, index) => _UserTableRow(
                user: rows[index],
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  const _HeaderCell(this.text, {required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text.toUpperCase(),
        style: context.labelSmall.copyWith(
          color: context.primary,
          fontWeight: .w700,
          fontSize: 10.5,
          letterSpacing: 0.7,
        ),
      ),
    );
  }
}

class _UserTableRow extends StatefulWidget {
  final _UserRow user;
  final int index;

  const _UserTableRow({required this.user, required this.index});

  @override
  State<_UserTableRow> createState() => _UserTableRowState();
}

class _UserTableRowState extends State<_UserTableRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final showAllColumns = !context.isPhone;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + (widget.index * 40).clamp(0, 400)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, (1 - value) * 8),
          child: child,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _expanded
              ? context.primary.withValues(alpha: context.isDark ? 0.08 : 0.05)
              : context.transparent,
          border: _expanded
              ? Border(
                  bottom: BorderSide(
                    color: context.primary.withValues(alpha: 0.55),
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          _UserAvatar(
                            name: user.name.isNotEmpty ? user.name : user.email,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              mainAxisSize: .min,
                              children: [
                                if (user.name.isNotEmpty)
                                  Text(
                                    user.name,
                                    style: context.bodySmall.copyWith(
                                      color: context.textPrimary,
                                      fontWeight: .w600,
                                      fontSize: 12.5,
                                    ),
                                    maxLines: 1,
                                    overflow: .ellipsis,
                                  ),
                                Text(
                                  user.email,
                                  style: context.labelSmall.copyWith(
                                    color: context.primary,
                                    fontSize: 11,
                                    fontWeight: .w500,
                                  ),
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: Text(
                        user.designation,
                        style: context.bodySmall.copyWith(
                          color: context.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    if (showAllColumns) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Text(
                          user.department,
                          style: context.bodySmall.copyWith(
                            color: context.textPrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 20,
                      child: AnimatedRotation(
                        turns: _expanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                          color: context.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              alignment: .topCenter,
              child: _expanded
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: context.primary.withValues(alpha: 0.20),
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                      child: Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: _DetailColumn(
                              label: 'Department',
                              alignment: .start,
                              value: Text(
                                user.department,
                                style: context.bodySmall.copyWith(
                                  color: context.textPrimary,
                                  fontSize: 12,
                                  fontWeight: .w600,
                                ),
                                maxLines: 1,
                                overflow: .ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            child: _DetailColumn(
                              label: 'Token',
                              alignment: .center,
                              value: _MiniAction(
                                icon: Iconsax.key,
                                color: AppColors.teal,
                                onTap: () => AppToastsUtils.showInfoTop(
                                  context,
                                  'Tokens — coming soon',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: _DetailColumn(
                              label: 'Fin Year',
                              alignment: .center,
                              value: _MiniAction(
                                icon: Iconsax.calendar_1,
                                color: AppColors.purple,
                                onTap: () => AppToastsUtils.showInfoTop(
                                  context,
                                  'Fin Years — coming soon',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: _DetailColumn(
                              label: 'Actions',
                              alignment: .end,
                              value: Row(
                                mainAxisSize: .min,
                                children: [
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
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailColumn extends StatelessWidget {
  final String label;
  final Widget value;
  final CrossAxisAlignment alignment;

  const _DetailColumn({
    required this.label,
    required this.value,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: .min,
      children: [
        Text(
          label.toUpperCase(),
          style: context.labelSmall.copyWith(
            color: context.primary,
            fontWeight: .w700,
            fontSize: 9.5,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 8),
        value,
      ],
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

class _UserAvatar extends StatelessWidget {
  final String name;

  static const _palette = [
    AppColors.primary,
    AppColors.teal,
    AppColors.purple,
    AppColors.orange,
    AppColors.green,
    AppColors.deepPurple,
    AppColors.tealDark,
    AppColors.blueGrey,
  ];

  const _UserAvatar({required this.name});

  String get _initials {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2 && words[0].isNotEmpty && words[1].isNotEmpty) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    final color = _palette[name.hashCode.abs() % _palette.length];
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

class _UserRow {
  final String name;
  final String email;
  final String designation;
  final String department;
  final bool active;

  const _UserRow({
    required this.name,
    required this.email,
    required this.designation,
    required this.department,
    required this.active,
  });
}
