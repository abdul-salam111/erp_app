import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../system_exports.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SecurityBloc>(),
      child: const _SecurityBody(),
    );
  }
}

class _SecurityBody extends StatefulWidget {
  const _SecurityBody();

  @override
  State<_SecurityBody> createState() => _SecurityBodyState();
}

class _SecurityBodyState extends State<_SecurityBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Users'),
      body: const _UsersContent(),
    );
  }
}

class _UsersContent extends StatefulWidget {
  const _UsersContent();

  @override
  State<_UsersContent> createState() => _UsersContentState();
}

class _UsersContentState extends State<_UsersContent> {
  static const _users = <_UserRow>[
    _UserRow(
      name: '',
      email: 'HrCommisionagent@gmail.com',
      designation: 'Owner',
      department: 'Department',
      active: false,
    ),
    _UserRow(
      name: 'Tayyab Bahir',
      email: 'tayyabb@bahooricemills.com',
      designation: 'Owner',
      department: 'Department',
      active: false,
    ),
    _UserRow(
      name: 'Bilal Khalid',
      email: 'ST-team@bahoofoods.com',
      designation: 'Admin Officer',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Altaf Hussain',
      email: 'admin@bahoofoods.com',
      designation: 'Accounts',
      department: 'Department',
      active: false,
    ),
    _UserRow(
      name: 'Saddam Hussain',
      email: 'saddam@bahoofoods.com',
      designation: 'Accounts',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Ghulam Abbas',
      email: 'abbas@bahoofoods.com',
      designation: 'Accounts',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Muneeb UR Rehman',
      email: 'muneeb@bahoofoods.com',
      designation: 'Gate Clerk',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Ayesha Rehman',
      email: 'ayesha@bahoofoods.com',
      designation: 'Quality Executive',
      department: 'Department',
      active: true,
    ),
    _UserRow(
      name: 'Nimra Shakir',
      email: 'nimrashakir@bahoofoods.com',
      designation: 'QA',
      department: 'Department',
      active: true,
    ),
  ];

  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_UserRow> get _filtered {
    return _users.where((user) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return user.name.toLowerCase().contains(q) ||
          user.email.toLowerCase().contains(q) ||
          user.designation.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _filtered;
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Padding(
          padding: context.pagePadding.copyWith(bottom: 0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _query = value),
                    style: context.bodySmall,
                    decoration: InputDecoration(
                      hintText: 'Filter Keywords',
                      hintStyle: context.bodySmall.copyWith(
                        color: context.textDisabled,
                      ),
                      prefixIcon: Icon(
                        Iconsax.search_normal_1,
                        size: 16,
                        color: context.textSecondary,
                      ),
                      contentPadding: .zero,
                      filled: true,
                      fillColor: context.surface,
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
                        borderSide: BorderSide(color: context.primary),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: context.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.border),
                  ),
                  child: Icon(
                    Iconsax.refresh,
                    size: 15,
                    color: context.textSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => AppToastsUtils.showInfoTop(
                  context,
                  'New user — coming soon',
                ),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: context.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      const Icon(Icons.add, size: 15, color: AppColors.white),
                      const SizedBox(width: 2),
                      Text(
                        'New',
                        style: context.labelSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: rows.isEmpty
                ? Center(
                    key: const ValueKey('empty'),
                    child: Text(
                      'No users found',
                      style: context.bodyMedium.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    key: ValueKey(_query),
                    padding: context.pagePadding.copyWith(
                      top: 0,
                      left: 0,
                      right: 0,
                    ),
                    itemCount: rows.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) return const _UsersTableHeader();
                      return _UserTableRow(
                        user: rows[index - 1],
                        index: index - 1,
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

class _UsersTableHeader extends StatelessWidget {
  const _UsersTableHeader();

  @override
  Widget build(BuildContext context) {
    final showAllColumns = !context.isPhone;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: context.surfaceHeader,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              'Name',
              style: context.labelMedium.copyWith(fontWeight: .w700),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Designation',
              style: context.labelMedium.copyWith(fontWeight: .w700),
            ),
          ),
          if (showAllColumns)
            Expanded(
              flex: 2,
              child: Text(
                'Department',
                style: context.labelMedium.copyWith(fontWeight: .w700),
              ),
            ),
          Expanded(
            flex: 2,
            child: Text(
              'Actions',
              textAlign: .center,
              style: context.labelMedium.copyWith(fontWeight: .w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserTableRow extends StatelessWidget {
  final _UserRow user;
  final int index;

  const _UserTableRow({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    final showAllColumns = !context.isPhone;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 250 + (index * 30).clamp(0, 300)),
      curve: Curves.easeOut,
      builder: (context, value, child) =>
          Opacity(opacity: value, child: child),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: context.surface,
          border: Border(bottom: BorderSide(color: context.divider)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  _UserAvatar(
                    name: user.name.isNotEmpty ? user.name : user.email,
                    active: user.active,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        if (user.name.isNotEmpty)
                          Text(
                            user.name,
                            style: context.bodySmall.copyWith(
                              color: context.textPrimary,
                              fontWeight: .w500,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        Text(
                          user.email,
                          style: context.bodySmall.copyWith(
                            color: context.primary,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        if (!showAllColumns) ...[
                          const SizedBox(height: 2),
                          Text(
                            user.department,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                user.designation,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                ),
              ),
            ),
            if (showAllColumns)
              Expanded(
                flex: 2,
                child: Text(
                  user.department,
                  style: context.bodySmall.copyWith(
                    color: context.textPrimary,
                  ),
                ),
              ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  _ActionLink(
                    icon: Iconsax.key,
                    label: 'Tokens',
                    onTap: () => AppToastsUtils.showInfoTop(
                      context,
                      'Tokens — coming soon',
                    ),
                  ),
                  const SizedBox(height: 4),
                  _ActionLink(
                    icon: Iconsax.calendar_1,
                    label: 'Fin Years',
                    onTap: () => AppToastsUtils.showInfoTop(
                      context,
                      'Fin Years — coming soon',
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
}

class _UserAvatar extends StatelessWidget {
  final String name;
  final bool active;

  static const _palette = [
    AppColors.primary,
    AppColors.teal,
    AppColors.purple,
    AppColors.orange,
    AppColors.green,
    AppColors.deepPurple,
    AppColors.tealDark,
    AppColors.blueGrey,
  ];

  const _UserAvatar({required this.name, required this.active});

  String get _initials {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    final color = _palette[name.hashCode.abs() % _palette.length];
    return Stack(
      clipBehavior: .none,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: .center,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            shape: .circle,
          ),
          child: Text(
            _initials,
            style: context.labelSmall.copyWith(
              color: color,
              fontWeight: .w700,
              fontSize: 10,
            ),
          ),
        ),
        Positioned(
          right: -1,
          top: -1,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: active ? AppColors.green : AppColors.errorBright,
              shape: .circle,
              border: Border.all(color: context.surfaceElevated, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: .min,
          children: [
            Icon(icon, size: 13, color: context.primary),
            const SizedBox(width: 4),
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.primary,
                fontWeight: .w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserRow {
  final String name;
  final String email;
  final String designation;
  final String department;
  final bool active;

  const _UserRow({
    required this.name,
    required this.email,
    required this.designation,
    required this.department,
    required this.active,
  });
}
