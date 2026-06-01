import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/di/di_exports.dart';
import '../../../../core/services/current_user.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../routes/route_names.dart';
import '../../profile_exports.dart';

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

  @override
  Widget build(BuildContext context) {
    final orgs = SessionController.instance.loggedInUser?.organizations ?? [];
    final hasMultiOrgs = orgs.length > 1;

    return Scaffold(
      backgroundColor: context.background,
      body: CustomScrollView(
        slivers: [
          _ProfileHeader(),
          SliverPadding(
            padding: context.pagePadding.copyWith(top: 24, bottom: 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── Personal Info ──────────────────────────────────
                _SectionCard(
                  title: 'Personal Information',
                  iconData: Iconsax.profile_circle,
                  children: [
                    _InfoRow(
                      icon: Iconsax.user,
                      label: 'Full Name',
                      value: currentUser.fullName,
                    ),
                    _InfoRow(
                      icon: Iconsax.sms,
                      label: 'Email',
                      value: currentUser.email,
                    ),
                    if (currentUser.id != null)
                      _InfoRow(
                        icon: Iconsax.tag,
                        label: 'User ID',
                        value: '#${currentUser.id}',
                        isLast: true,
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                // ── Organization Info ──────────────────────────────
                _SectionCard(
                  title: 'Organization',
                  iconData: Iconsax.buildings,
                  children: [
                    _InfoRow(
                      icon: Iconsax.building_3,
                      label: 'Name',
                      value: currentUser.org.name,
                    ),
                    if (currentUser.org.tenantName.isNotEmpty)
                      _InfoRow(
                        icon: Iconsax.building_4,
                        label: 'Tenant',
                        value: currentUser.org.tenantName,
                      ),
                    if (currentUser.org.productName.isNotEmpty)
                      _InfoRow(
                        icon: Iconsax.box,
                        label: 'Product',
                        value: currentUser.org.productName,
                      ),
                    if (currentUser.org.countryName.isNotEmpty)
                      _InfoRow(
                        icon: Iconsax.global,
                        label: 'Country',
                        value: currentUser.org.countryName,
                      ),
                    _InfoRow(
                      icon: Iconsax.money,
                      label: 'Currency',
                      value:
                          '${currentUser.org.currencyCode}  (${currentUser.org.currencySymbol})',
                      isLast: true,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ── Switch organization ────────────────────────────
                if (hasMultiOrgs) ...[
                  _SwitchOrgCard(
                    onTap: () =>
                        context.pushNamed(RouteNames.organizationSelection),
                  ),
                  const SizedBox(height: 16),
                ],

                // ── Logout ─────────────────────────────────────────
                _LogoutCard(
                  onTap: () async {
                    await SessionController.instance.clearSession();
                    if (context.mounted) context.goNamed(RouteNames.signin);
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final initials = _initials(currentUser.fullName);

    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        clipBehavior: .hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.primary, context.primary.withValues(alpha: 0.75)],
            begin: .topLeft,
            end: .bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Decorative circles
            Positioned(
              right: -40,
              top: top - 10,
              child: _Circle(size: 140, opacity: 0.07),
            ),
            Positioned(
              right: 60,
              top: top + 20,
              child: _Circle(size: 60, opacity: 0.05),
            ),
            Positioned(
              left: -30,
              bottom: -30,
              child: _Circle(size: 100, opacity: 0.06),
            ),

            // Content
            Padding(
              padding: EdgeInsets.only(
                top: top + 12,
                bottom: 36,
                left: context.pagePadding.left,
                right: context.pagePadding.right,
              ),
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  // Back button row
                  Align(
                    alignment: .topLeft,
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        padding: .all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: .circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Avatar
                  Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: Colors.white.withValues(alpha: 0.20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.45),
                        width: 2.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Name
                  Text(
                    currentUser.fullName,
                    style: context.titleMedium.copyWith(
                      color: Colors.white,
                      fontWeight: .w700,
                    ),
                    textAlign: .center,
                  ),
                  const SizedBox(height: 6),

                  // Email
                  Text(
                    currentUser.email,
                    style: context.bodySmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.80),
                    ),
                    textAlign: .center,
                  ),
                  const SizedBox(height: 12),

                  // Org badge
                  Container(
                    padding: .symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: .circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.30),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(
                          Iconsax.buildings,
                          color: Colors.white.withValues(alpha: 0.90),
                          size: 13,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          currentUser.org.name,
                          style: context.labelSmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.95),
                            fontWeight: .w600,
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
      ),
    );
  }

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    } else if (name.isNotEmpty) {
      return name[0].toUpperCase();
    }
    return '?';
  }
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
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Card header
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
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: context.grey50,
                  borderRadius: .circular(8),
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
                      ),
                    ),
                    const SizedBox(height: 2),
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
            indent: 60,
            endIndent: 0,
            color: context.border,
          ),
      ],
    );
  }
}

// ─── Switch org card ──────────────────────────────────────────────────────────

class _SwitchOrgCard extends StatelessWidget {
  final VoidCallback onTap;
  const _SwitchOrgCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.white,
      borderRadius: .circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(16),
        child: Container(
          padding: .symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: .circular(16),
            border: Border.all(color: context.primary.withValues(alpha: 0.30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: .all(10),
                decoration: BoxDecoration(
                  color: context.primary.withValues(alpha: 0.10),
                  borderRadius: .circular(12),
                ),
                child: Icon(Iconsax.refresh, size: 18, color: context.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Switch Organization',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.primary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Change to a different organization',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: context.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Logout card ──────────────────────────────────────────────────────────────

class _LogoutCard extends StatelessWidget {
  final VoidCallback onTap;
  const _LogoutCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.error.withValues(alpha: 0.06),
      borderRadius: .circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(16),
        child: Container(
          padding: .symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: .circular(16),
            border: Border.all(color: context.error.withValues(alpha: 0.20)),
          ),
          child: Row(
            children: [
              Container(
                padding: .all(10),
                decoration: BoxDecoration(
                  color: context.error.withValues(alpha: 0.12),
                  borderRadius: .circular(12),
                ),
                child: Icon(Iconsax.logout, size: 18, color: context.error),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Log Out',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.error,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sign out of your account',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: context.error,
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
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}
