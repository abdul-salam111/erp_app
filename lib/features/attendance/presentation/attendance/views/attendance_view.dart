import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../attendance_exports.dart';
import 'widgets/attendance_calendar.dart';
import 'widgets/attendance_donut_chart.dart';
import 'widgets/attendance_types.dart';

// ─── AttendanceView ───────────────────────────────────────────────────────────

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AttendanceBloc>(),
      child: const _AttendanceBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _AttendanceBody extends StatefulWidget {
  const _AttendanceBody();

  @override
  State<_AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<_AttendanceBody> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);

  bool get _isCurrentMonth {
    final now = DateTime.now();
    return _month.year == now.year && _month.month == now.month;
  }

  void _pickMonth(BuildContext context) {
    showDialog<DateTime>(
      context: context,
      builder: (_) => _MonthYearPickerDialog(selected: _month),
    ).then((picked) {
      if (picked != null) setState(() => _month = picked);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = attendanceDataFor(_month);
    return Scaffold(
      backgroundColor: context.grey50,
      appBar: CustomAppBar(title: 'Attendance'),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          Padding(
            padding: context.pagePadding.copyWith(top: 16, bottom: 0),
            child: _MonthNavigator(
              month: _month,
              isNextDisabled: _isCurrentMonth,
              onPrev: () => setState(
                () => _month = DateTime(_month.year, _month.month - 1),
              ),
              onNext: () => setState(
                () => _month = DateTime(_month.year, _month.month + 1),
              ),
              onPick: () => _pickMonth(context),
            ),
          ),
          SizedBox(height: context.gridSpacing),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: _AttendanceCard(month: _month, data: data),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Month navigator ──────────────────────────────────────────────────────────

class _MonthNavigator extends StatelessWidget {
  final DateTime month;
  final bool isNextDisabled;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onPick;

  const _MonthNavigator({
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
        _NavBtn(icon: Icons.chevron_left_rounded, onTap: onPrev),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPick,
          child: Row(
            mainAxisSize: .min,
            children: [
              Icon(
                Icons.calendar_month_rounded,
                size: 16,
                color: context.primary,
              ),
              const SizedBox(width: 6),
              Text(
                '${attendanceMonthNames[month.month - 1]} ${month.year}',
                style: context.titleSmall.copyWith(fontWeight: .w700),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        _NavBtn(
          icon: Icons.chevron_right_rounded,
          onTap: isNextDisabled ? null : onNext,
          disabled: isNextDisabled,
        ),
      ],
    );
  }
}

class _NavBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool disabled;

  const _NavBtn({
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

// ─── Month/Year picker dialog ─────────────────────────────────────────────────

class _MonthYearPickerDialog extends StatefulWidget {
  final DateTime selected;
  const _MonthYearPickerDialog({required this.selected});

  @override
  State<_MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<_MonthYearPickerDialog> {
  late int _year;
  late int _month;

  static const _months = attendanceMonthNames;

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
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          children: [
            // Year row
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                _NavBtn(
                  icon: Icons.chevron_left_rounded,
                  onTap: () => setState(() => _year--),
                ),
                Text(
                  '$_year',
                  style: context.titleSmall.copyWith(fontWeight: .w700),
                ),
                _NavBtn(
                  icon: Icons.chevron_right_rounded,
                  onTap: _year >= now.year
                      ? null
                      : () => setState(() => _year++),
                  disabled: _year >= now.year,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Month grid
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
                            : context.border.withValues(
                                alpha: selectable ? 1.0 : 0.3,
                              ),
                      ),
                    ),
                    alignment: .center,
                    child: Text(
                      _months[i],
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
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: context.labelMedium.copyWith(
                        color: context.textSecondary,
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(10),
                      ),
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

// ─── Main card ────────────────────────────────────────────────────────────────

class _AttendanceCard extends StatelessWidget {
  final DateTime month;
  final Map<int, AttendanceDay> data;

  const _AttendanceCard({required this.month, required this.data});

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final present = data.values
        .where((d) => d.status == AttendanceStatus.present)
        .length;
    final absents = data.values
        .where((d) => d.status == AttendanceStatus.absent)
        .length;
    final leaves = data.values
        .where((d) => d.status == AttendanceStatus.leave)
        .length;
    final total = data.values
        .where((d) => d.status != AttendanceStatus.off)
        .length;
    final presentPct = total > 0
        ? (present / total * 100).roundToDouble()
        : 0.0;
    final absentPct = 100.0 - presentPct;

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(16),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          _CardHeader(),
          AttendanceDonutChart(
            presentPct: presentPct,
            absentPct: absentPct,
            centerLabel: 'Attendance',
            centerValue: '$present/$total',
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          _StatsRow(
            daysInMonth: daysInMonth,
            present: present,
            absents: absents,
            leaves: leaves,
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          _StatusLegend(),
          AttendanceCalendar(month: month, data: data),
        ],
      ),
    );
  }
}

// ─── Card header ──────────────────────────────────────────────────────────────

class _CardHeader extends StatelessWidget {
  const _CardHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: Row(
        children: [
          Container(
            padding: .all(7),
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.10),
              borderRadius: .circular(8),
            ),
            child: Icon(
              Icons.calendar_today_rounded,
              size: 16,
              color: context.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Monthly Attendance',
            style: context.titleSmall.copyWith(fontWeight: .w700),
          ),
        ],
      ),
    );
  }
}

// ─── Stats row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  final int daysInMonth;
  final int present;
  final int absents;
  final int leaves;

  const _StatsRow({
    required this.daysInMonth,
    required this.present,
    required this.absents,
    required this.leaves,
  });

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('Total Days', '$daysInMonth'),
      ('Present', '$present'),
      ('Absents', '$absents'),
      ('Leaves', '$leaves'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: List.generate(stats.length, (i) {
          final (label, value) = stats[i];
          final isLast = i == stats.length - 1;
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: isLast
                      ? BorderSide.none
                      : BorderSide(color: context.border),
                ),
              ),
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    label,
                    textAlign: .center,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: context.titleSmall.copyWith(
                      fontWeight: .w700,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── Status legend ────────────────────────────────────────────────────────────

class _StatusLegend extends StatelessWidget {
  const _StatusLegend();

  static const _statuses = AttendanceStatus.values;

  @override
  Widget build(BuildContext context) {
    final row1 = _statuses.take(3).toList();
    final row2 = _statuses.skip(3).toList();
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: row1
                .map((s) => Expanded(child: _StatusChip(status: s)))
                .toList(),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...row2.map((s) => Expanded(child: _StatusChip(status: s))),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final AttendanceStatus status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(color: status.color, shape: .circle),
          alignment: .center,
          child: Text(
            status.code,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          status.label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
