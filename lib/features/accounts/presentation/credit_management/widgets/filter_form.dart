import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class FilterForm extends StatefulWidget {
  final DateTime date;
  final TextEditingController partyController;
  final String? financialYear;
  final String? customerType;
  final String? groupOn;
  final String? creditRating;
  final List<String> financialYearOptions;
  final List<String> customerTypeOptions;
  final List<String> groupOnOptions;
  final List<String> creditRatingOptions;
  final ValueChanged<String> onPartyChanged;
  final ValueChanged<String?> onFinancialYearChanged;
  final ValueChanged<String?> onCustomerTypeChanged;
  final ValueChanged<String?> onGroupOnChanged;
  final ValueChanged<String?> onCreditRatingChanged;
  final VoidCallback onPickDate;
  final VoidCallback onView;

  const FilterForm({
    super.key,
    required this.date,
    required this.partyController,
    required this.financialYear,
    required this.customerType,
    required this.groupOn,
    required this.creditRating,
    required this.financialYearOptions,
    required this.customerTypeOptions,
    required this.groupOnOptions,
    required this.creditRatingOptions,
    required this.onPartyChanged,
    required this.onFinancialYearChanged,
    required this.onCustomerTypeChanged,
    required this.onGroupOnChanged,
    required this.onCreditRatingChanged,
    required this.onPickDate,
    required this.onView,
  });

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: .circular(8),
          border: .all(color: context.border),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: context.labelSmall.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w700,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _showMore = !_showMore),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Text(
                        _showMore ? 'Show Less' : 'Show More',
                        style: context.labelSmall.copyWith(
                          color: context.primary,
                          fontWeight: .w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 2),
                      AnimatedRotation(
                        turns: _showMore ? 0.5 : 0,
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeInOut,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16,
                          color: context.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: .end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _FormLabel(text: 'Financial Year'),
                      const SizedBox(height: 6),
                      _SimpleDropdown(
                        items: widget.financialYearOptions,
                        value: widget.financialYear,
                        hint: 'Select Year',
                        onChanged: widget.onFinancialYearChanged,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _FormLabel(text: AppConstants.dateLabel),
                      const SizedBox(height: 6),
                      _DateTile(
                        label: widget.date.format(AppConstants.ddMMMYyyyLabel),
                        onTap: widget.onPickDate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              alignment: .topCenter,
              child: _showMore
                  ? Column(
                      crossAxisAlignment: .start,
                      children: [
                        const SizedBox(height: 10),
                        _FormLabel(text: AppConstants.partyBtn),
                        const SizedBox(height: 6),
                        SearchableDropdown(
                          items: const [],
                          controller: widget.partyController,
                          hintText: AppConstants.selectPartyHint,
                          onChanged: widget.onPartyChanged,
                          fieldHeight: 40,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: .end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  _FormLabel(text: 'Customer Type'),
                                  const SizedBox(height: 6),
                                  _SimpleDropdown(
                                    items: widget.customerTypeOptions,
                                    value: widget.customerType,
                                    hint: 'Select',
                                    onChanged: widget.onCustomerTypeChanged,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  _FormLabel(text: 'Group On'),
                                  const SizedBox(height: 6),
                                  _SimpleDropdown(
                                    items: widget.groupOnOptions,
                                    value: widget.groupOn,
                                    hint: 'Select',
                                    onChanged: widget.onGroupOnChanged,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  _FormLabel(text: 'Credit Rating'),
                                  const SizedBox(height: 6),
                                  _SimpleDropdown(
                                    items: widget.creditRatingOptions,
                                    value: widget.creditRating,
                                    hint: 'Select',
                                    onChanged: widget.onCreditRatingChanged,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 6),
            CustomButton(
              text: AppConstants.view,
              onPressed: widget.onView,
              radius: 6,
              elevation: 0,
              fontsize: 14,
              size: const Size(double.infinity, 35),
              backgroundColor: context.primary.withAlpha(60),
              textColor: context.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w500,
        fontSize: 12,
      ),
      maxLines: 1,
      overflow: .ellipsis,
    );
  }
}

class _DateTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DateTile({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: .circular(6),
          border: .all(color: context.border.withAlpha(50)),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 16, color: context.textSecondary),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                label,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 12,
                ),
                overflow: .ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: context.grey500,
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hint;
  final ValueChanged<String?> onChanged;

  const _SimpleDropdown({
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = context.border.withAlpha(50);
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          isDense: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.grey500,
            size: 20,
          ),
          hint: Text(
            hint,
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
          style: context.bodySmall.copyWith(color: context.textPrimary),
          dropdownColor: context.surface,
          borderRadius: BorderRadius.circular(10),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
