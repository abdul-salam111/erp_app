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
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_utils.dart';
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
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
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
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Container(
                            padding: .all(8),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.15),
                              borderRadius: .circular(10),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
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
                              color: AppColors.primary.withValues(alpha: 0.35),
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
    if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    if (name.isNotEmpty) return name[0].toUpperCase();
    return '?';
  }
}

void _confirmLogout(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Sign Out',
        style: TextStyle(fontWeight: .w700, fontSize: 17),
      ),
      content: const Text(
        'Are you sure you want to sign out of your account?',
        style: TextStyle(fontSize: 14),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<ProfileBloc>().add(const LogoutRequested());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontWeight: .w700),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// ─── Wave clip ────────────────────────────────────────────────────────────────

class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 28)
      ..quadraticBezierTo(
        size.width * 0.5, size.height + 18,
        size.width, size.height - 28,
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
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(16),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
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
                    color: context.primary.withValues(alpha: 0.10),
                    borderRadius: .circular(8),
                  ),
                  child: Icon(iconData, size: 15, color: context.primary),
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
          Divider(height: 1, thickness: 1, color: context.border),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // Material (not a color on the Container above) so ListTile/InkWell
      // descendants (e.g. SwitchListTile) paint their splashes correctly.
      child: Material(
        color: context.white,
        borderRadius: .circular(16),
        clipBehavior: .antiAlias,
        child: Padding(
          padding: padding,
          child: child,
        ),
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
                  color: context.grey50,
                  borderRadius: .circular(9),
                ),
                child: Icon(icon, size: 15, color: context.textSecondary),
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
            color: context.border,
          ),
      ],
    );
  }
}

// ─── Actions card ─────────────────────────────────────────────────────────────

class _ActionsCard extends StatelessWidget {
  final bool hasMultiOrgs;
  const _ActionsCard({required this.hasMultiOrgs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(16),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          if (hasMultiOrgs) ...[
            _ActionRow(
              icon: Iconsax.refresh_circle,
              label: AppConstants.switchOrganization,
              subtitle: AppConstants.changeToADifferentOrganization,
              iconColor: context.primary,
              iconBg: context.primary.withValues(alpha: 0.10),
              onTap: () => context.pushNamed(RouteNames.organizationSelection),
            ),
            Divider(height: 1, thickness: 1, indent: 70, color: context.border),
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
                iconBg: context.error.withValues(alpha: 0.10),
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
