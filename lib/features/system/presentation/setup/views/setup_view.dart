import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class SetupView extends StatefulWidget {
  const SetupView({super.key});

  @override
  State<SetupView> createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  static const _sections = <_ConfigSection>[
    _ConfigSection(
      title: 'Locations',
      icon: Iconsax.location,
      rows: [
        _ConfigRow(type: 'Country', name: 'Afghanistan', code: 'AFG'),
        _ConfigRow(type: 'Country', name: 'Akhtarabad', code: 'AB'),
        _ConfigRow(type: 'City', name: 'Arifwala', code: 'AF'),
        _ConfigRow(type: 'City', name: 'Bahawalnagar', code: 'BWG'),
        _ConfigRow(type: 'City', name: 'Bahawalpur', code: 'BWP'),
        _ConfigRow(type: 'City', name: 'Bannu', code: 'BAN'),
        _ConfigRow(type: 'Country', name: 'Canada', code: 'CAN'),
        _ConfigRow(type: 'City', name: 'Charsadda', code: 'CHA'),
        _ConfigRow(type: 'City', name: 'Chichawatni', code: 'CHI'),
        _ConfigRow(type: 'City', name: 'Depalpur', code: 'DEP'),
        _ConfigRow(type: 'Country', name: 'Doha Qatar', code: 'QAT'),
        _ConfigRow(type: 'City', name: 'Faisalabad', code: 'FSD'),
        _ConfigRow(type: 'Country', name: 'Gojra', code: 'GJ'),
        _ConfigRow(type: 'City', name: 'Haydrabad', code: 'HY'),
        _ConfigRow(type: 'Country', name: 'Hujra Shah Muqeem', code: 'HM'),
        _ConfigRow(type: 'City', name: 'Islamabad', code: 'ISL'),
      ],
    ),
    _ConfigSection(
      title: 'Footer Item',
      icon: Iconsax.document_text,
      rows: [
        _ConfigRow(type: 'Footer', name: 'Terms & Conditions', code: 'TC'),
        _ConfigRow(type: 'Footer', name: 'Payment Policy', code: 'PP'),
        _ConfigRow(type: 'Footer', name: 'Delivery Note', code: 'DN'),
      ],
    ),
    _ConfigSection(
      title: 'Tag Types',
      icon: Iconsax.tag,
      rows: [
        _ConfigRow(type: 'Tag Type', name: 'Priority', code: 'PR'),
        _ConfigRow(type: 'Tag Type', name: 'Category', code: 'CAT'),
        _ConfigRow(type: 'Tag Type', name: 'Region', code: 'RG'),
      ],
    ),
    _ConfigSection(
      title: 'Tags',
      icon: Iconsax.tag_2,
      rows: [
        _ConfigRow(type: 'Tag', name: 'Urgent', code: 'URG'),
        _ConfigRow(type: 'Tag', name: 'Wholesale', code: 'WS'),
        _ConfigRow(type: 'Tag', name: 'Retail', code: 'RT'),
        _ConfigRow(type: 'Tag', name: 'North Zone', code: 'NZ'),
      ],
    ),
  ];

  int _selectedIndex = 0;
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _selectSection(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
      _query = '';
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final section = _sections[_selectedIndex];
    final content = _SectionContent(
      key: ValueKey(_selectedIndex),
      section: section,
      searchController: _searchController,
      query: _query,
      onQueryChanged: (value) => setState(() => _query = value),
    );

    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'System Configuration'),
      body: context.isPhone
          ? Column(
              crossAxisAlignment: .stretch,
              children: [
                _SectionChips(
                  sections: _sections,
                  selectedIndex: _selectedIndex,
                  onSelected: _selectSection,
                ),
                Expanded(child: content),
              ],
            )
          : Row(
              crossAxisAlignment: .stretch,
              children: [
                _SectionSidebar(
                  sections: _sections,
                  selectedIndex: _selectedIndex,
                  onSelected: _selectSection,
                ),
                VerticalDivider(width: 1, color: context.divider),
                Expanded(child: content),
              ],
            ),
    );
  }
}

