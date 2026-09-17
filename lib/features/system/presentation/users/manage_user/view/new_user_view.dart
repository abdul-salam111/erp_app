import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../../../core/di/di_exports.dart';
import '../../../../../../core/services/current_user.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../../../../core/widgets/custom_textfield.dart';
import '../../../../../../core/widgets/glass_surface.dart';
import '../../../../../../core/widgets/shimmer_box.dart';
import '../../../../domain/entities/system_entity.dart';
import '../bloc/new_user_bloc.dart';
import '../bloc/new_user_event.dart';
import '../bloc/new_user_state.dart';

enum UserFormMode { create, edit, view }

class NewUserView extends StatelessWidget {
  final UserFormMode mode;
  final int? userId;

  const NewUserView({
    super.key,
    this.mode = UserFormMode.create,
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final tenantId = currentUser.org.misTenantId ?? 0;
    return BlocProvider<NewUserBloc>(
      create: (_) => sl<NewUserBloc>()
        ..add(NewUserFormLoaded(tenantId: tenantId, userId: userId)),
      child: _NewUserFormBody(mode: mode, userId: userId),
    );
  }
}

class _NewUserFormBody extends StatefulWidget {
  final UserFormMode mode;
  final int? userId;

  const _NewUserFormBody({required this.mode, this.userId});

  @override
  State<_NewUserFormBody> createState() => _NewUserFormBodyState();
}

class _NewUserFormBodyState extends State<_NewUserFormBody> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _designationCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  _Gender _gender = _Gender.male;
  _LandingChoice _landing = _LandingChoice.dashboard;
  int? _selectedLandingPageId;
  final Set<int> _selectedRoleIds = <int>{};
  bool _prefilled = false;

  bool get _readOnly => widget.mode == UserFormMode.view;

  String get _title {
    switch (widget.mode) {
      case UserFormMode.create:
        return 'New User';
      case UserFormMode.edit:
        return 'Edit User';
      case UserFormMode.view:
        return 'User Details';
    }
  }

  String get _saveLabel {
    switch (widget.mode) {
      case UserFormMode.create:
        return 'Save User';
      case UserFormMode.edit:
        return 'Update User';
      case UserFormMode.view:
        return '';
    }
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _designationCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  String _pickPhone(List<UserContactNumberEntity> numbers) {
    if (numbers.isEmpty) return '';
    final mobile = numbers.firstWhere(
      (n) => n.isMobile,
      orElse: () => numbers.first,
    );
    return mobile.international ??
        mobile.e164 ??
        mobile.national ??
        '';
  }

  void _prefill(SystemUserDetailEntity u) {
    _firstNameCtrl.text = u.firstName;
    _lastNameCtrl.text = u.lastName;
    _emailCtrl.text = u.email;
    _phoneCtrl.text = _pickPhone(u.contactNumbers);
    _designationCtrl.text = u.designation;
    _gender = (u.gender ?? '').toUpperCase() == 'F' ? _Gender.female : _Gender.male;
    _landing = u.isDashboardLandingPage
        ? _LandingChoice.dashboard
        : _LandingChoice.custom;
    _selectedLandingPageId = u.landingPageFeatureId;
    _selectedRoleIds
      ..clear()
      ..addAll(u.roles
          .map((r) => r.roleId)
          .where((id) => id != null)
          .cast<int>());
    _prefilled = true;
    setState(() {});
  }

  void _generateRandomPassword() {
    const chars =
        'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789!@#\$%';
    final rand = DateTime.now().microsecondsSinceEpoch;
    final buffer = StringBuffer();
    for (int i = 0; i < 12; i++) {
      buffer.write(chars[(rand + i * 31) % chars.length]);
    }
    final pw = buffer.toString();
    _passwordCtrl.text = pw;
    _confirmPasswordCtrl.text = pw;
    AppToastsUtils.showInfoTop(context, 'Random password generated');
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      AppToastsUtils.showInfoTop(context, 'Please fix the errors above');
      return;
    }
    if (widget.mode == UserFormMode.create &&
        _passwordCtrl.text != _confirmPasswordCtrl.text) {
      AppToastsUtils.showInfoTop(context, 'Passwords do not match');
      return;
    }
    AppToastsUtils.showInfoTop(context, 'User saved — coming soon');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewUserBloc, NewUserState>(
      listenWhen: (p, c) =>
          p.userDetail != c.userDetail && c.userDetail != null && !_prefilled,
      listener: (context, state) => _prefill(state.userDetail!),
      builder: (context, state) {
        final isLoading = state.apiStatus == ApiStatus.LOADING;
        final showForm = state.apiStatus == ApiStatus.SUCCESS ||
            state.apiStatus == ApiStatus.INITIAL;
        return Scaffold(
          backgroundColor: context.background,
          appBar: CustomAppBar(title: _title),
          body: SafeArea(
            top: false,
            child: isLoading
                ? const _NewUserFormShimmer()
                : state.apiStatus == ApiStatus.FAILURE
                    ? _ErrorRetry(
                        message: state.message ?? 'Failed to load form',
                        onRetry: () {
                          final tenantId = currentUser.org.misTenantId ?? 0;
                          context.read<NewUserBloc>().add(
                                NewUserFormLoaded(
                                  tenantId: tenantId,
                                  userId: widget.userId,
                                ),
                              );
                        },
                      )
                    : showForm
                        ? Form(
                            key: _formKey,
                            child: _buildFormList(context, state),
                          )
                        : const SizedBox.shrink(),
          ),
          bottomNavigationBar: _readOnly
              ? null
              : _BottomBar(
                  onCancel: () => context.pop(),
                  onSave: _save,
                  saveLabel: _saveLabel,
                ),
        );
      },
    );
  }

