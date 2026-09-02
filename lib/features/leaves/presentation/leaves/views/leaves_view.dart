import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/month_navigator.dart';
import '../../../../../routes/route_exports.dart';
import '../../../leaves_exports.dart';
import '../models/leave_request_model.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class LeavesView extends StatelessWidget {
  const LeavesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LeavesBloc>(),
      child: const _LeavesBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _LeavesBody extends StatelessWidget {
  const _LeavesBody();

  void _pickMonth(BuildContext context, DateTime current) {
    final bloc = context.read<LeavesBloc>();
    showDialog<DateTime>(
      context: context,
      builder: (_) => MonthYearPickerDialog(selected: current),
    ).then((picked) {
      if (picked != null) bloc.add(LeavesMonthChanged(picked));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: context.pagePadding.copyWith(top: 12, bottom: 15),
          child: CustomButton(
            text: 'Leave Application',
            onPressed: () => context.pushNamed(RouteNames.apply_leave),
            icon: Icons.add_rounded,
            iconSize: 18,
            isOutlined: true,
            radius: 12,
            elevation: 0,
            fontsize: 14,
            size: const Size(double.infinity, 48),
          ),
        ),
      ),
   
      appBar: CustomAppBar(title: 'Leave Requests'),
      body: BlocBuilder<LeavesBloc, LeavesState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: .stretch,
            children: [
              ColoredBox(
                color: context.grey50,
                child: Padding(
                  padding: context.pagePadding.copyWith(top: 16, bottom: 16),
                  child: MonthNavigator(
                    month: state.selectedMonth,
                    isNextDisabled: state.isCurrentMonth,
                    onPrev: () => context.read<LeavesBloc>().add(
                      LeavesMonthChanged(DateTime(
                        state.selectedMonth.year,
                        state.selectedMonth.month - 1,
                      )),
                    ),
                    onNext: () => context.read<LeavesBloc>().add(
                      LeavesMonthChanged(DateTime(
                        state.selectedMonth.year,
                        state.selectedMonth.month + 1,
                      )),
                    ),
                    onPick: () => _pickMonth(context, state.selectedMonth),
                  ),
                ),
              ),
              SizedBox(height: context.gridSpacing),
              Expanded(
                child: SingleChildScrollView(
                  padding: context.pagePadding.copyWith(top: 0, bottom: 24),
                  child: _LeavesContent(
                    leaves: state.leaves,
                    total: state.totalDays,
                    sick: state.sickDays,
                    other: state.otherDays,
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

// ─── Main content ─────────────────────────────────────────────────────────────

class _LeavesContent extends StatefulWidget {
  final List<LeaveRequest> leaves;
  final int total;
  final int sick;
  final int other;

  const _LeavesContent({
    required this.leaves,
    required this.total,
    required this.sick,
    required this.other,
  });

  @override
  State<_LeavesContent> createState() => _LeavesContentState();
}

class _LeavesContentState extends State<_LeavesContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<Animation<double>> _fades;
  late List<Animation<Offset>> _slides;

  static const _offscreen = Offset(0, 0.06);

  void _buildAnimations() {
    final count = widget.leaves.length;
    // index 0 = stats card, 1..N = leave tiles
    _fades = [
      _fade(0.00, 0.45),
      for (int i = 0; i < count; i++)
        _fade(0.20 + i * 0.07, 0.55 + i * 0.07),
    ];
    _slides = [
      _slide(0.00, 0.45),
      for (int i = 0; i < count; i++)
        _slide(0.20 + i * 0.07, 0.55 + i * 0.07),
    ];
  }

  Animation<double> _fade(double start, double end) => CurvedAnimation(
        parent: _ctrl,
        curve: Interval(start, end, curve: Curves.easeOut),
      );

  Animation<Offset> _slide(double start, double end) =>
      Tween<Offset>(begin: _offscreen, end: Offset.zero).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _buildAnimations();
    _ctrl.forward();
  }

  @override
  void didUpdateWidget(_LeavesContent old) {
    super.didUpdateWidget(old);
    if (old.leaves != widget.leaves) {
      _ctrl.reset();
      _buildAnimations();
      _ctrl.forward();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        FadeTransition(
          opacity: _fades[0],
          child: SlideTransition(
            position: _slides[0],
            child: _StatsCard(
              total: widget.total,
              sick: widget.sick,
              other: widget.other,
            ),
          ),
        ),
        const SizedBox(height: 14),
        if (widget.leaves.isEmpty)
          const _EmptyState()
        else
          _LeaveList(leaves: widget.leaves, fades: _fades, slides: _slides),
      ],
    );
  }
}

// ─── Stats card ───────────────────────────────────────────────────────────────

class _StatsCard extends StatefulWidget {
  final int total;
  final int sick;
  final int other;

  const _StatsCard({required this.total, required this.sick, required this.other});

  @override
  State<_StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends State<_StatsCard> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ('Total Leaves', widget.total),
      ('Sick Leaves', widget.sick),
      ('Other Leaves', widget.other),
    ];

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(12),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: .circular(12),
        child: Row(
          children: List.generate(tabs.length, (i) {
            final (label, count) = tabs[i];
            final isSelected = _selected == i;
            final isLast = i == tabs.length - 1;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.primary.withValues(alpha: 0.05)
                        : context.transparent,
                    border: Border(
                      right: isLast
                          ? BorderSide.none
                          : BorderSide(color: context.border),
                      bottom: isSelected
                          ? BorderSide(color: context.primary, width: 2)
                          : BorderSide.none,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    mainAxisSize: .min,
                    children: [
                      Flexible(
                        child: Text(
                          label,
                          textAlign: .center,
                          overflow: .ellipsis,
                          style: context.labelSmall.copyWith(
                            color: isSelected
                                ? context.primary
                                : context.textSecondary,
                            fontWeight: isSelected ? .w600 : .w400,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? context.primary
                              : context.grey50,
                          borderRadius: .circular(10),
                          border: isSelected
                              ? null
                              : Border.all(color: context.border),
                        ),
                        child: Text(
                          '$count',
                          style: context.labelSmall.copyWith(
                            color: isSelected
                                ? AppColors.white
                                : context.textSecondary,
                            fontWeight: .w700,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ─── Leave list ───────────────────────────────────────────────────────────────

class _LeaveList extends StatelessWidget {
  final List<LeaveRequest> leaves;
  final List<Animation<double>> fades;
  final List<Animation<Offset>> slides;

  const _LeaveList({
    required this.leaves,
    required this.fades,
    required this.slides,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(leaves.length, (i) {
        final isLast = i == leaves.length - 1;
        // fades/slides index 0 is the stats card, tiles start at 1
        return FadeTransition(
          opacity: fades[i + 1],
          child: SlideTransition(
            position: slides[i + 1],
            child: Column(
              children: [
                _LeaveTile(leave: leaves[i]),
                if (!isLast) Divider(height: 1, thickness: 1, color: context.border),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _LeaveTile extends StatelessWidget {
  final LeaveRequest leave;
  const _LeaveTile({required this.leave});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouteNames.leave_detail,
        extra: LeaveDetailArgs(
          requestedBy: leave.requestedBy,
          requestedAt: leave.requestedAt,
          leaveDates: leave.dateLabel,
          leaveType: leave.type.label,
          status: leave.status.label,
          statusColor: leave.status.color,
          detail: leave.detail,
          fileNames: leave.fileNames,
        ),
      ),
      child: Container(
        color: context.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    '${leave.days} Day${leave.days > 1 ? 's' : ''} Leave Request',
                    style: context.labelMedium.copyWith(
                      fontWeight: .w700,
                      color: context.textPrimary,
                      fontSize: 13.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Iconsax.calendar_1, size: 13, color: context.textSecondary),
                      const SizedBox(width: 5),
                      Text(
                        'Date(s): ${leave.dateLabel}',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisSize: .min,
              children: [
                Icon(Iconsax.notification, size: 14, color: leave.status.color),
                const SizedBox(width: 5),
                Text(
                  leave.status.label,
                  style: context.labelMedium.copyWith(
                    color: leave.status.color,
                    fontWeight: .w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(Icons.chevron_right_rounded, size: 18, color: context.textSecondary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(14),
        border: Border.all(color: context.border),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Icon(Iconsax.calendar_remove, size: 40, color: context.border),
          const SizedBox(height: 12),
          Text(
            'No leave requests this month',
            style: context.labelMedium.copyWith(color: context.textSecondary),
          ),
        ],
      ),
    );
  }
}
