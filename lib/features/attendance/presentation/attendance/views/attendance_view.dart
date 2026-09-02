import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/month_navigator.dart';
import '../../../attendance_exports.dart';
import 'widgets/attendance_calendar.dart';
import 'widgets/attendance_donut_chart.dart';
import 'widgets/attendance_types.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

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

class _AttendanceBody extends StatelessWidget {
  const _AttendanceBody();

  void _pickMonth(BuildContext context, DateTime current) {
    final bloc = context.read<AttendanceBloc>();
    showDialog<DateTime>(
      context: context,
      builder: (_) => MonthYearPickerDialog(selected: current),
    ).then((picked) {
      if (picked != null) bloc.add(AttendanceMonthChanged(picked));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.grey50,
      appBar: CustomAppBar(title: 'Attendance'),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: .stretch,
            children: [
              Padding(
                padding: context.pagePadding.copyWith(top: 16, bottom: 0),
                child: MonthNavigator(
                  month: state.selectedMonth,
                  isNextDisabled: state.isCurrentMonth,
                  onPrev: () => context.read<AttendanceBloc>().add(
                    AttendanceMonthChanged(
                      DateTime(state.selectedMonth.year, state.selectedMonth.month - 1),
                    ),
                  ),
                  onNext: () => context.read<AttendanceBloc>().add(
                    AttendanceMonthChanged(
                      DateTime(state.selectedMonth.year, state.selectedMonth.month + 1),
                    ),
                  ),
                  onPick: () => _pickMonth(context, state.selectedMonth),
                ),
              ),
              SizedBox(height: context.gridSpacing),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _AttendanceCard(
                    month: state.selectedMonth,
                    data: state.attendanceData,
                  ),
                ),
              ),
            ],
          );
        },
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
    final presentPct =
        total > 0 ? (present / total * 100).roundToDouble() : 0.0;
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
          const _CardHeader(),
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
          const _StatusLegend(),
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
              fontWeight: .w700,
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
