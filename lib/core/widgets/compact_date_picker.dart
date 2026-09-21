import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';

Future<DateTime?> showCompactDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  final clamped = initialDate.isBefore(firstDate)
      ? firstDate
      : initialDate.isAfter(lastDate)
      ? lastDate
      : initialDate;
  return showDialog<DateTime>(
    context: context,
    builder: (_) => _CompactDatePickerDialog(
      initialDate: clamped,
      firstDate: firstDate,
      lastDate: lastDate,
    ),
  );
}

class _CompactDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const _CompactDatePickerDialog({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  State<_CompactDatePickerDialog> createState() =>
      _CompactDatePickerDialogState();
}

class _CompactDatePickerDialogState extends State<_CompactDatePickerDialog> {
  late DateTime _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);

    final content = Column(
      mainAxisSize: .min,
      children: [
        _GlassCalendar(
          selected: _selected,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          onDateChanged: (d) => setState(() => _selected = d),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: context.isDark
              ? AppColors.white.withValues(alpha: 0.10)
              : Theme.of(context).dividerColor,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          child: Row(
            mainAxisAlignment: .end,
            children: [
              _DialogActionButton(
                label: 'Cancel',
                isDark: context.isDark,
                color: context.textSecondary,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(width: 10),
              _DialogActionButton(
                label: 'OK',
                isDark: context.isDark,
                color: baseTheme.colorScheme.primary,
                onTap: () => Navigator.pop(context, _selected),
              ),
            ],
          ),
        ),
      ],
    );

    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 48, vertical: 60),
      child: context.isDark
          ? GlassContainer(
              shape: const LiquidRoundedSuperellipse(borderRadius: 16),
              child: content,
            )
          : Material(
              color:
                  baseTheme.dialogTheme.backgroundColor ??
                  baseTheme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: .antiAlias,
              child: content,
            ),
    );
  }
}

// ─── Custom calendar with glass month arrows + selected-day ───────────────────

class _GlassCalendar extends StatefulWidget {
  final DateTime selected;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateChanged;

  const _GlassCalendar({
    required this.selected,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
  });

  @override
  State<_GlassCalendar> createState() => _GlassCalendarState();
}

class _GlassCalendarState extends State<_GlassCalendar> {
  late DateTime _month;
  bool _yearMode = false;

  static const _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const _weekdayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  void initState() {
    super.initState();
    _month = DateTime(widget.selected.year, widget.selected.month);
  }

  bool get _canPrev {
    final prev = DateTime(_month.year, _month.month - 1);
    final firstMonth = DateTime(widget.firstDate.year, widget.firstDate.month);
    return !prev.isBefore(firstMonth);
  }

  bool get _canNext {
    final next = DateTime(_month.year, _month.month + 1);
    final lastMonth = DateTime(widget.lastDate.year, widget.lastDate.month);
    return !next.isAfter(lastMonth);
  }

  void _prevMonth() {
    if (!_canPrev) return;
    setState(() => _month = DateTime(_month.year, _month.month - 1));
  }

