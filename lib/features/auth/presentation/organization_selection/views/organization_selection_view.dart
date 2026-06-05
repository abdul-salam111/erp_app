import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../routes/route_names.dart';
import '../../../auth_exports.dart';

class OrganizationSelectionView extends StatelessWidget {
  const OrganizationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BranchSelectionBloc>(),
      child: const _OrganizationSelectionBody(),
    );
  }
}

class _OrganizationSelectionBody extends StatefulWidget {
  const _OrganizationSelectionBody();

  @override
  State<_OrganizationSelectionBody> createState() =>
      _OrganizationSelectionBodyState();
}

class _OrganizationSelectionBodyState
    extends State<_OrganizationSelectionBody> {
  List<UserOrganizationEntity> get _organizations =>
      SessionController.instance.loggedInUser?.organizations ?? [];

  String get _userName =>
      SessionController.instance.loggedInUser?.fullName ?? '';

  void _selectOrganization(UserOrganizationEntity org, int index) {
    context.read<BranchSelectionBloc>().add(
          BranchSelectedEvent(org: org, orgIndex: index),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BranchSelectionBloc, BranchSelectionState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == ApiStatus.SUCCESS) {
          context.pushNamed(RouteNames.dashboard);
        }
        if (state.status == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message ?? 'Failed to select branch');
        }
      },
      builder: (context, state) => Scaffold(
      backgroundColor: context.background,
      body: CustomScrollView(
        slivers: [
          _Header(userName: _userName),
          if (_organizations.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Icon(
                      Iconsax.building_3,
                      size: 56,
                      color: context.textDisabled,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No organizations found.',
                      style: context.bodyMedium.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: context.pagePadding.copyWith(bottom: 32),
              sliver: SliverList.separated(
                itemCount: _organizations.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: context.gridSpacing + 4),
                itemBuilder: (context, index) {
                  final org = _organizations[index];
                  return _OrganizationCard(
                    org: org,
                    index: index,
                    isLoading: state.loadingOrgIndex == index,
                    isDisabled: state.loadingOrgIndex != null,
                    onTap: () => _selectOrganization(org, index),
                  );
                },
              ),
            ),
        ],
      ),
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
            colors: [
              context.primary,
              context.primary.withValues(alpha: 0.75),
            ],
            begin: .topLeft,
            end: .bottomRight,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.pagePadding.left,
              24,
              context.pagePadding.right,
              32,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Iconsax.buildings,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 20),
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
                  'Select Organization',
                  style: context.headlineSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: .w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose the organization you want to work with.',
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

class _OrganizationCard extends StatelessWidget {
  final UserOrganizationEntity org;
  final int index;
  final bool isLoading;
  final bool isDisabled;
  final VoidCallback onTap;

  const _OrganizationCard({
    required this.org,
    required this.index,
    required this.isLoading,
    required this.isDisabled,
    required this.onTap,
  });

  static const List<Color> _avatarColors = [
    AppColors.primary,
    AppColors.deepPurple,
    AppColors.teal,
    AppColors.errorBright,
    AppColors.amber,
    AppColors.cyan,
  ];

  Color get _accentColor => _avatarColors[index % _avatarColors.length];

  String get _initials {
    final name = org.name ?? '';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (name.isNotEmpty) {
      return name[0].toUpperCase();
    }
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    final branchCount = org.branches.length;

    return AnimatedOpacity(
      opacity: isDisabled && !isLoading ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.border),
              boxShadow: [
                BoxShadow(
                  color: context.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: _accentColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            _initials,
                            style: context.titleMedium.copyWith(
                              color: _accentColor,
                              fontWeight: .w700,
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
                              org.name ?? '',
                              style: context.titleSmall.copyWith(
                                fontWeight: .w600,
                              ),
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                            if (org.tenantName != null) ...[
                              const SizedBox(height: 3),
                              Text(
                                org.tenantName!,
                                style: context.bodySmall.copyWith(
                                  color: context.textSecondary,
                                ),
                                maxLines: 1,
                                overflow: .ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (isLoading)
                        SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor:
                                AlwaysStoppedAnimation(_accentColor),
                          ),
                        )
                      else
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: _accentColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Iconsax.arrow_right_3,
                            color: _accentColor,
                            size: 16,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: context.background,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      if (org.productName != null)
                        _Chip(
                          icon: Iconsax.box,
                          label: org.productName!,
                          color: _accentColor,
                        ),
                      if (org.productName != null &&
                          (org.countryName != null || branchCount > 0))
                        const SizedBox(width: 8),
                      if (org.countryName != null)
                        _Chip(
                          icon: Iconsax.global,
                          label: org.countryName!,
                          color: context.textSecondary,
                        ),
                      if (org.countryName != null && branchCount > 0)
                        const SizedBox(width: 8),
                      if (branchCount > 0)
                        _Chip(
                          icon: Iconsax.location,
                          label:
                              '$branchCount ${branchCount == 1 ? 'Branch' : 'Branches'}',
                          color: context.textSecondary,
                        ),
                    ],
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

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _Chip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: context.labelSmall.copyWith(color: color),
          maxLines: 1,
          overflow: .ellipsis,
        ),
      ],
    );
  }
}
