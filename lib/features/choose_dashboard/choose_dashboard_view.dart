import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/services/current_user.dart';
import '../../core/services/session_manager.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/theme_utils.dart';
import '../../core/utils/utils_exports.dart';
import '../../routes/route_names.dart';

class ChooseDashboardView extends StatelessWidget {
  const ChooseDashboardView({super.key});

  static const _roleColors = [
    AppColors.primary,
    AppColors.creditGreen,
    AppColors.deepPurple,
    AppColors.teal,
    AppColors.amber,
    AppColors.cyan,
  ];

  static const _roleIcons = [
    Iconsax.briefcase,
    Iconsax.people,
    Iconsax.setting_2,
    Iconsax.chart,
    Iconsax.shield_tick,
    Iconsax.element_4,
  ];

  @override
  Widget build(BuildContext context) {
    final roles = SessionController.instance.userRoles;

    return Scaffold(
      backgroundColor: context.background,
      body: CustomScrollView(
        slivers: [
          _Header(userName: currentUser.firstName),
          SliverPadding(
            padding: context.pagePadding.copyWith(top: 24, bottom: 32),
            sliver: roles.isEmpty
                ? SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No roles assigned',
                        style: context.bodyMedium
                            .copyWith(color: context.textSecondary),
                      ),
                    ),
                  )
                : SliverList.separated(
                    itemCount: roles.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: context.gridSpacing + 4),
                    itemBuilder: (context, i) => _RoleCard(
                      roleName: roles[i],
                      color: _roleColors[i % _roleColors.length],
                      icon: _roleIcons[i % _roleIcons.length],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String userName;
  const _Header({required this.userName});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.primary, context.primary.withValues(alpha: 0.75)],
            begin: .topLeft,
            end: .bottomRight,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: .fromLTRB(
              context.pagePadding.left,
              24,
              context.pagePadding.right,
              32,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        borderRadius: .circular(14),
                      ),
                      child: const Icon(
                        Iconsax.element_4,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          if (userName.isNotEmpty) ...[
                            Text(
                              'Welcome, $userName',
                              style: context.bodyMedium.copyWith(
                                color: AppColors.white.withValues(alpha: 0.8),
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                          Text(
                            'Choose Dashboard',
                            style: context.headlineSmall.copyWith(
                              color: AppColors.white,
                              fontWeight: .w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Select the workspace you want to open',
                  style: context.bodySmall.copyWith(
                    color: AppColors.white.withValues(alpha: 0.7),
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

class _RoleCard extends StatelessWidget {
  final String roleName;
  final Color color;
  final IconData icon;

  const _RoleCard({
    required this.roleName,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          const BoxShadow(
            color: AppColors.shadow,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: context.surface,
        borderRadius: .circular(16),
        child: InkWell(
          onTap: () => context.goNamed(RouteNames.dashboard),
          borderRadius: .circular(16),
          child: ClipRRect(
            borderRadius: .circular(16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color.withValues(alpha: 0.18)),
                borderRadius: .circular(16),
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: .stretch,
                  children: [
                    Container(
                      width: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color, color.withValues(alpha: 0.4)],
                          begin: .topCenter,
                          end: .bottomCenter,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    color,
                                    color.withValues(alpha: 0.65),
                                  ],
                                  begin: .topLeft,
                                  end: .bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: color.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(icon,
                                  color: AppColors.white, size: 26),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                roleName,
                                style: context.titleSmall
                                    .copyWith(fontWeight: .w600),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.1),
                                borderRadius: .circular(8),
                              ),
                              child: Icon(
                                Iconsax.arrow_right_3,
                                color: color,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
