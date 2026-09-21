import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../../../core/di/di_exports.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../../../../core/widgets/glass_surface.dart';
import '../../../../../../core/widgets/shimmer_box.dart';
import '../../../../../../routes/route_names.dart';
import '../../../../system_exports.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<UsersBloc>()..add(const UsersListFetched()),
      child: const _UsersBody(),
    );
  }
}

class _UsersBody extends StatefulWidget {
  const _UsersBody();

  @override
  State<_UsersBody> createState() => _UsersBodyState();
}

class _UsersBodyState extends State<_UsersBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listenWhen: (p, c) => p.deleteStatus != c.deleteStatus,
      listener: (context, state) {
        if (state.deleteStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showInfoTop(context, 'User deleted');
        } else if (state.deleteStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showInfoTop(
            context,
            state.message ?? 'Failed to delete user',
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.background,
        appBar: CustomAppBar(title: 'Users'),
        body: const _UsersContent(),
        floatingActionButton: _GradientFab(
          label: 'New User',
          onTap: () => context.pushNamed(RouteNames.new_user),
        ),
      ),
    );
  }
}

class _GradientFab extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _GradientFab({required this.label, required this.onTap});

  @override
  State<_GradientFab> createState() => _GradientFabState();
}

class _GradientFabState extends State<_GradientFab> {
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
                    child: Icon(
                      Icons.add_rounded,
                      size: 14,
                      color: context.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: context.labelMedium.copyWith(
                      color: context.textPrimary,
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

class _UsersContent extends StatefulWidget {
  const _UsersContent();

  @override
  State<_UsersContent> createState() => _UsersContentState();
}

class _UsersContentState extends State<_UsersContent> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SystemUserEntity> _filter(List<SystemUserEntity> all) {
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all.where((user) {
      return user.name.toLowerCase().contains(q) ||
          user.email.toLowerCase().contains(q) ||
          user.designation.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocBuilder<UsersBloc, UsersState>(
              buildWhen: (p, c) =>
                  p.apiStatus != c.apiStatus ||
                  p.users != c.users ||
                  p.message != c.message,
              builder: (context, state) {
                if (state.apiStatus == ApiStatus.LOADING) {
                  return const _UsersTableShimmer();
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
                          state.message ?? 'Failed to load users',
                          style: context.bodyMedium.copyWith(
                            color: context.textSecondary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 12),
                        TextButton.icon(
                          onPressed: () => context
                              .read<UsersBloc>()
                              .add(const UsersListFetched()),
                          icon: const Icon(Iconsax.refresh, size: 16),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                final rows = _filter(
                  (state.users ?? const <SystemUserEntity>[])
                      .where((u) => !u.isArchived)
                      .toList(),
                );
                Future<void> onRefresh() async {
                  final bloc = context.read<UsersBloc>();
                  bloc.add(const UsersListFetched());
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
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.5,
                                child: Center(
                                  child: Text(
                                    'No users found',
                                    style: context.bodyMedium.copyWith(
                                      color: context.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : _UsersTableCard(key: ValueKey(_query), rows: rows)
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

class _UsersTableShimmer extends StatelessWidget {
  const _UsersTableShimmer();

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
                _HeaderCell('Name', flex: 4),
                const SizedBox(width: 12),
                _HeaderCell('Designation', flex: 2),
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        const ShimmerBox(width: 34, height: 34, radius: 17),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisSize: .min,
                            children: const [
                              ShimmerBox(height: 12, radius: 4),
                              SizedBox(height: 6),
                              ShimmerBox(height: 10, width: 120, radius: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    flex: 2,
                    child: ShimmerBox(height: 12, radius: 4),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 66,
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        ShimmerBox(width: 30, height: 30, radius: 8),
                        SizedBox(width: 6),
                        ShimmerBox(width: 30, height: 30, radius: 8),
                      ],
                    ),
                  ),
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

class _UsersTableCard extends StatelessWidget {
  final List<SystemUserEntity> rows;

  const _UsersTableCard({super.key, required this.rows});

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
                _HeaderCell('Name', flex: 4),
                const SizedBox(width: 12),
                _HeaderCell('Designation', flex: 2),
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
              physics: const AlwaysScrollableScrollPhysics(),
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

class _UserTableRow extends StatelessWidget {
  final SystemUserEntity user;
  final int index;

  const _UserTableRow({required this.user, required this.index});

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => _DeleteConfirmDialog(userName: user.name),
    );
    if (confirmed != true) return;
    if (!context.mounted) return;
    context.read<UsersBloc>().add(UserDeleteRequested(user.id));
  }

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
                user.designation.isEmpty ? '—' : user.designation,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 66,
              child: Row(
                mainAxisSize: .min,
                mainAxisAlignment: .center,
                children: [
                  _MiniAction(
                    icon: Iconsax.edit_2,
                    color: context.primary,
                    onTap: () => context.pushNamed(
                      RouteNames.edit_user,
                      pathParameters: {'id': user.id.toString()},
                    ),
                  ),
                  const SizedBox(width: 6),
                  _MiniAction(
                    icon: Iconsax.trash,
                    color: AppColors.errorBright,
                    onTap: () => _confirmDelete(context),
                  ),
                ],
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

class _DeleteConfirmDialog extends StatelessWidget {
  final String userName;

  const _DeleteConfirmDialog({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: GlassSurface(
        radius: 16,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: .center,
                  decoration: BoxDecoration(
                    shape: .circle,
                    gradient: context.isDark
                        ? RadialGradient(
                            colors: [
                              AppColors.errorBright.withValues(alpha: 0.28),
                              AppColors.errorBright.withValues(alpha: 0.06),
                            ],
                          )
                        : null,
                    color: context.isDark
                        ? null
                        : AppColors.errorBright.withValues(alpha: 0.12),
                  ),
                  child: Icon(
                    Iconsax.trash,
                    color: AppColors.errorBright,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Delete user?',
                    style: context.titleSmall.copyWith(
                      fontWeight: .w700,
                      color: context.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text.rich(
              TextSpan(
                style: context.bodySmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 13,
                ),
                children: [
                  const TextSpan(text: 'Are you sure you want to delete '),
                  TextSpan(
                    text: userName.isEmpty ? 'this user' : userName,
                    style: TextStyle(
                      color: context.textPrimary,
                      fontWeight: .w700,
                    ),
                  ),
                  const TextSpan(text: '? This action cannot be undone.'),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                      side: BorderSide(
                        color: context.isDark
                            ? context.navyBorder
                            : context.border,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: context.labelMedium.copyWith(
                        color: context.textPrimary,
                        fontWeight: .w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                      backgroundColor: AppColors.errorBright,
                      foregroundColor: context.textPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Delete',
                      style: context.labelMedium.copyWith(
                        color: context.textPrimary,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