class _SectionSidebar extends StatelessWidget {
  final List<_ConfigSection> sections;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _SectionSidebar({
    required this.sections,
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
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;
          final section = sections[index];
          return InkWell(
            onTap: () => onSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: selected
                  ? context.primary.withValues(alpha: 0.06)
                  : context.transparent,
              child: Row(
                children: [
                  Icon(
                    section.icon,
                    size: 18,
                    color: selected ? context.primary : context.textSecondary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      section.title,
                      style: context.bodyMedium.copyWith(
                        color: selected ? context.primary : context.textPrimary,
                        fontWeight: selected ? .w600 : .w400,
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SectionChips extends StatelessWidget {
  final List<_ConfigSection> sections;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _SectionChips({
    required this.sections,
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
          children: List.generate(sections.length, (index) {
            final selected = index == selectedIndex;
            final section = sections[index];
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
                        section.icon,
                        size: 15,
                        color: selected ? AppColors.white : context.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        section.title,
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

class _SectionContent extends StatelessWidget {
  final _ConfigSection section;
  final TextEditingController searchController;
  final String query;
  final ValueChanged<String> onQueryChanged;

  const _SectionContent({
    super.key,
    required this.section,
    required this.searchController,
    required this.query,
    required this.onQueryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final rows = query.isEmpty
        ? section.rows
        : section.rows
              .where(
                (row) =>
                    row.name.toLowerCase().contains(query.toLowerCase()) ||
                    row.code.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Padding(
          padding: context.pagePadding.copyWith(bottom: 0),
          child: _Toolbar(
            searchController: searchController,
            onQueryChanged: onQueryChanged,
            sectionTitle: section.title,
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
                      'No results found',
                      style: context.bodyMedium.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    key: ValueKey('${section.title}-$query'),
                    padding: context.pagePadding.copyWith(
                      top: 0,
                      left: 0,
                      right: 0,
                    ),
                    itemCount: rows.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) return const _TableHeader();
                      return _TableRow(row: rows[index - 1], index: index - 1);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onQueryChanged;
  final String sectionTitle;

  const _Toolbar({
    required this.searchController,
    required this.onQueryChanged,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: searchController,
              onChanged: onQueryChanged,
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
        _ToolbarButton(
          color: context.primary,
          onTap: () => AppToastsUtils.showInfoTop(
            context,
            'New $sectionTitle — coming soon',
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
        const SizedBox(width: 8),
        _ToolbarButton(
          color: context.surface,
          borderColor: context.border,
          onTap: () {},
          child: Icon(Iconsax.refresh, size: 15, color: context.textSecondary),
        ),
      ],
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final Color color;
  final Color? borderColor;
  final VoidCallback onTap;
  final Widget child;

  const _ToolbarButton({
    required this.color,
    required this.onTap,
    required this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: .center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: child,
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: context.grey50,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Type',
              style: context.labelMedium.copyWith(fontWeight: .w700),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Name',
              style: context.labelMedium.copyWith(fontWeight: .w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  final _ConfigRow row;
  final int index;

  const _TableRow({required this.row, required this.index});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 250 + (index * 30).clamp(0, 300)),
      curve: Curves.easeOut,
      builder: (context, value, child) =>
          Opacity(opacity: value, child: child),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(bottom: BorderSide(color: context.divider)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                row.type,
                style: context.bodySmall.copyWith(
                  color: context.textSecondary,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text.rich(
                TextSpan(
                  text: row.name,
                  style: context.bodySmall.copyWith(
                    color: context.primary,
                    fontWeight: .w500,
                  ),
                  children: [
                    TextSpan(
                      text: '  ( ${row.code} )',
                      style: context.bodySmall.copyWith(
                        color: context.textSecondary,
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

class _ConfigSection {
  final String title;
  final IconData icon;
  final List<_ConfigRow> rows;

  const _ConfigSection({
    required this.title,
    required this.icon,
    required this.rows,
  });
}

class _ConfigRow {
  final String type;
  final String name;
  final String code;

  const _ConfigRow({
    required this.type,
    required this.name,
    required this.code,
  });
}
