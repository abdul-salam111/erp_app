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
    AppColors.accentBlue,
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
            // No empty state: the Employee Portal card is always listed, so
            // even a user with no assigned roles has a workspace to open.
            sliver: SliverList.separated(
              itemCount: roles.length + 1,
              separatorBuilder: (_, __) =>
                  SizedBox(height: context.gridSpacing + 4),
              itemBuilder: (context, i) {
                if (i == roles.length) {
                  return _RoleCard(
                    roleName: 'Employee Portal',
                    color: AppColors.creditGreen,
                    icon: Iconsax.user_octagon,
                    routeName: RouteNames.employee_dashboard,
                  );
                }
                return _RoleCard(
                  roleName: roles[i],
                  color: _roleColors[i % _roleColors.length],
                  icon: _roleIcons[i % _roleIcons.length],
                  routeName: RouteNames.dashboard,
                );
              },
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
    final canGoBack = context.canPop();
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
                // Only when pushed (e.g. switching role from profile) — on the
                // post-login path this screen is the root, with nothing to
                // go back to.
                if (canGoBack)
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 38,
                      height: 38,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: context.whiteText,
                        size: 18,
                      ),
                    ),
                  ),
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
                                color: context.whiteText.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                          Text(
                            'Choose Dashboard',
                            style: context.headlineSmall.copyWith(
                              color: context.whiteText,
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
                    color: context.whiteText.withValues(alpha: 0.7),
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
  final String routeName;

  const _RoleCard({
    required this.roleName,
    required this.color,
    required this.icon,
    required this.routeName,
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
          onTap: () async {
            // Remembered so the next launch skips this screen and reopens
            // the workspace the user picked.
            await SessionController.instance.saveSelectedRole(
              roleName,
              routeName,
            );
            if (context.mounted) context.goNamed(routeName);
          },
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
