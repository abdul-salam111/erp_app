import 'package:flutter/material.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';
import 'attendance_types.dart';

class AttendanceCalendar extends StatelessWidget {
  final DateTime month;
  final Map<int, AttendanceDay> data;

  const AttendanceCalendar({
    super.key,
    required this.month,
    required this.data,
  });

  static const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final firstWeekday  = DateTime(month.year, month.month, 1).weekday;
    final daysInMonth   = DateTime(month.year, month.month + 1, 0).day;
    final leadingBlanks = firstWeekday - 1;
    final rows          = ((leadingBlanks + daysInMonth) / 7).ceil();
    final borderColor   = context.border;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Column(
        children: [
          // Day-of-week header
          Container(
            color: context.grey50,
            child: Row(
              children: _weekdays.map((d) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Center(
                      child: Text(
                        d,
                        style: context.labelSmall.copyWith(
                          fontSize: 10,
                          fontWeight: .w600,
                          color: context.textSecondary,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Grid rows
          for (int row = 0; row < rows; row++)
            Row(
              children: List.generate(7, (col) {
                final idx     = row * 7 + col;
                final day     = idx - leadingBlanks + 1;
                final isLast  = col == 6;
                final isBottom = row == rows - 1;
                final border  = Border(
                  right:  isLast  ? BorderSide.none : BorderSide(color: borderColor),
                  bottom: isBottom ? BorderSide.none : BorderSide(color: borderColor),
                );

                if (day < 1 || day > daysInMonth) {
                  return Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(border: border),
                    ),
                  );
                }
                return Expanded(
                  child: _CalendarCell(
                    day: day,
                    dayData: data[day],
                    border: border,
                  ),
                );
              }),
            ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

class _CalendarCell extends StatelessWidget {
  final int day;
  final AttendanceDay? dayData;
  final Border border;

  const _CalendarCell({
    required this.day,
    required this.dayData,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(border: border),
      child: Column(
        children: [
          Align(
            alignment: .topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 4, top: 2),
              child: Text(
                '$day',
                style: context.labelSmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 9,
                ),
              ),
            ),
          ),
          const Spacer(),
          if (dayData != null)
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: dayData!.status.color,
                shape: .circle,
              ),
              alignment: .center,
              child: Text(
                dayData!.status.code,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          else
            const SizedBox(height: 28),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
