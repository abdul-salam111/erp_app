import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/constants/app_icons.dart';
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

String get _roleDisplay {
  if (currentUser.isAdmin) return 'Administrator';
  final roles = currentUser.roles
      .map((r) => r.trim())
      .where((r) => r.isNotEmpty)
      .map((r) => r[0].toUpperCase() + r.substring(1))
      .toList();
  return roles.isEmpty ? 'Employee' : roles.join(', ');
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

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
            SliverToBoxAdapter(
              child: _ProfileHeader(
                roleDisplay: _roleDisplay,
                hasOrganization: hasOrganization,
                hasMultiOrgs: hasMultiOrgs,
              ),
            ),
            SliverPadding(
              padding: context.pagePadding.copyWith(top: 24, bottom: 40),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _SectionLabel(
                    AppConstants.accountSectionLabel,
                  ).animate().fadeIn(delay: 80.ms, duration: 280.ms),
                  const SizedBox(height: 8),
                  _AccountCard()
                      .animate()
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        delay: 100.ms,
                        duration: 380.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .fadeIn(delay: 100.ms, duration: 300.ms),

                  const SizedBox(height: 22),

                  _SectionLabel(
                    AppConstants.preferencesSectionLabel,
                  ).animate().fadeIn(delay: 140.ms, duration: 280.ms),
                  const SizedBox(height: 8),
                  const _AppearanceCard()
                      .animate()
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        delay: 160.ms,
                        duration: 380.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .fadeIn(delay: 160.ms, duration: 300.ms),

                  const SizedBox(height: 22),

                  BlocBuilder<ApiDebugCubit, ApiDebugState>(
                    buildWhen: (previous, current) =>
                        previous.isEnabled != current.isEnabled,
                    builder: (context, dbgState) {
                      if (!dbgState.isEnabled) return const SizedBox.shrink();
                      return Column(
                        children: [
                          GlassSurface(
                            radius: 18,
                            child: SwitchListTile(
                              title: const Text('API Debugger'),
                              value: dbgState.isEnabled,
                              onChanged: (_) =>
                                  context.read<ApiDebugCubit>().toggleEnabled(),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      );
                    },
                  ),

                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (p, c) => p.logoutStatus != c.logoutStatus,
                    builder: (context, state) {
                      final isLoggingOut =
                          state.logoutStatus == ApiStatus.LOADING;
                      return GlassSurface(
                        radius: 18,
                        padding: EdgeInsets.zero,
                        child: _ActionRow(
                          icon: Iconsax.logout,
                          label: AppConstants.logOut,
                          iconColor: context.error,
                          iconBg: context.isDark
                              ? AppColors.navyIconBgDark
                              : context.error.withValues(alpha: 0.10),
                          isLoading: isLoggingOut,
                          onTap: isLoggingOut
                              ? null
                              : () => _confirmLogout(context),
                        ),
                      );
                    },
                  ).animate().fadeIn(delay: 200.ms, duration: 320.ms),

                  const SizedBox(height: 28),

                  const _AppVersion().animate().fadeIn(
                    delay: 260.ms,
                    duration: 400.ms,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Section label (small uppercase caption above a card group) ──────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text.toUpperCase(),
        style: context.labelSmall.copyWith(
          color: context.textSecondary,
          fontWeight: .w700,
          fontSize: 11.5,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

// ─── Header: gradient bar + overlapping profile card ──────────────────────────

class _ProfileHeader extends StatelessWidget {
  final String roleDisplay;
  final bool hasOrganization;
  final bool hasMultiOrgs;

  const _ProfileHeader({
    required this.roleDisplay,
    required this.hasOrganization,
    required this.hasMultiOrgs,
  });

  // The gradient bar is Positioned (behind, zero influence on the Stack's
  // own size) with a fixed height that always reserves its own space for
  // the back button/title row. The card below is the Stack's only
  // non-positioned child — the one that determines its total height — and
  // its top padding (barHeight - overlap, always positive) is what pulls it
  // up to overlap the bar. Because the padding is positive and fixed, the
  // card can never climb high enough to cover the title above it,
  // regardless of how tall its own content grows.
  static const double _barContentHeight = 140;
  static const double _cardOverlap = 70;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final barHeight = top + _barContentHeight;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: barHeight,
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
              clipBehavior: .none,
              children: [
                Positioned(
                  right: -50,
                  top: top,
                  child: const _Circle(size: 160, opacity: 0.07),
                ),
                Positioned(
                  left: -40,
                  bottom: -10,
                  child: const _Circle(size: 120, opacity: 0.06),
                ),
                Positioned(
                  top: top + 2,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: context.pagePadding.left,
                        ),
                        child: const GlassBackButton(),
                      ),
                      Expanded(
                        child: Text(
                          AppConstants.profileLabel,
                          textAlign: .center,
                          style: context.titleMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: .w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: context.pagePadding.left + 38),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.pagePadding.left,
            barHeight - _cardOverlap,
            context.pagePadding.right,
            0,
          ),
          child: _ProfileCard(
            roleDisplay: roleDisplay,
            hasOrganization: hasOrganization,
            hasMultiOrgs: hasMultiOrgs,
          ),
        ),
      ],
    );
  }
}

// ─── Profile card: avatar, name, role badge, organization row ────────────────

class _ProfileCard extends StatelessWidget {
  final String roleDisplay;
  final bool hasOrganization;
  final bool hasMultiOrgs;

  const _ProfileCard({
    required this.roleDisplay,
    required this.hasOrganization,
    required this.hasMultiOrgs,
  });

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    }
    if (name.isNotEmpty) return name[0].toUpperCase();
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
          radius: 22,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                crossAxisAlignment: .start,
                children: [
                  // Avatar — tap 5× to switch environment
                  EnvSwitchDetector(
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.accentBlue],
                          begin: .topLeft,
                          end: .bottomRight,
                        ),
                      ),
                      alignment: .center,
                      child: Text(
                        _initials(currentUser.fullName),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: .w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          currentUser.fullName,
                          style: context.titleLarge.copyWith(
                            color: context.textPrimary,
                            fontWeight: .w800,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: context.isDark
                                ? AppColors.navyIconBgDark
                                : context.primary.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Icon(
                                Iconsax.shield_tick,
                                size: 13,
                                color: context.isDark
                                    ? AppColors.navyIconColorDark
                                    : context.primary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                roleDisplay,
                                style: context.labelSmall.copyWith(
                                  color: context.isDark
                                      ? AppColors.navyIconColorDark
                                      : context.primary,
                                  fontWeight: .w700,
                                  fontSize: 12,
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
              if (hasOrganization) ...[
                const SizedBox(height: 16),
                Divider(height: 1, thickness: 1, color: context.navyBorder),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: context.isDark
                            ? AppColors.navyIconBgDark
                            : context.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(9),
                      child: Image.asset(
                        AppIcons.dashboardIcon,
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
                            AppConstants.organizationTitle,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            currentUser.org.name,
                            style: context.bodyMedium.copyWith(
                              fontWeight: .w700,
                              color: context.textPrimary,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (hasMultiOrgs)
                      InkWell(
                        onTap: () =>
                            context.pushNamed(RouteNames.organizationSelection),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Text(
                                AppConstants.switchLabel,
                                style: context.labelMedium.copyWith(
                                  color: context.accentBlue,
                                  fontWeight: .w700,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                size: 18,
                                color: context.accentBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        )
        .animate()
        .slideY(
          begin: 0.15,
          end: 0,
          delay: 40.ms,
          duration: 380.ms,
          curve: Curves.easeOutCubic,
        )
        .fadeIn(delay: 40.ms, duration: 300.ms);
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

// ─── Account card: full name + role rows ──────────────────────────────────────

class _AccountCard extends StatelessWidget {
  const _AccountCard();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 18,
      padding: EdgeInsets.zero,
      shadow: false,
      child: Column(
        children: [
          _AccountRow(
            icon: Iconsax.user,
            iconColor: context.isDark
                ? AppColors.navyIconColorDark
                : context.accentBlue,
            iconBg: context.isDark
                ? AppColors.navyIconBgDark
                : context.accentBlue.withValues(alpha: 0.10),
            label: AppConstants.fullNameLabel,
            value: currentUser.fullName,
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 62,
            color: context.navyBorder,
          ),
          _AccountRow(
            icon: Iconsax.shield_tick,
            iconColor: context.isDark
                ? AppColors.successLight
                : AppColors.success,
            iconBg: context.isDark
                ? AppColors.navyIconBgDark
                : AppColors.success.withValues(alpha: 0.10),
            label: AppConstants.roleLabel,
            value: _roleDisplay,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _AccountRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String label;
  final String value;
  final bool isLast;

  const _AccountRow({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 15, color: iconColor),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: context.bodyMedium.copyWith(color: context.textSecondary),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '—' : value,
              style: context.bodyMedium.copyWith(
                fontWeight: .w700,
                color: context.textPrimary,
              ),
              textAlign: .end,
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Appearance card ──────────────────────────────────────────────────────────

class _AppearanceCard extends StatelessWidget {
  const _AppearanceCard();

  static String _subtitleFor(ThemeMode mode) => switch (mode) {
    ThemeMode.system => AppConstants.appearanceMatchesDeviceSetting,
    ThemeMode.light => AppConstants.appearanceLight,
    ThemeMode.dark => AppConstants.appearanceDark,
  };

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 18,
      padding: const EdgeInsets.all(16),
      shadow: false,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          final mode = themeState.themeMode;
          return Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? AppColors.navyIconBgDark
                          : AppColors.violet.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.contrast_rounded,
                      size: 18,
                      color: context.isDark
                          ? AppColors.navyIconColorDark
                          : AppColors.violet,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          AppConstants.appearanceLabel,
                          style: context.bodyMedium.copyWith(
                            fontWeight: .w700,
                            color: context.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _subtitleFor(mode),
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
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
    (
      ThemeMode.system,
      Icons.desktop_windows_outlined,
      AppConstants.appearanceSystem,
    ),
    (ThemeMode.light, Icons.light_mode_rounded, AppConstants.appearanceLight),
    (ThemeMode.dark, Icons.dark_mode_rounded, AppConstants.appearanceDark),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: context.isDark ? AppColors.navyIconBgDark : context.grey100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          for (final option in _options)
            Expanded(
              child: _SegmentButton(
                icon: option.$2,
                label: option.$3,
                selected: mode == option.$1,
                onTap: () => context.read<ThemeBloc>().add(SetTheme(option.$1)),
              ),
            ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: .opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: selected ? context.navyCard : AppColors.transparent,
          borderRadius: BorderRadius.circular(9),
          boxShadow: selected && !context.isDark
              ? [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Icon(
              icon,
              size: 15,
              color: selected ? context.textPrimary : context.textSecondary,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: context.labelSmall.copyWith(
                fontSize: 12,
                fontWeight: selected ? .w700 : .w500,
                color: selected ? context.textPrimary : context.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Generic action row (used for Log out) ─────────────────────────────────────

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color iconBg;
  final VoidCallback? onTap;
  final bool isLoading;

  const _ActionRow({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconBg,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.transparent,
      borderRadius: .circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(18),
        splashColor: iconColor.withValues(alpha: 0.08),
        highlightColor: iconColor.withValues(alpha: 0.04),
        child: Padding(
          padding: .symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: .circular(12),
                ),
                child: Icon(icon, size: 17, color: iconColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: context.bodyMedium.copyWith(
                    fontWeight: .w700,
                    color: iconColor,
                  ),
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
            Text(
              'Mantic ERP',
              textAlign: .center,
              style: context.labelSmall.copyWith(
                color: context.textSecondary.withValues(alpha: 0.55),
                fontWeight: .w600,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              version,
              textAlign: .center,
              style: context.labelSmall.copyWith(
                color: context.textSecondary.withValues(alpha: 0.40),
                fontSize: 11,
                letterSpacing: 0.2,
              ),
            ),
          ],
        );
      },
    );
  }
}
