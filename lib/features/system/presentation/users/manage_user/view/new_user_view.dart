import 'dart:convert';
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
  final Map<int, Set<int>> _selectedRolesByBranch = <int, Set<int>>{};
  bool _prefilled = false;

  int get _totalSelectedRoles => _selectedRolesByBranch.values.fold<int>(
        0,
        (sum, s) => sum + s.length,
      );

  Set<int> _rolesFor(int branchId) =>
      _selectedRolesByBranch.putIfAbsent(branchId, () => <int>{});

  void _toggleRole(int branchId, int roleId) {
    final set = _rolesFor(branchId);
    setState(() {
      if (set.contains(roleId)) {
        set.remove(roleId);
      } else {
        set.add(roleId);
      }
    });
  }

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
    _selectedRolesByBranch.clear();
    for (final r in u.roles) {
      final branchId = r.misBranchId;
      final roleId = r.roleId;
      if (branchId == null || roleId == null) continue;
      _selectedRolesByBranch.putIfAbsent(branchId, () => <int>{}).add(roleId);
    }
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
    final bloc = context.read<NewUserBloc>();
    final payload = _buildPayload(bloc.state);
    bloc.add(NewUserSubmitted(payload));
  }

  Map<String, dynamic> _buildPayload(NewUserState state) {
    final user = state.userDetail;
    final isCreate = widget.mode == UserFormMode.create;
    final phone = _phoneCtrl.text.trim();
    final isDashboard = _landing == _LandingChoice.dashboard;

    return {
      'Id': user?.id ?? 0,
      'MisUserId': user?.misUserId ?? 0,
      'Email': _emailCtrl.text.trim(),
      'Password': _passwordCtrl.text.isEmpty ? null : _passwordCtrl.text,
      'ConfirmPassword':
          _confirmPasswordCtrl.text.isEmpty ? null : _confirmPasswordCtrl.text,
      'Archived': false,
      'Designation': _designationCtrl.text.trim(),
      'FlgDashboardLandingPage': isDashboard,
      'LandingPageFeature': _buildLandingPageFeature(state, isDashboard),
      'LandingPageFeatureId': _resolveLandingPageId(state, isDashboard),
      'LandingPageFeatureSysKey': null,
      'LanguageId': user?.languageId ?? 0,
      'OpenDaysFuture': user?.openDaysFuture ?? 1000,
      'OpenDaysPast': user?.openDaysPast ?? 1000,
      'PersonInfo': {
        'Id': isCreate ? 0 : (user?.personId ?? 0),
        'FirstName': _firstNameCtrl.text.trim(),
        'LastName': _lastNameCtrl.text.trim(),
        'Gender': _gender == _Gender.female ? 'F' : 'M',
        'Avatar': null,
        'Contact': _buildContact(user, phone, isCreate),
      },
      'Roles': _buildRolesPayload(state),
      'landingPageMode': isDashboard ? 'dashboard' : 'custom',
    };
  }

  Map<String, dynamic>? _buildLandingPageFeature(
    NewUserState state,
    bool isDashboard,
  ) {
    if (isDashboard) {
      final user = state.userDetail;
      if (user?.landingPageFeatureId != null) {
        return {
          'Id': user!.landingPageFeatureId,
          'Name': user.landingPageName ?? 'Main Dashboard',
          'SysKey': 'erp_main_dashboard',
          'FinDisplayOrder': 0,
          'FlgLandingPage': false,
          'StockDisplayOrder': 0,
        };
      }
      return null;
    }
    if (_selectedLandingPageId == null) return null;
    final match = state.landingPages
        .where((p) => p.id == _selectedLandingPageId)
        .toList();
    if (match.isEmpty) return null;
    final page = match.first;
    return {
      'Id': page.id,
      'Name': page.name,
      'SysKey': page.sysKey,
      'FinDisplayOrder': 0,
      'FlgLandingPage': true,
      'StockDisplayOrder': 0,
    };
  }

  int? _resolveLandingPageId(NewUserState state, bool isDashboard) {
    if (isDashboard) return state.userDetail?.landingPageFeatureId;
    return _selectedLandingPageId;
  }

  Map<String, dynamic> _buildContact(
    SystemUserDetailEntity? user,
    String phone,
    bool isCreate,
  ) {
    final existing = user?.contactNumbers.isNotEmpty == true
        ? user!.contactNumbers.first
        : null;
    final numbers = <Map<String, dynamic>>[];
    String contactNumbersJson = '[]';
    if (phone.isNotEmpty) {
      final e164 = phone.replaceAll(RegExp(r'\s+'), '');
      numbers.add({
        'ContactId': 0,
        'Type': 'MOBILE',
        'International': phone,
        'E164': existing?.e164 ?? e164,
        'National': existing?.national ?? e164,
        'RegionCode': existing?.regionCode ?? 'PK',
        'CountryCode': existing?.countryCode ?? '92',
        'FlgWhatsApp': existing?.isWhatsApp ?? false,
        'FlgWork': existing?.isWork ?? false,
        'FlgEmergency': false,
        'FlgMobile': existing?.isMobile ?? true,
        'Archived': false,
        'Id': existing?.id ?? 0,
      });
      contactNumbersJson = jsonEncode([
        {
          'Id': existing?.id ?? 0,
          'E164': existing?.e164 ?? e164,
          'National': existing?.national ?? e164,
          'FlgMobile': existing?.isMobile ?? true,
          'FlgWork': existing?.isWork ?? false,
          'FlgWhatsApp': existing?.isWhatsApp ?? false,
        }
      ]);
    }
    return {
      'Id': isCreate ? 0 : (user?.contactId ?? 0),
      'Numbers': numbers,
      'Addresses': [],
      'ContactNumbers': contactNumbersJson,
      'FlgBusiness': false,
      'FlgEmail1Verified': false,
      'FlgEmail2Verified': false,
      'Archived': false,
    };
  }

  List<Map<String, dynamic>> _buildRolesPayload(NewUserState state) {
    final assignedRoles = state.userDetail?.roles ?? const [];
    final availableById = {for (final r in state.availableRoles) r.id: r};
    final results = <Map<String, dynamic>>[];
    _selectedRolesByBranch.forEach((branchId, roleIds) {
      for (final roleId in roleIds) {
        final existing = assignedRoles.firstWhere(
          (r) => r.roleId == roleId && r.misBranchId == branchId,
          orElse: () => const SystemUserRoleEntity(name: ''),
        );
        final roleName = availableById[roleId]?.name ??
            (existing.name.isNotEmpty ? existing.name : '');
        results.add({
          'Id': existing.id ?? 0,
          'UserId': 0,
          'MisUserId': 0,
          'RoleId': roleId,
          'Role': {'Id': roleId, 'Name': roleName},
          'MisBranchId': branchId,
        });
      }
    });
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewUserBloc, NewUserState>(
      listenWhen: (p, c) =>
          (p.userDetail != c.userDetail &&
              c.userDetail != null &&
              !_prefilled) ||
          p.saveStatus != c.saveStatus,
      listener: (context, state) {
        if (state.userDetail != null && !_prefilled) {
          _prefill(state.userDetail!);
        }
        if (state.saveStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showInfoTop(
            context,
            widget.mode == UserFormMode.create
                ? 'User created'
                : 'User updated',
          );
          context.pop(true);
        } else if (state.saveStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showInfoTop(
            context,
            state.message ?? 'Failed to save user',
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.apiStatus == ApiStatus.LOADING;
        final isSaving = state.saveStatus == ApiStatus.LOADING;
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
                  onCancel: isSaving ? () {} : () => context.pop(),
                  onSave: isSaving ? () {} : _save,
                  saveLabel: _saveLabel,
                  isSaving: isSaving,
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
            '$_totalSelectedRoles selected',
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontWeight: .w600,
              fontSize: 11,
            ),
          ),
          child: _buildRolesByBranch(context, state),
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 400.ms)
            .slideY(begin: 0.15, curve: Curves.easeOutCubic),
      ],
    );
  }

  Widget _buildRolesByBranch(BuildContext context, NewUserState state) {
    final assignedRoles = state.userDetail?.roles ?? const [];
    if (state.availableRoles.isEmpty && assignedRoles.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            'No roles available',
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
        ),
      );
    }

    final branchList = state.branches.isEmpty
        ? const <BranchEntity>[BranchEntity(id: 0, name: 'Main')]
        : state.branches;

    final groups = <String, List<BranchEntity>>{};
    for (final b in branchList) {
      groups.putIfAbsent(b.name, () => []).add(b);
    }
    final groupEntries = groups.entries.toList();

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        for (int g = 0; g < groupEntries.length; g++) ...[
          if (g > 0) const SizedBox(height: 8),
          _MainDivider(label: groupEntries[g].key),
          const SizedBox(height: 8),
          ..._buildBranchGroupTiles(
            context,
            group: groupEntries[g].value,
            availableRoles: state.availableRoles,
            assignedRoles: assignedRoles,
          ),
        ],
      ],
    );
  }

  List<Widget> _buildBranchGroupTiles(
    BuildContext context, {
    required List<BranchEntity> group,
    required List<RoleEntity> availableRoles,
    required List<SystemUserRoleEntity> assignedRoles,
  }) {
    final primaryBranchId = group.first.id;
    final groupBranchIds = group.map((b) => b.id).toSet();
    final groupOrgIds =
        group.map((b) => b.organizationId).whereType<int>().toSet();

    final matchingRoles = availableRoles
        .where((r) =>
            r.organizationId != null && groupOrgIds.contains(r.organizationId))
        .toList();
    final matchingRoleIds = matchingRoles.map((r) => r.id).toSet();

    final extras = <SystemUserRoleEntity>[];
    final seen = <String>{};
    for (final r in assignedRoles) {
      final branchId = r.misBranchId;
      final roleId = r.roleId;
      if (branchId == null || roleId == null) continue;
      if (!groupBranchIds.contains(branchId)) continue;
      if (matchingRoleIds.contains(roleId)) continue;
      final key = '$branchId-$roleId';
      if (seen.add(key)) extras.add(r);
    }

    final tiles = <Widget>[];
    for (int i = 0; i < matchingRoles.length; i++) {
      final role = matchingRoles[i];
      final selected =
          groupBranchIds.any((bid) => _rolesFor(bid).contains(role.id));
      tiles.add(_RoleTile(
        role: role,
        selected: selected,
        onTap: _readOnly
            ? null
            : () => _toggleGroupRole(groupBranchIds, primaryBranchId, role.id),
      ));
      if (i < matchingRoles.length - 1 || extras.isNotEmpty) {
        tiles.add(Divider(
          height: 1,
          thickness: 1,
          color: context.divider.withValues(alpha: 0.5),
        ));
      }
    }
    for (int i = 0; i < extras.length; i++) {
      final r = extras[i];
      final branchId = r.misBranchId!;
      final roleId = r.roleId!;
      final selected = _rolesFor(branchId).contains(roleId);
      tiles.add(_RoleTile(
        role: RoleEntity(id: roleId, name: r.name),
        selected: selected,
        onTap: _readOnly ? null : () => _toggleRole(branchId, roleId),
      ));
      if (i < extras.length - 1) {
        tiles.add(Divider(
          height: 1,
          thickness: 1,
          color: context.divider.withValues(alpha: 0.5),
        ));
      }
    }
    return tiles;
  }

  void _toggleGroupRole(
    Set<int> groupBranchIds,
    int primaryBranchId,
    int roleId,
  ) {
    final anySelected =
        groupBranchIds.any((bid) => _rolesFor(bid).contains(roleId));
    setState(() {
      if (anySelected) {
        for (final bid in groupBranchIds) {
          _rolesFor(bid).remove(roleId);
        }
      } else {
        _rolesFor(primaryBranchId).add(roleId);
      }
    });
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
  final bool isSaving;

  const _BottomBar({
    required this.onCancel,
    required this.onSave,
    required this.saveLabel,
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

enum _Gender { male, female }

enum _LandingChoice { dashboard, custom }
