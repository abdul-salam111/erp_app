import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../../core/widgets/glass_surface.dart';

class NewUserView extends StatefulWidget {
  const NewUserView({super.key});

  @override
  State<NewUserView> createState() => _NewUserViewState();
}

class _NewUserViewState extends State<NewUserView> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _designationCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  _Gender _gender = _Gender.male;
  _LandingChoice _landing = _LandingChoice.dashboard;
  final Set<String> _selectedRoles = <String>{};

  static const _mainRoles = <_Role>[
    _Role('Admin', Iconsax.crown, AppColors.orange),
    _Role('Control Panel Admin', Iconsax.setting_2, AppColors.primary),
    _Role('Junior Accountant', Iconsax.calculator, AppColors.teal),
    _Role('Production', Iconsax.buildings_2, AppColors.purple),
    _Role('Gate and Weight', Iconsax.truck, AppColors.deepPurple),
    _Role('GRN Store Clerk', Iconsax.box, AppColors.tealDark),
    _Role('Lab', Iconsax.health, AppColors.green),
    _Role('Cashier', Iconsax.money, AppColors.brown),
    _Role('Auditor', Iconsax.security_user, AppColors.blueGrey),
    _Role('CFO', Iconsax.chart_2, AppColors.primaryDark),
    _Role('Manager', Iconsax.user_octagon, AppColors.errorBright),
  ];

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _designationCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
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
    if (_passwordCtrl.text != _confirmPasswordCtrl.text) {
      AppToastsUtils.showInfoTop(context, 'Passwords do not match');
      return;
    }
    AppToastsUtils.showInfoTop(context, 'User saved — coming soon');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'New User'),
      body: SafeArea(
        top: false,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: context.pagePadding.copyWith(top: 16, bottom: 120),
            children: [
              _ProfileHero(
                gender: _gender,
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
                    CustomTextFormField(
                      controller: _firstNameCtrl,
                      label: 'First Name',
                      hintText: 'Enter first name',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Required'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      controller: _lastNameCtrl,
                      label: 'Last Name',
                      hintText: 'Enter last name',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Required'
                          : null,
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
                      controller: _designationCtrl,
                      label: 'Designation',
                      hintText: 'e.g. Manager',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Required'
                          : null,
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 400.ms)
                  .slideY(begin: 0.15, curve: Curves.easeOutCubic),
              const SizedBox(height: 14),
              _SectionCard(
                icon: Iconsax.lock_1,
                iconColor: AppColors.teal,
                title: 'Security',
                trailing: _RandomChip(onTap: _generateRandomPassword),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    CustomTextFormField(
                      controller: _passwordCtrl,
                      label: 'Password',
                      hintText: 'Enter password',
                      obscureText: true,
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      validator: (v) {
                        final s = v ?? '';
                        if (s.isEmpty) return 'Required';
                        if (s.length < 6) return 'Min 6 characters';
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      controller: _confirmPasswordCtrl,
                      label: 'Confirm Password',
                      hintText: 'Re-enter password',
                      obscureText: true,
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Required'
                          : null,
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 400.ms)
                  .slideY(begin: 0.15, curve: Curves.easeOutCubic),
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
                            onTap: () => setState(
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
                            onTap: () =>
                                setState(() => _landing = _LandingChoice.custom),
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
                              child: _LandingPagesDropdown(),
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
                  '${_selectedRoles.length} selected',
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
                    for (int i = 0; i < _mainRoles.length; i++) ...[
                      _RoleTile(
                        role: _mainRoles[i],
                        selected: _selectedRoles.contains(_mainRoles[i].label),
                        onTap: () => setState(() {
                          final label = _mainRoles[i].label;
                          if (_selectedRoles.contains(label)) {
                            _selectedRoles.remove(label);
                          } else {
                            _selectedRoles.add(label);
                          }
                        }),
                      ),
                      if (i < _mainRoles.length - 1)
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
          ),
        ),
      ),
      bottomNavigationBar: _BottomBar(onCancel: () => context.pop(), onSave: _save),
    );
  }
}

class _ProfileHero extends StatelessWidget {
  final _Gender gender;
  final ValueChanged<_Gender> onGenderChanged;

  const _ProfileHero({required this.gender, required this.onGenderChanged});

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        children: [
          _AvatarPicker(gender: gender),
          const SizedBox(height: 14),
          _GenderToggle(gender: gender, onChanged: onGenderChanged),
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

  const _GenderToggle({required this.gender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.isDark ? context.navyIconBg : context.grey100,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: context.isDark ? context.navyBorder : context.border),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          _GenderPill(
            label: 'Male',
            icon: Iconsax.user,
            color: context.primary,
            selected: gender == _Gender.male,
            onTap: () => onChanged(_Gender.male),
          ),
          const SizedBox(width: 4),
          _GenderPill(
            label: 'Female',
            icon: Iconsax.user_octagon,
            color: AppColors.purple,
            selected: gender == _Gender.female,
            onTap: () => onChanged(_Gender.female),
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
  final VoidCallback onTap;

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
  final VoidCallback onTap;

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

class _LandingPagesDropdown extends StatefulWidget {
  @override
  State<_LandingPagesDropdown> createState() => _LandingPagesDropdownState();
}

class _LandingPagesDropdownState extends State<_LandingPagesDropdown> {
  static const _pages = [
    'Sale Order',
    'Purchase Order',
    'Inventory',
    'Credit Management',
    'Attendance',
    'Bank & Cash',
  ];
  String? _value;

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
          onTap: _showPicker,
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
                    _value ?? 'Select landing page',
                    style: context.bodySmall.copyWith(
                      color: _value == null
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

  Future<void> _showPicker() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.transparent,
      builder: (ctx) => Container(
        margin: const EdgeInsets.all(12),
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
                for (final p in _pages)
                  ListTile(
                    onTap: () => Navigator.of(ctx).pop(p),
                    dense: true,
                    leading: Icon(
                      Iconsax.arrow_right_3,
                      size: 14,
                      color: context.textSecondary,
                    ),
                    title: Text(
                      p,
                      style: context.bodySmall.copyWith(
                        color: context.textPrimary,
                        fontWeight: p == _value ? .w700 : .w500,
                      ),
                    ),
                    trailing: p == _value
                        ? Icon(Iconsax.tick_circle,
                            size: 16, color: context.primary)
                        : null,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    if (selected != null) setState(() => _value = selected);
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
  final _Role role;
  final bool selected;
  final VoidCallback onTap;

  const _RoleTile({
    required this.role,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                borderRadius: BorderRadius.circular(10),
                gradient: context.isDark
                    ? RadialGradient(
                        colors: [
                          role.color.withValues(alpha: 0.28),
                          role.color.withValues(alpha: 0.06),
                        ],
                      )
                    : null,
                color: context.isDark
                    ? null
                    : role.color.withValues(alpha: 0.10),
              ),
              child: Icon(role.icon, color: role.color, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                role.label,
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

  const _BottomBar({required this.onCancel, required this.onSave});

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
                      'Save User',
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

class _Role {
  final String label;
  final IconData icon;
  final Color color;
  const _Role(this.label, this.icon, this.color);
}
