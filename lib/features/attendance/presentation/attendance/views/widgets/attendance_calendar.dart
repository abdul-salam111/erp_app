import 'package:flutter/material.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';
import 'attendance_types.dart';

// A full month-grid calendar (Sun-first) with a prev/next month nav header,
// a small status dot under each day, and a dot-key legend underneath.
class AttendanceCalendarCard extends StatelessWidget {
  final DateTime month;
  final Map<int, AttendanceDay> data;
  final bool isNextDisabled;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onMonthTap;

  const AttendanceCalendarCard({
    super.key,
    required this.month,
    required this.data,
    required this.isNextDisabled,
    required this.onPrevMonth,
    required this.onNextMonth,
    required this.onMonthTap,
  });

  static const _weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstWeekday = DateTime(month.year, month.month, 1).weekday;
    final leadingBlanks = firstWeekday % 7;
    final totalCells = ((leadingBlanks + daysInMonth) / 7).ceil() * 7;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.isDark ? context.navyCard : context.surfaceElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.isDark ? context.navyBorder : context.border,
        ),
        boxShadow: context.isDark
            ? null
            : [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.06),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _NavChevron(
                icon: Icons.chevron_left_rounded,
                onTap: onPrevMonth,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onMonthTap,
                  child: Text(
                    '${attendanceMonthNames[month.month - 1]} ${month.year}',
                    textAlign: .center,
                    style: context.titleSmall.copyWith(
                      fontWeight: .w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              _NavChevron(
                icon: Icons.chevron_right_rounded,
                onTap: isNextDisabled ? null : onNextMonth,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: _weekdays
                .map(
                  (d) => Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 10,
                          fontWeight: .w600,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 4),
          Column(
            children: List.generate((totalCells / 7).ceil(), (week) {
              return Row(
                children: List.generate(7, (col) {
                  final cell = week * 7 + col;
                  final day = cell - leadingBlanks + 1;
                  if (day < 1 || day > daysInMonth) {
                    return const Expanded(child: SizedBox(height: 44));
                  }
                  return Expanded(child: _DayCell(day: day, dayData: data[day]));
                }),
              );
            }),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: .center,
            spacing: 16,
            runSpacing: 8,
            children: [
              _LegendDot(
                color: AttendanceStatus.absent.color,
                label: AttendanceStatus.absent.label,
              ),
              _LegendDot(
                color: AttendanceStatus.late.color,
                label: AttendanceStatus.late.label,
              ),
              _LegendDot(
                color: AttendanceStatus.leave.color,
                label: AttendanceStatus.leave.label,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final int day;
  final AttendanceDay? dayData;

  const _DayCell({required this.day, required this.dayData});

  @override
  Widget build(BuildContext context) {
    final status = dayData?.status;
    final isOff = status == AttendanceStatus.off;
    // Present is the default/expected outcome, so it doesn't need a dot —
    // only the exceptions (absent/late/leave) are worth calling out.
    final showDot = status != null && !isOff && status != AttendanceStatus.present;

    final Color textColor;
    if (dayData == null || isOff) {
      textColor = context.textSecondary.withValues(alpha: 0.5);
    } else if (status == AttendanceStatus.present) {
      textColor = context.textPrimary;
    } else {
      textColor = status!.color;
    }

    return SizedBox(
      height: 44,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            '$day',
            style: context.bodySmall.copyWith(
              fontWeight: .w600,
              fontSize: 12,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: .circle,
              color: showDot ? status.color : context.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavChevron extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavChevron({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return Material(
      color: context.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            icon,
            size: 22,
            color: enabled
                ? context.textPrimary
                : context.textSecondary.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: .circle, color: color),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
