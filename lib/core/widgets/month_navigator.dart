import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';

const _kMonthNames = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

// ─── Nav button ───────────────────────────────────────────────────────────────

class MonthNavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool disabled;

  const MonthNavButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: disabled ? context.grey50 : context.white,
          shape: .circle,
          border: Border.all(
            color: disabled
                ? context.border.withValues(alpha: 0.4)
                : context.border,
          ),
          boxShadow: disabled
              ? null
              : [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Icon(
          icon,
          size: 17,
          color: disabled
              ? context.textSecondary.withValues(alpha: 0.35)
              : context.textPrimary,
        ),
      ),
    );
  }
}

// ─── Month navigator bar ──────────────────────────────────────────────────────

class MonthNavigator extends StatelessWidget {
  final DateTime month;
  final bool isNextDisabled;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onPick;

  const MonthNavigator({
    super.key,
    required this.month,
    required this.isNextDisabled,
    required this.onPrev,
    required this.onNext,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        MonthNavButton(icon: Icons.chevron_left_rounded, onTap: onPrev),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPick,
          child: Row(
            mainAxisSize: .min,
            children: [
              Icon(Icons.calendar_month_rounded, size: 16, color: context.primary),
              const SizedBox(width: 6),
              Text(
                '${_kMonthNames[month.month - 1]} ${month.year}',
                style: context.titleSmall.copyWith(fontWeight: .w700),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        MonthNavButton(
          icon: Icons.chevron_right_rounded,
          onTap: isNextDisabled ? null : onNext,
          disabled: isNextDisabled,
        ),
      ],
    );
  }
}

// ─── Month / year picker dialog ───────────────────────────────────────────────

class MonthYearPickerDialog extends StatefulWidget {
  final DateTime selected;
  const MonthYearPickerDialog({super.key, required this.selected});

  @override
  State<MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<MonthYearPickerDialog> {
  late int _year;
  late int _month;

  @override
  void initState() {
    super.initState();
    _year = widget.selected.year;
    _month = widget.selected.month;
  }

  bool _isSelectable(int year, int month) {
    final now = DateTime.now();
    return DateTime(year, month).compareTo(DateTime(now.year, now.month)) <= 0;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Dialog(
      backgroundColor: context.grey50,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                MonthNavButton(
                  icon: Icons.chevron_left_rounded,
                  onTap: () => setState(() => _year--),
                ),
                Text('$_year', style: context.titleSmall.copyWith(fontWeight: .w700)),
                MonthNavButton(
                  icon: Icons.chevron_right_rounded,
                  onTap: _year >= now.year ? null : () => setState(() => _year++),
                  disabled: _year >= now.year,
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 40,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, i) {
                final m = i + 1;
                final selectable = _isSelectable(_year, m);
                final selected = _month == m;
                return GestureDetector(
                  onTap: selectable ? () => setState(() => _month = m) : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: selected
                          ? context.primary
                          : selectable
                          ? context.grey50
                          : Colors.transparent,
                      borderRadius: .circular(8),
                      border: Border.all(
                        color: selected
                            ? context.primary
                            : context.border.withValues(alpha: selectable ? 1.0 : 0.3),
                      ),
                    ),
                    alignment: .center,
                    child: Text(
                      _kMonthNames[i],
                      style: context.labelMedium.copyWith(
                        fontWeight: .w600,
                        color: selected
                            ? AppColors.white
                            : selectable
                            ? context.textPrimary
                            : context.textSecondary.withValues(alpha: 0.35),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: context.border),
                      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                    ),
                    child: Text(
                      'Cancel',
                      style: context.labelMedium.copyWith(color: context.textSecondary),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isSelectable(_year, _month)
                        ? () => Navigator.pop(context, DateTime(_year, _month))
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.primary,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                      elevation: 0,
                    ),
                    child: Text(
                      'Select',
                      style: context.labelMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: .w600,
                      ),
                    ),
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
