import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/theme_utils.dart';
import '../utils/utils_exports.dart';

class SearchableDropdown extends StatefulWidget {
  final List<String> items;
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
  final _filteredNotifier = ValueNotifier<List<String>>([]);
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _filteredNotifier.value = widget.items;
  }

  @override
  void dispose() {
    _closeDropdown();
    _filteredNotifier.dispose();
    super.dispose();
  }

  void _filterItems(String input) {
    _filteredNotifier.value = input.trim().isEmpty
        ? widget.items
        : widget.items
            .where((i) => i.toLowerCase().contains(input.trim().toLowerCase()))
            .toList();
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
                color: Colors.transparent,
                child: ValueListenableBuilder<List<String>>(
                  valueListenable: _filteredNotifier,
                  builder: (ctx, items, _) => _DropdownList(
                    items: items,
                    controller: widget.controller,
                    dropdownBackgroundColor: widget.dropdownBackgroundColor,
                    onSelect: (item) {
                      widget.controller.text = item;
                      widget.onChanged(item);
                      _closeDropdown();
                      FocusScope.of(context).unfocus();
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
    if (!_isOpen) return;
    setState(() => _isOpen = false);
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) FocusScope.of(context).unfocus();
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
            prefixIcon: Icon(Iconsax.map, color: context.grey500, size: 20),
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close, color: context.grey500, size: 18),
                    onPressed: () {
                      setState(() => widget.controller.clear());
                      _filteredNotifier.value = widget.items;
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
  final List<String> items;
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
      constraints: const BoxConstraints(maxHeight: 200),
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
                final item = items[index];
                final isSelected = controller.text == item;
                return ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  selected: isSelected,
                  selectedTileColor: context.primary.withAlpha(10),
                  title: Text(
                    item,
                    style: context.bodyMedium.copyWith(
                      color: isSelected ? context.primary : context.textPrimary,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: context.primary, size: 20)
                      : null,
                  onTap: () => onSelect(item),
                );
              },
            ),
    );
  }
}
