import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/debug/cubit/api_debug_cubit.dart';
import '../../../../core/debug/cubit/api_debug_state.dart';
import '../../../../core/di/di_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/theme/theme_exports.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../routes/route_names.dart';
import '../../profile_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileBloc>(),
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  static String get _roleDisplay {
    if (currentUser.isAdmin) return 'Administrator';
    final roles = currentUser.roles
        .map((r) => r.trim())
        .where((r) => r.isNotEmpty)
        .map((r) => r[0].toUpperCase() + r.substring(1))
        .toList();
    return roles.isEmpty ? 'Employee' : roles.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final hasMultiOrgs = (currentUser.organizations?.length ?? 0) > 1;
    final hasOrganization = currentUser.org.name.isNotEmpty;

    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (p, c) => p.logoutStatus != c.logoutStatus,
      listener: (context, state) {
        if (state.logoutStatus == ApiStatus.SUCCESS) {
          context.goNamed(RouteNames.signin);
        }
      },
      child: Scaffold(
        backgroundColor: context.background,
        body: CustomScrollView(
          slivers: [
            _ProfileHeader(roleDisplay: _roleDisplay),
            SliverPadding(
              padding: context.pagePadding.copyWith(top: 28, bottom: 48),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ── Personal Info ───────────────────────────────────
                  _SectionCard(
                        title: AppConstants.personalInformationTitle,
                        iconData: Iconsax.profile_circle,
                        children: [
                          _InfoRow(
                            icon: Iconsax.user,
                            label: AppConstants.fullNameLabel,
                            value: currentUser.fullName,
                          ),
                          _InfoRow(
                            icon: Iconsax.shield_tick,
                            label: AppConstants.roleLabel,
                            value: _roleDisplay,
                            isLast: true,
                          ),
                        ],
                      )
                      .animate()
                      .slideY(
                        begin: 0.25,
                        end: 0,
                        delay: 60.ms,
                        duration: 420.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .fadeIn(delay: 60.ms, duration: 320.ms),

                  if (hasOrganization) ...[
                    const SizedBox(height: 14),

                    // ── Organization ───────────────────────────────────
                    _CardContainer(
                          padding: EdgeInsets.zero,
                          child: _InfoRow(
                            icon: Iconsax.buildings,
                            label: AppConstants.organizationTitle,
                            value: currentUser.org.name,
                            isLast: true,
                          ),
                        )
                        .animate()
                        .slideY(
                          begin: 0.25,
                          end: 0,
                          delay: 100.ms,
                          duration: 420.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .fadeIn(delay: 100.ms, duration: 320.ms),
                  ],

                  const SizedBox(height: 14),

                  // ── Appearance ───────────────────────────────────────
                  const _AppearanceCard()
                      .animate()
                      .slideY(
                        begin: 0.25,
                        end: 0,
                        delay: 120.ms,
                        duration: 420.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .fadeIn(delay: 120.ms, duration: 320.ms),

                  const SizedBox(height: 14),

                  // ── Actions (Switch Org + Logout) ───────────────────
                  _ActionsCard(hasMultiOrgs: hasMultiOrgs)
                      .animate()
                      .slideY(
                        begin: 0.25,
                        end: 0,
                        delay: 140.ms,
                        duration: 420.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .fadeIn(delay: 140.ms, duration: 320.ms),

                  const SizedBox(height: 14),

                  BlocBuilder<ApiDebugCubit, ApiDebugState>(
                    buildWhen: (previous, current) =>
                        previous.isEnabled != current.isEnabled,
                    builder: (context, dbgState) {
                      if (!dbgState.isEnabled) return const SizedBox.shrink();
                      return Column(
                        children: [
                          _CardContainer(
                            padding: EdgeInsets.zero,
                            child: SwitchListTile(
                              title: const Text('API Debugger'),
                              value: dbgState.isEnabled,
                              onChanged: (_) =>
                                  context.read<ApiDebugCubit>().toggleEnabled(),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      );
                    },
                  ),

                  _CardContainer(
                    child: const _AppVersion(),
                  ).animate().fadeIn(delay: 260.ms, duration: 400.ms),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  final String roleDisplay;
  const _ProfileHeader({required this.roleDisplay});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final initials = _initials(currentUser.fullName);

    return SliverToBoxAdapter(
      child: ClipPath(
        clipper: _BottomWaveClipper(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.isDark ? AppColors.navyHeaderDark : null,
            gradient: context.isDark
                ? null
                : const LinearGradient(
                    colors: [AppColors.primaryDark, AppColors.primary],
                    begin: .topLeft,
                    end: .bottomRight,
                  ),
          ),
          child: Stack(
            children: [
              // Decorative circles
              Positioned(
                right: -50,
                top: top,
                child: _Circle(size: 160, opacity: 0.07),
              ),
              Positioned(
                right: 80,
                top: top + 24,
                child: _Circle(size: 60, opacity: 0.05),
              ),
              Positioned(
                left: -40,
                bottom: 10,
                child: _Circle(size: 120, opacity: 0.06),
              ),

              // Content
              Padding(
                padding: EdgeInsets.only(
                  top: top + 2,
                  bottom: 26,
                  left: context.pagePadding.left,
                  right: context.pagePadding.right,
                ),
                child: Column(
                  crossAxisAlignment: .center,
                  children: [
                    // Top bar: back
                    Row(
                      children: const [GlassBackButton()],
                    ).animate().fadeIn(delay: 0.ms, duration: 300.ms),

                    const SizedBox(height: 10),

                    // Avatar — tap 5× to switch environment
                    EnvSwitchDetector(
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: .circle,
                              gradient: RadialGradient(
                                colors: [
                                  AppColors.white.withValues(alpha: 0.30),
                                  AppColors.white.withValues(alpha: 0.12),
                                ],
                              ),
                              border: Border.all(
                                color: AppColors.white.withValues(alpha: 0.50),
                                width: 2.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.35,
                                  ),
                                  blurRadius: 24,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                initials,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 22,
                                  fontWeight: .w700,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        )
                        .animate()
                        .scale(
                          begin: const Offset(0.7, 0.7),
                          end: const Offset(1.0, 1.0),
                          delay: 0.ms,
                          duration: 450.ms,
                          curve: Curves.easeOutBack,
                        )
                        .fadeIn(delay: 0.ms, duration: 300.ms),

                    const SizedBox(height: 8),

                    // Name
                    Text(
                          currentUser.fullName,
                          style: context.titleMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: .w700,
                            fontSize: Responsive.value(
                              context,
                              phone: 16,
                              tablet: 18,
                              ipad: 20,
                            ),
                          ),
                          textAlign: .center,
                        )
                        .animate()
                        .slideY(
                          begin: 0.3,
                          end: 0,
                          delay: 100.ms,
                          duration: 380.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .fadeIn(delay: 100.ms, duration: 280.ms),

                    const SizedBox(height: 6),

                    // Role badge
                    Container(
                          padding: .symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.18),
                            borderRadius: .circular(20),
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Icon(
                                Iconsax.shield_tick,
                                color: AppColors.white.withValues(alpha: 0.95),
                                size: 12,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                roleDisplay,
                                style: context.labelSmall.copyWith(
                                  color: AppColors.white,
                                  fontWeight: .w600,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        )
                        .animate()
                        .slideY(
                          begin: 0.3,
                          end: 0,
                          delay: 130.ms,
                          duration: 380.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .fadeIn(delay: 130.ms, duration: 280.ms),

                    const SizedBox(height: 6),

                    // Email
                    Text(
                          currentUser.email,
                          style: context.bodySmall.copyWith(
                            color: AppColors.white.withValues(alpha: 0.75),
                            fontSize: 13,
                          ),
                          textAlign: .center,
                        )
                        .animate()
                        .slideY(
                          begin: 0.3,
                          end: 0,
                          delay: 160.ms,
                          duration: 380.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .fadeIn(delay: 160.ms, duration: 280.ms),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2)
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    if (name.isNotEmpty) return name[0].toUpperCase();
    return '?';
  }
}

void _confirmLogout(BuildContext context) {
  final bloc = context.read<ProfileBloc>();
  showDialog<bool>(
    context: context,
    builder: (dialogContext) => const _LogoutConfirmDialog(),
  ).then((confirmed) {
    if (confirmed == true) {
      bloc.add(const LogoutRequested());
    }
  });
}

class _LogoutConfirmDialog extends StatelessWidget {
  const _LogoutConfirmDialog();

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
                    Iconsax.logout,
                    color: AppColors.errorBright,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Sign out?',
                    style: context.titleSmall.copyWith(
                      fontWeight: .w700,
                      color: context.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'Are you sure you want to sign out of your account?',
              style: context.bodySmall.copyWith(
                color: context.textSecondary,
                fontSize: 13,
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
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign Out',
                      style: context.labelMedium.copyWith(
                        color: AppColors.white,
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

// ─── Wave clip ────────────────────────────────────────────────────────────────

class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 28)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height + 18,
        size.width,
        size.height - 28,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(_BottomWaveClipper oldClipper) => false;
}

// ─── Section card ─────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.iconData,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 16,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: .fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Container(
                  padding: .all(7),
                  decoration: BoxDecoration(
                    color: context.isDark
                        ? AppColors.navyIconBgDark
                        : context.primary.withValues(alpha: 0.10),
                    borderRadius: .circular(8),
                  ),
                  child: Icon(
                    iconData,
                    size: 15,
                    color: context.isDark
                        ? AppColors.navyIconColorDark
                        : context.primary,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: context.titleSmall.copyWith(
                    fontWeight: .w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.navyBorder),
          ...children,
        ],
      ),
    );
  }
}

// ─── Plain card container (for content without a section header) ─────────────

class _CardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _CardContainer({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 16,
      child: Material(
        color: AppColors.transparent,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

// ─── Info row ─────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: .symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: context.isDark
                      ? AppColors.navyIconBgDark
                      : context.surface,
                  borderRadius: .circular(9),
                ),
                child: Icon(
                  icon,
                  size: 15,
                  color: context.isDark
                      ? AppColors.navyIconColorDark
                      : context.textSecondary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      label,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 10,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value.isEmpty ? '—' : value,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        color: context.textPrimary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            thickness: 1,
            indent: 62,
            color: context.navyBorder,
          ),
      ],
    );
  }
}

// ─── Appearance card ──────────────────────────────────────────────────────────

class _AppearanceCard extends StatelessWidget {
  const _AppearanceCard();

  static IconData _iconFor(ThemeMode mode) => switch (mode) {
    ThemeMode.light => Icons.light_mode_rounded,
    ThemeMode.dark => Icons.dark_mode_rounded,
    ThemeMode.system => Icons.brightness_auto_rounded,
  };

  static String _labelFor(ThemeMode mode) => switch (mode) {
    ThemeMode.light => AppConstants.appearanceLight,
    ThemeMode.dark => AppConstants.appearanceDark,
    ThemeMode.system => AppConstants.appearanceSystem,
  };

  @override
  Widget build(BuildContext context) {
    return _CardContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          final mode = themeState.themeMode;
          return Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: context.isDark
                      ? AppColors.navyIconBgDark
                      : context.primary.withValues(alpha: 0.10),
                  borderRadius: .circular(12),
                ),
                child: Icon(
                  _iconFor(mode),
                  size: 18,
                  color: context.isDark
                      ? AppColors.navyIconColorDark
                      : context.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      AppConstants.appearanceLabel,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _labelFor(mode),
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _AppearanceSegmentedControl(mode: mode),
            ],
          );
        },
      ),
    );
  }
}

class _AppearanceSegmentedControl extends StatelessWidget {
  final ThemeMode mode;

  const _AppearanceSegmentedControl({required this.mode});

  static const _options = [
    (ThemeMode.system, Icons.brightness_auto_rounded),
    (ThemeMode.light, Icons.light_mode_rounded),
    (ThemeMode.dark, Icons.dark_mode_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: context.isDark ? AppColors.navyIconBgDark : context.grey100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          for (final option in _options)
            _SegmentButton(
              icon: option.$2,
              selected: mode == option.$1,
              onTap: () => context.read<ThemeBloc>().add(SetTheme(option.$1)),
            ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 32,
        height: 32,
        alignment: .center,
        decoration: BoxDecoration(
          color: selected ? context.primary : AppColors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 16,
          color: selected ? AppColors.white : context.textSecondary,
        ),
      ),
    );
  }
}

// ─── Actions card ─────────────────────────────────────────────────────────────

class _ActionsCard extends StatelessWidget {
  final bool hasMultiOrgs;
  const _ActionsCard({required this.hasMultiOrgs});

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 16,
      child: Column(
        children: [
          if (hasMultiOrgs) ...[
            _ActionRow(
              icon: Iconsax.refresh_circle,
              label: AppConstants.switchOrganization,
              subtitle: AppConstants.changeToADifferentOrganization,
              iconColor: context.isDark
                  ? AppColors.navyIconColorDark
                  : context.primary,
              iconBg: context.isDark
                  ? AppColors.navyIconBgDark
                  : context.primary.withValues(alpha: 0.10),
              onTap: () => context.pushNamed(RouteNames.organizationSelection),
            ),
            Divider(
              height: 1,
              thickness: 1,
              indent: 70,
              color: context.navyBorder,
            ),
          ],
          BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (p, c) => p.logoutStatus != c.logoutStatus,
            builder: (context, state) {
              final isLoggingOut = state.logoutStatus == ApiStatus.LOADING;
              return _ActionRow(
                icon: Iconsax.logout,
                label: AppConstants.logOut,
                subtitle: AppConstants.signOutOfYourAccount,
                iconColor: context.error,
                iconBg: context.isDark
                    ? AppColors.navyIconBgDark
                    : context.error.withValues(alpha: 0.10),
                isLoading: isLoggingOut,
                onTap: isLoggingOut ? null : () => _confirmLogout(context),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color iconColor;
  final Color iconBg;
  final VoidCallback? onTap;
  final bool isLoading;

  const _ActionRow({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.iconColor,
    required this.iconBg,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.transparent,
      borderRadius: .circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(16),
        splashColor: iconColor.withValues(alpha: 0.08),
        highlightColor: iconColor.withValues(alpha: 0.04),
        child: Padding(
          padding: .symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: .circular(12),
                ),
                child: Icon(icon, size: 18, color: iconColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      label,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(iconColor),
                  ),
                )
              else
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: iconColor.withValues(alpha: 0.60),
                ),
            ],
          ),
        ),
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
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: .circle,
        color: AppColors.white.withValues(alpha: opacity),
      ),
    );
  }
}

// ─── App version ──────────────────────────────────────────────────────────────

class _AppVersion extends StatelessWidget {
  const _AppVersion();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snap) {
        final version = snap.hasData
            ? 'Version ${snap.data!.version} (${snap.data!.buildNumber})'
            : 'Version —';
        return Column(
          children: [
            Icon(
              Iconsax.info_circle,
              size: 18,
              color: context.textSecondary.withValues(alpha: 0.50),
            ),
            const SizedBox(height: 6),
            Text(
              version,
              textAlign: .center,
              style: context.labelSmall.copyWith(
                color: context.textSecondary.withValues(alpha: 0.55),
                fontSize: 12,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Mantic ERP',
              textAlign: .center,
              style: context.labelSmall.copyWith(
                color: context.textSecondary.withValues(alpha: 0.35),
                fontSize: 11,
              ),
            ),
          ],
        );
      },
    );
  }
}