  Widget _buildFormList(BuildContext context, NewUserState state) {
    return ListView(
      padding: context.pagePadding.copyWith(top: 16, bottom: 120),
      children: [
        _ProfileHero(
          gender: _gender,
          readOnly: _readOnly,
          onGenderChanged: (g) => setState(() => _gender = g),
        )
            .animate()
            .fadeIn(duration: 400.ms)
            .slideY(begin: 0.15, curve: Curves.easeOutCubic),
        const SizedBox(height: 14),
        _SectionCard(
          icon: Iconsax.user,
          iconColor: context.primary,
          title: 'Personal Info',
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _firstNameCtrl,
                      label: 'First Name',
                      hintText: 'Enter first name',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      readOnly: _readOnly,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _lastNameCtrl,
                      label: 'Last Name',
                      hintText: 'Enter last name',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      readOnly: _readOnly,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _emailCtrl,
                label: 'Email',
                hintText: 'name@company.com',
                isRequired: true,
                boldLabel: true,
                labelFontSize: 13,
                fieldHeight: 48,
                keyboardType: TextInputType.emailAddress,
                readOnly: _readOnly,
                validator: (v) {
                  final s = v?.trim() ?? '';
                  if (s.isEmpty) return 'Required';
                  if (!s.contains('@') || !s.contains('.')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _phoneCtrl,
                label: 'Phone Number',
                hintText: 'e.g. +92 300 1234567',
                boldLabel: true,
                labelFontSize: 13,
                fieldHeight: 48,
                keyboardType: TextInputType.phone,
                readOnly: _readOnly,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _designationCtrl,
                label: 'Designation',
                hintText: 'e.g. Manager',
                isRequired: true,
                boldLabel: true,
                labelFontSize: 13,
                fieldHeight: 48,
                readOnly: _readOnly,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 400.ms)
            .slideY(begin: 0.15, curve: Curves.easeOutCubic),
        if (!_readOnly) ...[
          const SizedBox(height: 14),
          _SectionCard(
            icon: Iconsax.lock_1,
            iconColor: AppColors.teal,
            title: 'Security',
            trailing: _RandomChip(onTap: _generateRandomPassword),
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _passwordCtrl,
                    label: 'Password',
                    hintText: 'Enter password',
                    obscureText: true,
                    isRequired: widget.mode == UserFormMode.create,
                    boldLabel: true,
                    labelFontSize: 13,
                    fieldHeight: 48,
                    validator: (v) {
                      final s = v ?? '';
                      if (widget.mode == UserFormMode.create) {
                        if (s.isEmpty) return 'Required';
                        if (s.length < 6) return 'Min 6 characters';
                        return null;
                      }
                      if (s.isNotEmpty && s.length < 6) {
                        return 'Min 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextFormField(
                    controller: _confirmPasswordCtrl,
                    label: 'Confirm Password',
                    hintText: 'Re-enter password',
                    obscureText: true,
                    isRequired: widget.mode == UserFormMode.create,
                    boldLabel: true,
                    labelFontSize: 13,
                    fieldHeight: 48,
                    validator: (v) {
                      if (widget.mode == UserFormMode.create &&
                          (v == null || v.isEmpty)) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms)
              .slideY(begin: 0.15, curve: Curves.easeOutCubic),
        ],
        const SizedBox(height: 14),
        _SectionCard(
          icon: Iconsax.home_2,
          iconColor: AppColors.purple,
          title: 'Landing Page',
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _LandingCard(
                      title: 'Dashboard',
                      subtitle: 'Role dashboard',
                      icon: Iconsax.category,
                      selected: _landing == _LandingChoice.dashboard,
                      onTap: _readOnly
                          ? null
                          : () => setState(
                                () => _landing = _LandingChoice.dashboard,
                              ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _LandingCard(
                      title: 'Custom Page',
                      subtitle: 'Specific screen',
                      icon: Iconsax.grid_1,
                      selected: _landing == _LandingChoice.custom,
                      onTap: _readOnly
                          ? null
                          : () => setState(
                                () => _landing = _LandingChoice.custom,
                              ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                alignment: .topCenter,
                child: _landing == _LandingChoice.custom
                    ? Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: _LandingPagesDropdown(
                          landingPages: state.landingPages,
                          selectedId: _selectedLandingPageId,
                          readOnly: _readOnly,
                          onChanged: (id) =>
                              setState(() => _selectedLandingPageId = id),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 400.ms)
            .slideY(begin: 0.15, curve: Curves.easeOutCubic),
        const SizedBox(height: 14),
        _SectionCard(
          icon: Iconsax.security_user,
          iconColor: AppColors.orange,
          title: 'Role & Access',
          trailing: Text(
            '${_selectedRoleIds.length} selected',
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontWeight: .w600,
              fontSize: 11,
            ),
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              _MainDivider(label: 'Main'),
              const SizedBox(height: 8),
              if (state.availableRoles.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'No roles available',
                      style: context.bodySmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ),
                )
              else
                for (int i = 0; i < state.availableRoles.length; i++) ...[
                  _RoleTile(
                    role: state.availableRoles[i],
                    selected:
                        _selectedRoleIds.contains(state.availableRoles[i].id),
                    onTap: _readOnly
                        ? null
                        : () => setState(() {
                              final id = state.availableRoles[i].id;
                              if (_selectedRoleIds.contains(id)) {
                                _selectedRoleIds.remove(id);
                              } else {
                                _selectedRoleIds.add(id);
                              }
                            }),
                  ),
                  if (i < state.availableRoles.length - 1)
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: context.divider.withValues(alpha: 0.5),
                    ),
                ],
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 400.ms)
            .slideY(begin: 0.15, curve: Curves.easeOutCubic),
      ],
    );
  }
}

// ─── Loading / Error ────────────────────────────────────────────────────────

class _NewUserFormShimmer extends StatelessWidget {
  const _NewUserFormShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.pagePadding.copyWith(top: 16, bottom: 120),
      children: [
        const ShimmerBox(height: 160, radius: 16),
        const SizedBox(height: 14),
        const ShimmerBox(height: 260, radius: 14),
        const SizedBox(height: 14),
        const ShimmerBox(height: 180, radius: 14),
        const SizedBox(height: 14),
        const ShimmerBox(height: 360, radius: 14),
      ],
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorRetry({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(Iconsax.warning_2, size: 40, color: context.textSecondary),
            const SizedBox(height: 12),
            Text(
              message,
              style: context.bodyMedium.copyWith(color: context.textSecondary),
              textAlign: .center,
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Iconsax.refresh, size: 16),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Widgets below preserve the original design ─────────────────────────────

class _ProfileHero extends StatelessWidget {
  final _Gender gender;
  final bool readOnly;
  final ValueChanged<_Gender> onGenderChanged;

  const _ProfileHero({
    required this.gender,
    required this.readOnly,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        children: [
          _AvatarPicker(gender: gender),
          const SizedBox(height: 14),
          _GenderToggle(
            gender: gender,
            onChanged: readOnly ? (_) {} : onGenderChanged,
            enabled: !readOnly,
          ),
        ],
      ),
    );
  }
}

class _AvatarPicker extends StatelessWidget {
  final _Gender gender;
  const _AvatarPicker({required this.gender});

  @override
  Widget build(BuildContext context) {
    final color = gender == _Gender.male ? context.primary : AppColors.purple;
    return Stack(
      clipBehavior: .none,
      alignment: .center,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: .circle,
            gradient: RadialGradient(
              colors: [
                color.withValues(alpha: 0.28),
                color.withValues(alpha: 0.06),
              ],
            ),
            border: Border.all(color: color.withValues(alpha: 0.35), width: 1),
          ),
          child: Icon(
            gender == _Gender.male ? Iconsax.user : Iconsax.user_octagon,
            color: color,
            size: 42,
          ),
        ),
        Positioned(
          bottom: -4,
          right: -4,
          child: Material(
            color: color,
            shape: const CircleBorder(),
            elevation: 3,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => AppToastsUtils.showInfoTop(
                context,
                'Photo upload — coming soon',
              ),
              child: Container(
                width: 32,
                height: 32,
                alignment: .center,
                child: const Icon(
                  Iconsax.camera,
                  color: AppColors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GenderToggle extends StatelessWidget {
  final _Gender gender;
  final ValueChanged<_Gender> onChanged;
  final bool enabled;

  const _GenderToggle({
    required this.gender,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.isDark ? context.navyIconBg : context.grey100,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: context.isDark ? context.navyBorder : context.border,
        ),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          _GenderPill(
            label: 'Male',
            icon: Iconsax.user,
            color: context.primary,
            selected: gender == _Gender.male,
            onTap: enabled ? () => onChanged(_Gender.male) : null,
          ),
          const SizedBox(width: 4),
          _GenderPill(
            label: 'Female',
            icon: Iconsax.user_octagon,
            color: AppColors.purple,
            selected: gender == _Gender.female,
            onTap: enabled ? () => onChanged(_Gender.female) : null,
          ),
        ],
      ),
    );
  }
}

class _GenderPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback? onTap;

  const _GenderPill({
    required this.label,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      child: Material(
        color: selected ? color : AppColors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  icon,
                  size: 14,
                  color: selected ? AppColors.white : context.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: context.labelMedium.copyWith(
                    color: selected ? AppColors.white : context.textSecondary,
                    fontWeight: selected ? .w700 : .w500,
                    fontSize: 13,
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

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget child;
  final Widget? trailing;

  const _SectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 14,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                alignment: .center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: context.isDark
                      ? RadialGradient(
                          colors: [
                            iconColor.withValues(alpha: 0.28),
                            iconColor.withValues(alpha: 0.06),
                          ],
                        )
                      : null,
                  color: context.isDark
                      ? null
                      : iconColor.withValues(alpha: 0.10),
                ),
                child: Icon(icon, color: iconColor, size: 17),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: context.titleSmall.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _RandomChip extends StatelessWidget {
  final VoidCallback onTap;

  const _RandomChip({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.teal.withValues(alpha: context.isDark ? 0.14 : 0.10),
          border: Border.all(color: AppColors.teal.withValues(alpha: 0.30)),
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            Icon(Iconsax.magic_star, size: 12, color: AppColors.teal),
            const SizedBox(width: 4),
            Text(
              'Random',
              style: context.labelSmall.copyWith(
                color: AppColors.teal,
                fontWeight: .w700,
                fontSize: 11,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LandingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  const _LandingCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? context.primary
        : (context.isDark ? context.navyBorder : context.border);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: selected
            ? context.primary.withValues(alpha: context.isDark ? 0.14 : 0.07)
            : (context.isDark ? context.navyIconBg : context.surfaceElevated),
        border: Border.all(color: borderColor, width: selected ? 1.5 : 1),
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                _RadioMark(selected: selected),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        title,
                        style: context.bodySmall.copyWith(
                          fontWeight: .w700,
                          color: selected
                              ? context.primary
                              : context.textPrimary,
                          fontSize: 12.5,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 10.5,
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
        ),
      ),
    );
  }
}

class _RadioMark extends StatelessWidget {
  final bool selected;
  const _RadioMark({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      alignment: .center,
      decoration: BoxDecoration(
        shape: .circle,
        border: Border.all(
          color: selected ? context.primary : context.textSecondary,
          width: 1.5,
        ),
      ),
      child: selected
          ? Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: context.primary,
                shape: .circle,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _LandingPagesDropdown extends StatelessWidget {
  final List<LandingPageFeatureEntity> landingPages;
  final int? selectedId;
  final bool readOnly;
  final ValueChanged<int?> onChanged;

  const _LandingPagesDropdown({
    required this.landingPages,
    required this.selectedId,
    required this.readOnly,
    required this.onChanged,
  });

  String? get _selectedLabel {
    if (selectedId == null) return null;
    final match = landingPages.where((p) => p.id == selectedId).toList();
    return match.isEmpty ? null : match.first.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Landing Page',
                style: context.bodySmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 13,
                  fontWeight: .w600,
                ),
              ),
              TextSpan(
                text: ' *',
                style: context.bodyMedium.copyWith(
                  color: context.error,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: readOnly ? null : () => _showPicker(context),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: context.isDark ? context.navyIconBg : context.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: context.isDark ? context.navyBorder : context.border,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedLabel ?? 'Select landing page',
                    style: context.bodySmall.copyWith(
                      color: _selectedLabel == null
                          ? context.textSecondary
                          : context.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  Iconsax.arrow_down_1,
                  size: 16,
                  color: context.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showPicker(BuildContext context) async {
    final selected = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        margin: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(ctx).height * 0.6,
        ),
        child: GlassSurface(
          radius: 16,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: .min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: context.textSecondary.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(Iconsax.home_2, size: 16, color: context.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Select Landing Page',
                        style: context.titleSmall.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: ListView.builder(
                    padding: .zero,
                    shrinkWrap: true,
                    itemCount: landingPages.length,
                    itemBuilder: (_, i) {
                      final p = landingPages[i];
                      return ListTile(
                        onTap: () => Navigator.of(ctx).pop(p.id),
                        dense: true,
                        leading: Icon(
                          Iconsax.arrow_right_3,
                          size: 14,
                          color: context.textSecondary,
                        ),
                        title: Text(
                          p.name,
                          style: context.bodySmall.copyWith(
                            color: context.textPrimary,
                            fontWeight:
                                p.id == selectedId ? .w700 : .w500,
                          ),
                        ),
                        subtitle: p.moduleName == null
                            ? null
                            : Text(
                                p.moduleName!,
                                style: context.labelSmall.copyWith(
                                  color: context.textSecondary,
                                  fontSize: 10.5,
                                ),
                              ),
                        trailing: p.id == selectedId
                            ? Icon(Iconsax.tick_circle,
                                size: 16, color: context.primary)
                            : null,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (selected != null) onChanged(selected);
  }
}

class _MainDivider extends StatelessWidget {
  final String label;
  const _MainDivider({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: context.divider.withValues(alpha: 0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label.toUpperCase(),
            style: context.labelSmall.copyWith(
              color: context.primary,
              fontWeight: .w700,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: context.divider.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}

class _RoleTile extends StatelessWidget {
  final RoleEntity role;
  final bool selected;
  final VoidCallback? onTap;

  const _RoleTile({
    required this.role,
    required this.selected,
    required this.onTap,
  });

  String get _initials {
    final words = role.name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2 && words[0].isNotEmpty && words[1].isNotEmpty) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return role.name.isNotEmpty ? role.name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    final color =
        _paletteFor(role.id, context.primary);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            Container(
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
                color: context.isDark
                    ? null
                    : color.withValues(alpha: 0.15),
              ),
              child: Text(
                _initials,
                style: context.labelSmall.copyWith(
                  color: color,
                  fontWeight: .w800,
                  fontSize: 11,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                role.name,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontWeight: selected ? .w700 : .w500,
                  fontSize: 13,
                ),
              ),
            ),
            _CheckMark(selected: selected),
          ],
        ),
      ),
    );
  }

  static Color _paletteFor(int id, Color fallback) {
    const palette = [
      AppColors.primary,
      AppColors.teal,
      AppColors.purple,
      AppColors.orange,
      AppColors.green,
      AppColors.deepPurple,
      AppColors.tealDark,
      AppColors.brown,
      AppColors.errorBright,
      AppColors.blueGrey,
    ];
    if (id <= 0) return fallback;
    return palette[id.abs() % palette.length];
  }
}

class _CheckMark extends StatelessWidget {
  final bool selected;
  const _CheckMark({required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
      width: 22,
      height: 22,
      alignment: .center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: selected ? context.primary : AppColors.transparent,
        border: Border.all(
          color: selected ? context.primary : context.textSecondary,
          width: 1.5,
        ),
      ),
      child: selected
          ? const Icon(Icons.check_rounded, size: 14, color: AppColors.white)
          : const SizedBox.shrink(),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final String saveLabel;

  const _BottomBar({
    required this.onCancel,
    required this.onSave,
    required this.saveLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onCancel,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  side: BorderSide(
                    color: context.isDark ? context.navyBorder : context.border,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
              flex: 2,
              child: ElevatedButton(
                onPressed: onSave,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: context.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    const Icon(Iconsax.tick_circle, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      saveLabel,
                      style: context.labelMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: .w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _Gender { male, female }

enum _LandingChoice { dashboard, custom }
