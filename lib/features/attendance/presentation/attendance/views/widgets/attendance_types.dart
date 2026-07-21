import 'package:flutter/material.dart';
import '../../../../../../core/theme/colors.dart';

enum AttendanceStatus { present, leave, absent, late, off }

extension AttendanceStatusExt on AttendanceStatus {
  String get code => switch (this) {
        AttendanceStatus.present => 'P',
        AttendanceStatus.leave   => 'L',
        AttendanceStatus.absent  => 'A',
        AttendanceStatus.late    => 'T',
        AttendanceStatus.off     => 'O',
      };

  Color get color => switch (this) {
        AttendanceStatus.present => AppColors.primary,
        AttendanceStatus.leave   => AppColors.purple,
        AttendanceStatus.absent  => AppColors.errorBright,
        AttendanceStatus.late    => AppColors.teal,
        AttendanceStatus.off     => AppColors.grey300,
      };

  String get label => switch (this) {
        AttendanceStatus.present => 'Present',
        AttendanceStatus.leave   => 'Leave',
        AttendanceStatus.absent  => 'Absent',
        AttendanceStatus.late    => 'Late',
        AttendanceStatus.off     => 'Off',
      };
}

class AttendanceDay {
  final AttendanceStatus status;
  const AttendanceDay(this.status);
}

// June 2026 — full month (30 days, starts Monday)
const _jun2026 = <int, AttendanceDay>{
  1:  AttendanceDay(AttendanceStatus.present),
  2:  AttendanceDay(AttendanceStatus.present),
  3:  AttendanceDay(AttendanceStatus.present),
  4:  AttendanceDay(AttendanceStatus.present),
  5:  AttendanceDay(AttendanceStatus.present),
  6:  AttendanceDay(AttendanceStatus.off),
  7:  AttendanceDay(AttendanceStatus.off),
  8:  AttendanceDay(AttendanceStatus.present),
  9:  AttendanceDay(AttendanceStatus.late),
  10: AttendanceDay(AttendanceStatus.present),
  11: AttendanceDay(AttendanceStatus.present),
  12: AttendanceDay(AttendanceStatus.present),
  13: AttendanceDay(AttendanceStatus.off),
  14: AttendanceDay(AttendanceStatus.off),
  15: AttendanceDay(AttendanceStatus.leave),
  16: AttendanceDay(AttendanceStatus.leave),
  17: AttendanceDay(AttendanceStatus.present),
  18: AttendanceDay(AttendanceStatus.present),
  19: AttendanceDay(AttendanceStatus.present),
  20: AttendanceDay(AttendanceStatus.off),
  21: AttendanceDay(AttendanceStatus.off),
  22: AttendanceDay(AttendanceStatus.present),
  23: AttendanceDay(AttendanceStatus.present),
  24: AttendanceDay(AttendanceStatus.absent),
  25: AttendanceDay(AttendanceStatus.present),
  26: AttendanceDay(AttendanceStatus.present),
  27: AttendanceDay(AttendanceStatus.off),
  28: AttendanceDay(AttendanceStatus.off),
  29: AttendanceDay(AttendanceStatus.present),
  30: AttendanceDay(AttendanceStatus.present),
};

// July 2026 — current month, only days 1–21 recorded (today = Jul 21)
const _jul2026 = <int, AttendanceDay>{
  1:  AttendanceDay(AttendanceStatus.present),
  2:  AttendanceDay(AttendanceStatus.present),
  3:  AttendanceDay(AttendanceStatus.present),
  4:  AttendanceDay(AttendanceStatus.off),
  5:  AttendanceDay(AttendanceStatus.off),
  6:  AttendanceDay(AttendanceStatus.present),
  7:  AttendanceDay(AttendanceStatus.late),
  8:  AttendanceDay(AttendanceStatus.present),
  9:  AttendanceDay(AttendanceStatus.present),
  10: AttendanceDay(AttendanceStatus.present),
  11: AttendanceDay(AttendanceStatus.off),
  12: AttendanceDay(AttendanceStatus.off),
  13: AttendanceDay(AttendanceStatus.present),
  14: AttendanceDay(AttendanceStatus.present),
  15: AttendanceDay(AttendanceStatus.present),
  16: AttendanceDay(AttendanceStatus.absent),
  17: AttendanceDay(AttendanceStatus.present),
  18: AttendanceDay(AttendanceStatus.off),
  19: AttendanceDay(AttendanceStatus.off),
  20: AttendanceDay(AttendanceStatus.present),
  21: AttendanceDay(AttendanceStatus.present),
};

// Aug 2025 — kept for historical reference
const _aug2025 = <int, AttendanceDay>{
  1:  AttendanceDay(AttendanceStatus.present),
  2:  AttendanceDay(AttendanceStatus.off),
  3:  AttendanceDay(AttendanceStatus.off),
  4:  AttendanceDay(AttendanceStatus.present),
  5:  AttendanceDay(AttendanceStatus.present),
  6:  AttendanceDay(AttendanceStatus.present),
  7:  AttendanceDay(AttendanceStatus.late),
  8:  AttendanceDay(AttendanceStatus.leave),
  9:  AttendanceDay(AttendanceStatus.off),
  10: AttendanceDay(AttendanceStatus.off),
  11: AttendanceDay(AttendanceStatus.present),
  12: AttendanceDay(AttendanceStatus.off),
  13: AttendanceDay(AttendanceStatus.late),
  14: AttendanceDay(AttendanceStatus.late),
  15: AttendanceDay(AttendanceStatus.late),
  16: AttendanceDay(AttendanceStatus.late),
  17: AttendanceDay(AttendanceStatus.late),
  18: AttendanceDay(AttendanceStatus.leave),
  19: AttendanceDay(AttendanceStatus.off),
  20: AttendanceDay(AttendanceStatus.absent),
  21: AttendanceDay(AttendanceStatus.absent),
  22: AttendanceDay(AttendanceStatus.absent),
  23: AttendanceDay(AttendanceStatus.off),
  24: AttendanceDay(AttendanceStatus.off),
  25: AttendanceDay(AttendanceStatus.present),
  26: AttendanceDay(AttendanceStatus.present),
  27: AttendanceDay(AttendanceStatus.present),
  28: AttendanceDay(AttendanceStatus.absent),
  29: AttendanceDay(AttendanceStatus.present),
  30: AttendanceDay(AttendanceStatus.present),
  31: AttendanceDay(AttendanceStatus.present),
};

Map<int, AttendanceDay> attendanceDataFor(DateTime m) {
  if (m.year == 2026 && m.month == 7) return _jul2026;
  if (m.year == 2026 && m.month == 6) return _jun2026;
  if (m.year == 2025 && m.month == 8) return _aug2025;
  return {};
}

const attendanceMonthNames = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];
