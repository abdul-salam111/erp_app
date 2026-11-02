import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final heroColor = context.isDark
        ? AppColors.navyHeaderDark
        : context.primary;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: .dark,
        statusBarIconBrightness: .light,
      ),
      child: Scaffold(
        backgroundColor: heroColor,
        body: Column(
          children: [
            // ── Hero header — back button + title on the brand color ──
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
                child: Row(
                  children: [
                    const GlassBackButton(),
                    Expanded(
                      child: Text(
                        'Attendance',
                        textAlign: .center,
                        style: context.titleLarge.copyWith(
                          color: AppColors.white,
                          fontWeight: .w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 46),
                  ],
                ),
              ),
            ),
            // ── Rounded sheet — rest of the page rises over the header ──
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.background,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: BlocBuilder<AttendanceBloc, AttendanceState>(
                  builder: (context, state) {
                    final month = state.selectedMonth;
                    final data = state.attendanceData;
                    final present = data.values
                        .where((d) => d.status == AttendanceStatus.present)
                        .length;
                    final absent = data.values
                        .where((d) => d.status == AttendanceStatus.absent)
                        .length;
                    final late = data.values
                        .where((d) => d.status == AttendanceStatus.late)
                        .length;
                    final leave = data.values
                        .where((d) => d.status == AttendanceStatus.leave)
                        .length;

                    return SingleChildScrollView(
                      padding: context.pagePadding.copyWith(
                        top: 16,
                        bottom: 24,
                      ),
                      child: Column(
                        children: [
                          AttendanceCalendarCard(
                            month: month,
                            data: data,
                            isNextDisabled: state.isCurrentMonth,
                            onPrevMonth: () =>
                                context.read<AttendanceBloc>().add(
                                  AttendanceMonthChanged(
                                    DateTime(month.year, month.month - 1),
                                  ),
                                ),
                            onNextMonth: () =>
                                context.read<AttendanceBloc>().add(
                                  AttendanceMonthChanged(
                                    DateTime(month.year, month.month + 1),
                                  ),
                                ),
                            onMonthTap: () => _pickMonth(context, month),
                          ),
                          SizedBox(height: context.gridSpacing + 4),
                          AttendanceDonutCard(
                            present: present,
                            absent: absent,
                            late: late,
                            leave: leave,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
