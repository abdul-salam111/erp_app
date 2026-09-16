import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../glass_surface.dart';
import '../shimmer_box.dart';
import '../custom_dropdown_textfield.dart';
import '../custom_button.dart';
import 'accounts_filter_form.dart';

// ─── Filter form — account/party selector + date-range popup trigger ───────────
//
// Variant of AccountsFilterForm where the From/To date fields live in a
// popup opened from a calendar icon next to the selector field, and
// "View"/"Print" are shown as two buttons instead of one "Apply" button.

class AccountsFilterFormCompact extends StatelessWidget {
  final String? label;
  final String? hintText;
  final List<String> items;
  final List<String>? subtitles;
  final bool isLoading;
  final TextEditingController? controller;
  final ValueChanged<String>? onItemChanged;
  final VoidCallback onPickDateRange;
  final VoidCallback onView;
  final VoidCallback onPrint;
  final bool showAccountSelector;
  // Replaces the account/party dropdown with a custom widget (e.g. a search
  // field) while keeping the same label + date-range-icon row layout.
  final Widget? selectorOverride;

  const AccountsFilterFormCompact({
    super.key,
    this.label,
    this.hintText,
    this.items = const [],
    this.subtitles,
    this.isLoading = false,
    this.controller,
    this.onItemChanged,
    required this.onPickDateRange,
    required this.onView,
    required this.onPrint,
    this.showAccountSelector = true,
    this.selectorOverride,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? context.background : context.surface,
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        12,
        context.pagePadding.right,
        12,
      ),
      child: GlassSurface(
        radius: 12,
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          12,
          context.pagePadding.right,
          12,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            if (showAccountSelector) ...[
              if (selectorOverride == null) ...[
                FormLabel(text: label ?? ''),
                const SizedBox(height: 6),
              ],
              Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    child:
                        selectorOverride ??
                        (isLoading
                            ? ShimmerBox(
                                height: 40,
                                radius: 10,
                                baseColor: context.isDark
                                    ? context.navyIconBg
                                    : null,
                                highlightColor: context.isDark
                                    ? context.navyCard
                                    : null,
                              )
                            : SearchableDropdown(
                                items: items,
                                subtitles: subtitles,
                                controller: controller!,
                                hintText: hintText ?? '',
                                onChanged: onItemChanged ?? (_) {},
                                fieldHeight: 40,
                              )),
                  ),
                  const SizedBox(width: 8),
                  _DateRangeIconButton(onTap: onPickDateRange),
                ],
              ),
              const SizedBox(height: 10),
            ] else ...[
              Align(
                alignment: .centerRight,
                child: _DateRangeIconButton(onTap: onPickDateRange),
              ),
              const SizedBox(height: 10),
            ],
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: AppConstants.printLabel,
                    onPressed: onPrint,
                    radius: 6,
                    elevation: 0,
                    fontsize: 14,
                    icon: Icons.print_outlined,
                    iconSize: 16,
                    isOutlined: true,
                    size: const Size.fromHeight(40),
                    backgroundColor: context.primary,
                    borderColor: context.primary.withValues(alpha: 0.12),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: AppConstants.viewLabel,
                    onPressed: onView,
                    radius: 6,
                    elevation: 0,
                    fontsize: 14,
                    size: const Size.fromHeight(40),
                    backgroundColor: context.primary.withValues(alpha: 0.12),
                    textColor: context.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DateRangeIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const _DateRangeIconButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (context.isDark) {
      return GestureDetector(
        onTap: onTap,
        child: RepaintBoundary(
          child: ClipRRect(
            borderRadius: .circular(6),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: .circular(6),
                  gradient: LinearGradient(
                    begin: .topLeft,
                    end: .bottomRight,
                    colors: [
                      AppColors.white.withValues(alpha: 0.06),
                      AppColors.white.withValues(alpha: 0.02),
                    ],
                  ),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.10),
                    width: 1,
                  ),
                ),
                child: Icon(Iconsax.calendar_1, size: 18, color: context.primary),
              ),
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: .circular(6),
          border: Border.all(color: context.border),
        ),
        child: Icon(Iconsax.calendar_1, size: 18, color: context.primary),
      ),
    );
  }
}

// ─── Date-range popup ───────────────────────────────────────────────────────────
//
// Bloc-agnostic: callers pass the current from/to dates plus a picker
// callback that returns the newly picked date (or null if cancelled), so
// this works whether the dates live in a bloc or in local State.

Future<void> showAccountsDateRangeDialog(
  BuildContext context, {
  required DateTime fromDate,
  required DateTime toDate,
  required Future<DateTime?> Function(bool isFrom) onPick,
}) {
  return showDialog(
    context: context,
    builder: (_) => _DateRangeDialog(
      initialFromDate: fromDate,
      initialToDate: toDate,
      onPick: onPick,
    ),
  );
}

class _DateRangeDialog extends StatefulWidget {
  final DateTime initialFromDate;
  final DateTime initialToDate;
  final Future<DateTime?> Function(bool isFrom) onPick;

  const _DateRangeDialog({
    required this.initialFromDate,
    required this.initialToDate,
    required this.onPick,
  });

  @override
  State<_DateRangeDialog> createState() => _DateRangeDialogState();
}

class _DateRangeDialogState extends State<_DateRangeDialog> {
  late DateTime _fromDate = widget.initialFromDate;
  late DateTime _toDate = widget.initialToDate;

  Future<void> _pick(bool isFrom) async {
    final picked = await widget.onPick(isFrom);
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _fromDate = picked;
      } else {
        _toDate = picked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(Iconsax.calendar, color: context.primary, size: 18),
            const SizedBox(width: 8),
            Text(
              AppConstants.selectDateRangeLabel,
              style: context.titleSmall.copyWith(fontWeight: .w700),
            ),
          ],
        ),
        const SizedBox(height: 16),
        FormLabel(text: AppConstants.fromDateBtn),
        const SizedBox(height: 6),
        FieldTile(
          icon: Iconsax.calendar_1,
          label: _fromDate.format(AppConstants.ddMMMYyyyLabel),
          onTap: () => _pick(true),
        ),
        const SizedBox(height: 14),
        FormLabel(text: AppConstants.toDateBtn),
        const SizedBox(height: 6),
        FieldTile(
          icon: Iconsax.calendar_1,
          label: _toDate.format(AppConstants.ddMMMYyyyLabel),
          onTap: () => _pick(false),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: AppConstants.close,
            onPressed: () => Navigator.pop(context),
            radius: 8,
            elevation: 0,
            fontsize: 14,
            size: const Size.fromHeight(40),
            backgroundColor: context.primary.withValues(alpha: 0.12),
            textColor: context.primary,
          ),
        ),
      ],
    );

    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: GlassSurface(
        radius: 16,
        padding: const EdgeInsets.all(20),
        child: body,
      ),
    );
  }
}
