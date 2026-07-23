import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/services/current_user.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/theme_utils.dart';
import '../../core/utils/utils_exports.dart';
import '../../routes/route_names.dart';

class ChooseDashboardView extends StatelessWidget {
  const ChooseDashboardView({super.key});

  static final _options = [
    _DashboardOption(
      title: 'Working Dashboard',
      subtitle: 'Access ERP modules, reports & management tools',
      icon: Iconsax.briefcase,
      color: AppColors.primary,
      routeName: RouteNames.dashboard,
    ),
    _DashboardOption(
      title: 'Employee Dashboard',
      subtitle: 'View your attendance, leaves, salary & more',
      icon: Iconsax.people,
      color: AppColors.creditGreen,
      routeName: RouteNames.employee_dashboard,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: CustomScrollView(
        slivers: [
          _Header(userName: currentUser.firstName),
          SliverPadding(
            padding: context.pagePadding.copyWith(top: 24, bottom: 32),
            sliver: SliverList.separated(
              itemCount: _options.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: context.gridSpacing + 4),
              itemBuilder: (context, i) =>
                  _DashboardCard(option: _options[i]),
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

class _DashboardOption {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String routeName;

  const _DashboardOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.routeName,
  });
}

class _DashboardCard extends StatelessWidget {
  final _DashboardOption option;
  const _DashboardCard({required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: option.color.withValues(alpha: 0.12),
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
          onTap: () => context.goNamed(option.routeName),
          borderRadius: .circular(16),
          child: ClipRRect(
            borderRadius: .circular(16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: option.color.withValues(alpha: 0.18)),
                borderRadius: .circular(16),
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: .stretch,
                  children: [
                    // Accent bar
                    Container(
                      width: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            option.color,
                            option.color.withValues(alpha: 0.4),
                          ],
                          begin: .topCenter,
                          end: .bottomCenter,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const .fromLTRB(14, 18, 14, 18),
                        child: Row(
                          children: [
                            // Icon badge
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    option.color,
                                    option.color.withValues(alpha: 0.65),
                                  ],
                                  begin: .topLeft,
                                  end: .bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        option.color.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(
                                option.icon,
                                color: AppColors.white,
                                size: 26,
                              ),
                            ),
                            const SizedBox(width: 14),
                            // Title + subtitle
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                mainAxisAlignment: .center,
                                children: [
                                  Text(
                                    option.title,
                                    style: context.titleSmall
                                        .copyWith(fontWeight: .w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    option.subtitle,
                                    style: context.bodySmall.copyWith(
                                        color: context.textSecondary),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Arrow
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: option.color.withValues(alpha: 0.1),
                                borderRadius: .circular(8),
                              ),
                              child: Icon(
                                Iconsax.arrow_right_3,
                                color: option.color,
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
