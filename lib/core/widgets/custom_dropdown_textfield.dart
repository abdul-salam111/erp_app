import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';
import '../utils/utils_exports.dart';

class SearchableDropdown extends StatefulWidget {
  final List<String> items;
  final List<String?>? subtitles;
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;
  final Color? fillColor;
  final Color? borderColor;
  final Color? dropdownBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? fieldHeight;
  // Pass a fieldName to enable required validation; omit for no validation.
  final String? fieldName;

  const SearchableDropdown({
    super.key,
    required this.items,
    this.subtitles,
    required this.onChanged,
    this.hintText = "Select item",
    required this.controller,
    this.fillColor,
    this.borderColor,
    this.dropdownBackgroundColor,
    this.contentPadding,
    this.fieldHeight = 56,
    this.fieldName,
  });

  @override
  State<SearchableDropdown> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  final _layerLink = LayerLink();
  final _filteredNotifier = ValueNotifier<List<(String, String?)>>([]);
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  List<(String, String?)> _buildPairs({String? filter}) {
    final subs = widget.subtitles;
    final lower = filter?.trim().toLowerCase();
    final pairs = <(String, String?)>[];
    for (var i = 0; i < widget.items.length; i++) {
      final label = widget.items[i];
      if (lower != null && lower.isNotEmpty && !label.toLowerCase().contains(lower)) {
        continue;
      }
      final sub = subs != null && i < subs.length ? subs[i] : null;
      pairs.add((label, sub));
    }
    return pairs;
  }

  @override
  void initState() {
    super.initState();
    _filteredNotifier.value = _buildPairs();
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _filteredNotifier.dispose();
    super.dispose();
  }

  void _filterItems(String input) {
    _filteredNotifier.value = _buildPairs(filter: input);
  }

  void _openDropdown() {
    if (_isOpen) return;
    setState(() => _isOpen = true);

    final renderBox = context.findRenderObject() as RenderBox;
    final dropdownWidth = renderBox.size.width;

    _overlayEntry = OverlayEntry(
      builder: (ctx) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _closeDropdown,
            ),
          ),
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: const Offset(0, 4),
            child: SizedBox(
              width: dropdownWidth,
              child: Material(
                color: AppColors.transparent,
                child: ValueListenableBuilder<List<(String, String?)>>(
                  valueListenable: _filteredNotifier,
                  builder: (ctx, items, _) => _DropdownList(
                    items: items,
                    controller: widget.controller,
                    dropdownBackgroundColor: widget.dropdownBackgroundColor,
                    onSelect: (item) {
                      widget.controller.text = item;
                      widget.onChanged(item);
                      _closeDropdown();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (!mounted) return;
    if (!_isOpen) return;
    setState(() => _isOpen = false);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final defaultFillColor = widget.fillColor ?? context.surface;
    final defaultBorderColor = widget.borderColor ?? context.border.withAlpha(50);

    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        height: widget.fieldHeight,
        child: TextFormField(
          style: context.bodySmall.copyWith(color: context.textPrimary),
          controller: widget.controller,
          validator: widget.fieldName != null
              ? (val) => Validator.validateRequired(val, fieldName: widget.fieldName!)
              : null,
          onTap: _openDropdown,
          onChanged: (value) {
            _filterItems(value);
            if (!_isOpen) _openDropdown();
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: context.bodySmall.copyWith(color: context.textSecondary),
            prefixIcon: Icon(Iconsax.user, color: context.grey500, size: 20),
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close, color: context.grey500, size: 18),
                    onPressed: () {
                      setState(() => widget.controller.clear());
                      _filteredNotifier.value = _buildPairs();
                      _closeDropdown();
                      widget.onChanged('');
                    },
                  )
                : Icon(
                    _isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: context.grey500,
                  ),
            fillColor: defaultFillColor,
            filled: true,
            contentPadding:
                widget.contentPadding ?? const EdgeInsets.only(left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: defaultBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: defaultBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: context.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: context.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: context.error, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownList extends StatelessWidget {
  final List<(String, String?)> items;
  final TextEditingController controller;
  final ValueChanged<String> onSelect;
  final Color? dropdownBackgroundColor;

  const _DropdownList({
    required this.items,
    required this.controller,
    required this.onSelect,
    this.dropdownBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bg = dropdownBackgroundColor ?? context.surfaceElevated;
    return Container(
      constraints: const BoxConstraints(maxHeight: 320),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: context.border),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: items.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'No items found',
                  style:
                      context.bodySmall.copyWith(color: context.textSecondary),
                ),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 4),
              itemCount: items.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                thickness: 1,
                color: context.divider,
              ),
              itemBuilder: (_, index) {
                final (label, subtitle) = items[index];
                final isSelected = controller.text == label;
                return ListTile(
                  dense: subtitle == null,
                  visualDensity: subtitle != null
                      ? VisualDensity.standard
                      : VisualDensity.compact,
                  selected: isSelected,
                  selectedTileColor: context.primary.withAlpha(10),
                  title: Text(
                    label,
                    style: context.bodyMedium.copyWith(
                      color: isSelected ? context.primary : context.textPrimary,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  subtitle: subtitle != null
                      ? Text(
                          subtitle,
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                          ),
                        )
                      : null,
                  trailing: isSelected
                      ? Icon(Icons.check, color: context.primary, size: 20)
                      : null,
                  onTap: () => onSelect(label),
                );
              },
            ),
    );
  }
}
