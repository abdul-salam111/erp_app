import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/di/di_exports.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../security_exports.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

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
  static const _menu = <_SecurityMenuItem>[
    _SecurityMenuItem(title: 'Users', icon: Iconsax.profile_2user),
    _SecurityMenuItem(title: 'Roles', icon: Iconsax.setting_2),
    _SecurityMenuItem(
      title: 'Teams',
      icon: Iconsax.people,
      comingSoon: true,
    ),
    _SecurityMenuItem(
      title: 'Active Sessions',
      icon: Iconsax.monitor,
      comingSoon: true,
    ),
    _SecurityMenuItem(title: 'Block Ips', icon: Iconsax.shield_slash),
    _SecurityMenuItem(
      title: 'Activity Log',
      icon: Iconsax.activity,
      comingSoon: true,
    ),
  ];

  int _selectedIndex = 0;

  void _selectMenu(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final item = _menu[_selectedIndex];
    final content = item.title == 'Users'
        ? const _UsersContent(key: ValueKey('users'))
        : _PlaceholderContent(key: ValueKey(item.title), title: item.title);

    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Security'),
      body: context.isPhone
          ? Column(
              crossAxisAlignment: .stretch,
              children: [
                _SecurityChips(
                  menu: _menu,
                  selectedIndex: _selectedIndex,
                  onSelected: _selectMenu,
                ),
                Expanded(child: content),
              ],
            )
          : Row(
              crossAxisAlignment: .stretch,
              children: [
                _SecuritySidebar(
                  menu: _menu,
                  selectedIndex: _selectedIndex,
                  onSelected: _selectMenu,
                ),
                VerticalDivider(width: 1, color: context.divider),
                Expanded(child: content),
              ],
            ),
    );
  }
}

class _SecuritySidebar extends StatelessWidget {
  final List<_SecurityMenuItem> menu;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _SecuritySidebar({
    required this.menu,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final width = Responsive.value<double>(
      context,
      phone: 200,
      tablet: 220,
      ipad: 260,
    );
    return Container(
      width: width,
      color: context.surface,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            color: context.primary,
            child: Row(
              children: [
                const Icon(Iconsax.lock_1, size: 16, color: AppColors.white),
                const SizedBox(width: 8),
                Text(
                  'SECURITY',
                  style: context.labelMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: .w700,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final selected = index == selectedIndex;
                final item = menu[index];
                return InkWell(
                  onTap: () => onSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    color: selected
                        ? context.primary.withValues(alpha: 0.06)
                        : context.transparent,
                    child: Row(
                      children: [
                        Icon(
                          item.icon,
                          size: 18,
                          color: selected
                              ? context.primary
                              : context.textSecondary,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            item.title,
                            style: context.bodyMedium.copyWith(
                              color: selected
                                  ? context.primary
                                  : context.textPrimary,
                              fontWeight: selected ? .w600 : .w400,
                            ),
                          ),
                        ),
                        if (item.comingSoon) ...[
                          const SizedBox(width: 6),
                          const _ComingSoonBadge(),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityChips extends StatelessWidget {
  final List<_SecurityMenuItem> menu;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _SecurityChips({
    required this.menu,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.surface,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: List.generate(menu.length, (index) {
            final selected = index == selectedIndex;
            final item = menu[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () => onSelected(index),
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? context.primary
                        : context.primary.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Icon(
                        item.icon,
                        size: 15,
                        color: selected ? AppColors.white : context.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item.title,
                        style: context.labelMedium.copyWith(
                          color: selected ? AppColors.white : context.primary,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _ComingSoonBadge extends StatelessWidget {
  const _ComingSoonBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.green.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Coming soon',
        style: context.labelSmall.copyWith(
          color: AppColors.greenDark,
          fontSize: 9,
          fontWeight: .w600,
        ),
      ),
    );
  }
}

class _PlaceholderContent extends StatelessWidget {
  final String title;

  const _PlaceholderContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Iconsax.box_1, size: 40, color: context.grey300),
          const SizedBox(height: 10),
          Text(
            '$title â€” coming soon',
            style: context.bodyMedium.copyWith(color: context.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _UsersContent extends StatefulWidget {
  const _UsersContent({super.key});

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

  static const _filters = ['All', 'Active', 'Inactive'];

  final _searchController = TextEditingController();
  String _query = '';
  String _filter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_UserRow> get _filtered {
    return _users.where((user) {
      if (_filter == 'Active' && !user.active) return false;
      if (_filter == 'Inactive' && user.active) return false;
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
              Text(
                'Users',
                style: context.titleSmall.copyWith(fontWeight: .w700),
              ),
              const SizedBox(width: 10),
              _FilterDropdown(
                value: _filter,
                options: _filters,
                onChanged: (value) => setState(() => _filter = value),
              ),
              const SizedBox(width: 10),
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
                        color: context.grey400,
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
                  'New user â€” coming soon',
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
                    key: ValueKey('$_filter-$_query'),
                    padding: context.pagePadding.copyWith(top: 0),
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

class _FilterDropdown extends StatelessWidget {
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const _FilterDropdown({
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onChanged,
      itemBuilder: (context) => options
          .map(
            (option) => PopupMenuItem(
              value: option,
              child: Text(option, style: context.bodySmall),
            ),
          )
          .toList(),
      child: Row(
        mainAxisSize: .min,
        children: [
          Text(
            value,
            style: context.bodySmall.copyWith(
              color: context.textSecondary,
              fontWeight: .w500,
            ),
          ),
          Icon(Iconsax.arrow_down_1, size: 13, color: context.textSecondary),
        ],
      ),
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
        color: AppColors.indigoLight,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Name',
              style: context.labelMedium.copyWith(fontWeight: .w700),
            ),
          ),
          if (showAllColumns) ...[
            Expanded(
              flex: 2,
              child: Text(
                'Designation',
                style: context.labelMedium.copyWith(fontWeight: .w700),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Department',
                style: context.labelMedium.copyWith(fontWeight: .w700),
              ),
            ),
          ],
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
          color: AppColors.white,
          border: Border(bottom: BorderSide(color: context.divider)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  _UserAvatar(active: user.active),
                  const SizedBox(width: 10),
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
                            '${user.designation} â€¢ ${user.department}',
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
            if (showAllColumns) ...[
              Expanded(
                flex: 2,
                child: Text(
                  user.designation,
                  style: context.bodySmall.copyWith(
                    color: context.textPrimary,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  user.department,
                  style: context.bodySmall.copyWith(
                    color: context.textPrimary,
                  ),
                ),
              ),
            ],
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
                      'Tokens â€” coming soon',
                    ),
                  ),
                  const SizedBox(height: 4),
                  _ActionLink(
                    icon: Iconsax.calendar_1,
                    label: 'Fin Years',
                    onTap: () => AppToastsUtils.showInfoTop(
                      context,
                      'Fin Years â€” coming soon',
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
  final bool active;

  const _UserAvatar({required this.active});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: context.grey100,
            shape: .circle,
            border: Border.all(color: context.border),
          ),
          child: Icon(Iconsax.user, size: 18, color: context.grey400),
        ),
        Positioned(
          right: -1,
          top: -1,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: active ? AppColors.green : AppColors.errorBright,
              shape: .circle,
              border: Border.all(color: AppColors.white, width: 1.5),
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

class _SecurityMenuItem {
  final String title;
  final IconData icon;
  final bool comingSoon;

  const _SecurityMenuItem({
    required this.title,
    required this.icon,
    this.comingSoon = false,
  });
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