  void _nextMonth() {
    if (!_canNext) return;
    setState(() => _month = DateTime(_month.year, _month.month + 1));
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 8),
      child: Column(
        mainAxisSize: .min,
        children: [
          _header(context),
          const SizedBox(height: 10),
          if (_yearMode) _yearPicker(context) else _dayGrid(context),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        _NavArrow(
          icon: Icons.chevron_left_rounded,
          enabled: _canPrev,
          onTap: _prevMonth,
        ),
        Expanded(
          child: Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => setState(() => _yearMode = !_yearMode),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    Text(
                      '${_monthNames[_month.month - 1]} ${_month.year}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: context.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _yearMode
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      size: 22,
                      color: context.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _NavArrow(
          icon: Icons.chevron_right_rounded,
          enabled: _canNext,
          onTap: _nextMonth,
        ),
      ],
    );
  }

  Widget _dayGrid(BuildContext context) {
    final firstOfMonth = DateTime(_month.year, _month.month, 1);
    final daysInMonth = DateTime(_month.year, _month.month + 1, 0).day;
    final leading = firstOfMonth.weekday % 7; // Sunday-first
    final totalCells = ((leading + daysInMonth) / 7).ceil() * 7;

    final today = DateTime.now();

    return Column(
      children: [
        Row(
          children: List.generate(
            7,
            (i) => Expanded(
              child: Center(
                child: Text(
                  _weekdayLabels[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: context.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        for (int row = 0; row < totalCells ~/ 7; row++)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: List.generate(7, (col) {
                final idx = row * 7 + col;
                final dayNum = idx - leading + 1;
                if (dayNum < 1 || dayNum > daysInMonth) {
                  return const Expanded(child: SizedBox(height: 38));
                }
                final date = DateTime(_month.year, _month.month, dayNum);
                final isSelected = _isSameDay(date, widget.selected);
                final isToday = _isSameDay(date, today);
                final isDisabled =
                    date.isBefore(widget.firstDate) ||
                    date.isAfter(widget.lastDate);
                return Expanded(
                  child: Center(
                    child: _DayCell(
                      day: dayNum,
                      isSelected: isSelected,
                      isToday: isToday,
                      isDisabled: isDisabled,
                      onTap: isDisabled
                          ? null
                          : () => widget.onDateChanged(date),
                    ),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }

  Widget _yearPicker(BuildContext context) {
    final currentYear = _month.year;
    final years = List.generate(
      widget.lastDate.year - widget.firstDate.year + 1,
      (i) => widget.firstDate.year + i,
    );
    return SizedBox(
      height: 240,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: years.length,
        itemBuilder: (_, i) {
          final year = years[i];
          final isSelected = year == currentYear;
          return _YearCell(
            year: year,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                _month = DateTime(year, _month.month);
                _yearMode = false;
              });
            },
          );
        },
      ),
    );
  }
}

// ─── Nav arrow (glass in dark) ─────────────────────────────────────────────────

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;
  const _NavArrow({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = enabled
        ? context.textPrimary
        : context.textSecondary.withValues(alpha: 0.4);

    if (context.isDark) {
      return Opacity(
        opacity: enabled ? 1 : 0.35,
        child: GlassIconButton(
          onPressed: enabled ? onTap : () {},
          size: 36,
          iconSize: 20,
          shape: GlassIconButtonShape.roundedSquare,
          borderRadius: 10,
          icon: Icon(icon, size: 20, color: iconColor),
        ),
      );
    }

    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        icon: Icon(icon, size: 22, color: iconColor),
        onPressed: enabled ? onTap : null,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

// ─── Day cell (glass in dark when selected) ────────────────────────────────────

class _DayCell extends StatelessWidget {
  final int day;
  final bool isSelected;
  final bool isToday;
  final bool isDisabled;
  final VoidCallback? onTap;

  const _DayCell({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.isDisabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final textColor = isDisabled
        ? context.textSecondary.withValues(alpha: 0.4)
        : isSelected
        ? (context.isDark ? context.textPrimary : Theme.of(context).colorScheme.onPrimary)
        : context.textPrimary;

    final label = Text(
      '$day',
      style: TextStyle(
        fontSize: 16,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        color: textColor,
      ),
    );

    Widget cell;
    if (isSelected) {
      if (context.isDark) {
        cell = SizedBox(
          width: 38,
          height: 38,
          child: GlassContainer(
            shape: const LiquidOval(),
            alignment: Alignment.center,
            child: label,
          ),
        );
      } else {
        cell = Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: label,
        );
      }
    } else {
      cell = Container(
        width: 38,
        height: 38,
        decoration: isToday
            ? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primary, width: 1.4),
              )
            : null,
        alignment: Alignment.center,
        child: label,
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: cell,
    );
  }
}

// ─── Year cell ─────────────────────────────────────────────────────────────────

class _YearCell extends StatelessWidget {
  final int year;
  final bool isSelected;
  final VoidCallback onTap;
  const _YearCell({
    required this.year,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final label = Text(
      '$year',
      style: TextStyle(
        fontSize: 15,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        color: isSelected
            ? (context.isDark
                  ? context.textPrimary
                  : Theme.of(context).colorScheme.onPrimary)
            : context.textPrimary,
      ),
    );

    if (isSelected) {
      if (context.isDark) {
        return GestureDetector(
          onTap: onTap,
          child: GlassContainer(
            shape: const LiquidRoundedSuperellipse(borderRadius: 10),
            alignment: Alignment.center,
            child: label,
          ),
        );
      }
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: label,
        ),
      );
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Center(child: label),
    );
  }
}

// ─── Dialog action button ──────────────────────────────────────────────────────

class _DialogActionButton extends StatelessWidget {
  final String label;
  final bool isDark;
  final Color color;
  final VoidCallback onTap;

  const _DialogActionButton({
    required this.label,
    required this.isDark,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final labelWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );

    if (isDark) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: GlassContainer(
          shape: const LiquidRoundedSuperellipse(borderRadius: 12),
          child: labelWidget,
        ),
      );
    }
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}
