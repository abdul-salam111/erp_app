import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../../core/widgets/glass_surface.dart';
import '../../../../../core/widgets/shimmer_box.dart';
import '../../../domain/entities/system_entity.dart';
import '../bloc/new_role_bloc.dart';
import '../bloc/new_role_event.dart';
import '../bloc/new_role_state.dart';

class NewRoleView extends StatelessWidget {
  final int? roleId;

  const NewRoleView({super.key, this.roleId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<NewRoleBloc>()..add(NewRoleFormLoaded(roleId: roleId)),
      child: _NewRoleFormBody(roleId: roleId),
    );
  }
}

class _NewRoleFormBody extends StatefulWidget {
  final int? roleId;

  const _NewRoleFormBody({this.roleId});

  @override
  State<_NewRoleFormBody> createState() => _NewRoleFormBodyState();
}

class _NewRoleFormBodyState extends State<_NewRoleFormBody> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _systemKeyCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _displayOrderCtrl = TextEditingController();

  bool _systemKeyEdited = false;
  bool _prefilled = false;

  bool get _isEdit => widget.roleId != null;

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

  void _prefill(RoleEntity role) {
    _nameCtrl.text = role.name;
    _systemKeyCtrl.text = role.sysKey ?? '';
    _descriptionCtrl.text = role.description ?? '';
    _systemKeyEdited = true;
    _prefilled = true;
    setState(() {});
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      AppToastsUtils.showInfoTop(context, 'Please fix the errors above');
      return;
    }
    final bloc = context.read<NewRoleBloc>();
    final description = _descriptionCtrl.text.trim();
    final payload = <String, dynamic>{
      'Id': bloc.state.role?.id ?? 0,
      'Name': _nameCtrl.text.trim(),
      'SysKey': _systemKeyCtrl.text.trim(),
      'Description': description.isEmpty ? null : description,
      'FlgSystem': bloc.state.role?.isSystemRole ?? false,
    };
    bloc.add(NewRoleSubmitted(payload));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewRoleBloc, NewRoleState>(
      listenWhen: (p, c) =>
          (p.role != c.role && c.role != null && !_prefilled) ||
          p.saveStatus != c.saveStatus,
      listener: (context, state) {
        if (state.role != null &&
            !_prefilled &&
            state.saveStatus != ApiStatus.SUCCESS) {
          _prefill(state.role!);
        }
        if (state.saveStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showInfoTop(
            context,
            _isEdit ? 'Role updated' : 'Role created',
          );
          context.pop(true);
        } else if (state.saveStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showInfoTop(
            context,
            state.message ?? 'Failed to save role',
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.apiStatus == ApiStatus.LOADING;
        final isSaving = state.saveStatus == ApiStatus.LOADING;
        return Scaffold(
          backgroundColor: context.background,
          appBar: CustomAppBar(title: _isEdit ? 'Edit Role' : 'New Role'),
          body: SafeArea(
            top: false,
            child: isLoading
                ? const _NewRoleFormShimmer()
                : state.apiStatus == ApiStatus.FAILURE
                    ? _ErrorRetry(
                        message: state.message ?? 'Failed to load role',
                        onRetry: () => context
                            .read<NewRoleBloc>()
                            .add(NewRoleFormLoaded(roleId: widget.roleId)),
                      )
                    : Form(
                        key: _formKey,
                        child: ListView(
                          padding: context.pagePadding.copyWith(
                            top: 16,
                            bottom: 120,
                          ),
                          children: [
                            _HeaderHero(isEdit: _isEdit)
                                .animate()
                                .fadeIn(duration: 400.ms)
                                .slideY(
                                    begin: 0.15, curve: Curves.easeOutCubic),
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
                                        (v == null || v.trim().isEmpty)
                                            ? 'Required'
                                            : null,
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
                                      if (!RegExp(r'^[A-Z0-9_]+$',
                                              caseSensitive: false)
                                          .hasMatch(s)) {
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
                                  _DisplayOrderField(
                                    controller: _displayOrderCtrl,
                                  ),
                                ],
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 100.ms, duration: 400.ms)
                                .slideY(
                                    begin: 0.15, curve: Curves.easeOutCubic),
                          ],
                        ),
                      ),
          ),
          bottomNavigationBar: isLoading ||
                  state.apiStatus == ApiStatus.FAILURE
              ? null
              : _BottomBar(
                  onCancel: isSaving ? () {} : () => context.pop(),
                  onSave: isSaving ? () {} : _save,
                  saveLabel: _isEdit ? 'Update Role' : 'Save Role',
                  isSaving: isSaving,
                ),
        );
      },
    );
  }
}

class _NewRoleFormShimmer extends StatelessWidget {
  const _NewRoleFormShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.pagePadding.copyWith(top: 16, bottom: 120),
      children: const [
        ShimmerBox(height: 78, radius: 16),
        SizedBox(height: 14),
        ShimmerBox(height: 340, radius: 14),
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

class _HeaderHero extends StatelessWidget {
  final bool isEdit;

  const _HeaderHero({this.isEdit = false});

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
                  isEdit ? 'Edit Security Role' : 'Create a Security Role',
                  style: context.titleSmall.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isEdit
                      ? 'Update the role\'s name, key and description'
                      : 'Define a role users can be assigned to',
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
  final String saveLabel;
  final bool isSaving;

  const _BottomBar({
    required this.onCancel,
    required this.onSave,
    this.saveLabel = 'Save Role',
    this.isSaving = false,
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
                onPressed: isSaving ? null : onCancel,
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
                onPressed: isSaving ? null : onSave,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: context.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isSaving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.white),
                        ),
                      )
                    : Row(
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
