import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../../core/widgets/glass_surface.dart';

class NewRoleView extends StatefulWidget {
  const NewRoleView({super.key});

  @override
  State<NewRoleView> createState() => _NewRoleViewState();
}

class _NewRoleViewState extends State<NewRoleView> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _systemKeyCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _displayOrderCtrl = TextEditingController();

  bool _systemKeyEdited = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl.addListener(_syncSystemKey);
  }

  @override
  void dispose() {
    _nameCtrl.removeListener(_syncSystemKey);
    _nameCtrl.dispose();
    _systemKeyCtrl.dispose();
    _descriptionCtrl.dispose();
    _displayOrderCtrl.dispose();
    super.dispose();
  }

  void _syncSystemKey() {
    if (_systemKeyEdited) return;
    final key = _nameCtrl.text
        .trim()
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z0-9]+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    _systemKeyCtrl.text = key;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      AppToastsUtils.showInfoTop(context, 'Please fix the errors above');
      return;
    }
    AppToastsUtils.showInfoTop(context, 'Role saved — coming soon');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'New Role'),
      body: SafeArea(
        top: false,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: context.pagePadding.copyWith(top: 16, bottom: 120),
            children: [
              _HeaderHero()
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.15, curve: Curves.easeOutCubic),
              const SizedBox(height: 14),
              _SectionCard(
                icon: Iconsax.security_user,
                iconColor: AppColors.purple,
                title: 'Role Info',
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    CustomTextFormField(
                      controller: _nameCtrl,
                      label: 'Name',
                      hintText: 'e.g. Regional Manager',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      controller: _systemKeyCtrl,
                      label: 'System Key',
                      hintText: 'REGIONAL_MANAGER',
                      isRequired: true,
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 48,
                      onChanged: (_) => _systemKeyEdited = true,
                      validator: (v) {
                        final s = v?.trim() ?? '';
                        if (s.isEmpty) return 'Required';
                        if (!RegExp(r'^[A-Z0-9_]+$').hasMatch(s)) {
                          return 'Only A-Z, 0-9, _';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      controller: _descriptionCtrl,
                      label: 'Description',
                      hintText: 'Optional short description',
                      boldLabel: true,
                      labelFontSize: 13,
                      fieldHeight: 88,
                      maxLines: 3,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _DisplayOrderField(controller: _displayOrderCtrl),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 400.ms)
                  .slideY(begin: 0.15, curve: Curves.easeOutCubic),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomBar(
        onCancel: () => context.pop(),
        onSave: _save,
      ),
    );
  }
}

class _HeaderHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: .center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: context.isDark
                  ? RadialGradient(
                      colors: [
                        AppColors.purple.withValues(alpha: 0.30),
                        AppColors.purple.withValues(alpha: 0.06),
                      ],
                    )
                  : null,
              color: context.isDark
                  ? null
                  : AppColors.purple.withValues(alpha: 0.12),
            ),
            child: Icon(
              Iconsax.shield_tick,
              size: 22,
              color: AppColors.purple,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  'Create a Security Role',
                  style: context.titleSmall.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Define a role users can be assigned to',
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
                  ),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.child,
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
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _DisplayOrderField extends StatelessWidget {
  final TextEditingController controller;

  const _DisplayOrderField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Display Order',
          style: context.bodySmall.copyWith(
            color: context.textSecondary,
            fontSize: 13,
            fontWeight: .w600,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: context.bodySmall.copyWith(color: context.textPrimary),
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: context.bodySmall.copyWith(
                color: context.textSecondary,
              ),
              filled: true,
              fillColor: context.surface,
              contentPadding: const EdgeInsets.only(left: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.primary, width: 2),
              ),
            ),
          ),
        ),
      ],
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
                      'Save Role',
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
