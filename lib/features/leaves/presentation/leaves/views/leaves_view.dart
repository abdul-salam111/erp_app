import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../leaves_exports.dart';

// ─── Enums & models ──────────────────────────────────────────────────────────

enum _LeaveStatus { accepted, pending, rejected }

extension _LeaveStatusExt on _LeaveStatus {
  String get label => switch (this) {
        _LeaveStatus.accepted => 'Accepted',
        _LeaveStatus.pending  => 'Pending',
        _LeaveStatus.rejected => 'Rejected',
      };

  Color get color => switch (this) {
        _LeaveStatus.accepted => AppColors.primary,
        _LeaveStatus.pending  => AppColors.orange,
        _LeaveStatus.rejected => AppColors.errorBright,
      };
}

enum _LeaveType { sick, other }

class _LeaveRequest {
  final int days;
  final String dateLabel;
  final _LeaveStatus status;
  final _LeaveType type;

  const _LeaveRequest({
    required this.days,
    required this.dateLabel,
    required this.status,
    required this.type,
  });
}

// ─── Dummy data ───────────────────────────────────────────────────────────────

const _jul2025 = <_LeaveRequest>[
  _LeaveRequest(days: 1, dateLabel: '16 Aug 2025', status: _LeaveStatus.accepted, type: _LeaveType.sick),
  _LeaveRequest(days: 3, dateLabel: '12-14 Jul 2025', status: _LeaveStatus.accepted, type: _LeaveType.other),
  _LeaveRequest(days: 2, dateLabel: '5-6 Jun 2025', status: _LeaveStatus.pending, type: _LeaveType.sick),
];

const _jun2025 = <_LeaveRequest>[
  _LeaveRequest(days: 5, dateLabel: '2-6 Jun 2025', status: _LeaveStatus.accepted, type: _LeaveType.sick),
  _LeaveRequest(days: 1, dateLabel: '20 Jun 2025', status: _LeaveStatus.rejected, type: _LeaveType.other),
];

List<_LeaveRequest> _dataFor(DateTime m) {
  if (m.year == 2025 && m.month == 7) return _jul2025;
  if (m.year == 2025 && m.month == 6) return _jun2025;
  return [];
}

const _monthNames = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

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

class _LeavesBody extends StatefulWidget {
  const _LeavesBody();

  @override
  State<_LeavesBody> createState() => _LeavesBodyState();
}

class _LeavesBodyState extends State<_LeavesBody> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);

  bool get _isCurrentMonth {
    final now = DateTime.now();
    return _month.year == now.year && _month.month == now.month;
  }

  void _pickMonth() {
    showDialog<DateTime>(
      context: context,
      builder: (_) => _MonthYearPickerDialog(selected: _month),
    ).then((picked) {
      if (picked != null) setState(() => _month = picked);
    });
  }

  @override
  Widget build(BuildContext context) {
    final leaves = _dataFor(_month);
    final total  = leaves.fold(0, (s, l) => s + l.days);
    final sick   = leaves.where((l) => l.type == _LeaveType.sick).fold(0, (s, l) => s + l.days);
    final other  = leaves.where((l) => l.type == _LeaveType.other).fold(0, (s, l) => s + l.days);

    return Scaffold(
      backgroundColor: context.white,
      appBar: CustomAppBar(title: 'Leave Requests'),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          // ── Month navigator ──
          ColoredBox(
            color: context.grey50,
            child: Padding(
            padding: context.pagePadding.copyWith(top: 16, bottom: 16),
            child: _MonthNavigator(
              month: _month,
              isNextDisabled: _isCurrentMonth,
              onPrev: () => setState(
                () => _month = DateTime(_month.year, _month.month - 1),
              ),
              onNext: () => setState(
                () => _month = DateTime(_month.year, _month.month + 1),
              ),
              onPick: _pickMonth,
            ),
          ),
          ),
          SizedBox(height: context.gridSpacing),
          // ── Scrollable body ──
          Expanded(
            child: SingleChildScrollView(
              padding: context.pagePadding.copyWith(top: 0, bottom: 24),
              child: _LeavesContent(
                leaves: leaves,
                total: total,
                sick: sick,
                other: other,
              ),
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
              Icon(Icons.calendar_month_rounded, size: 16, color: context.primary),
              const SizedBox(width: 6),
              Text(
                '${_monthNames[month.month - 1]} ${month.year}',
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

  const _NavBtn({required this.icon, required this.onTap, this.disabled = false});

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

// ─── Month/year picker ────────────────────────────────────────────────────────

class _MonthYearPickerDialog extends StatefulWidget {
  final DateTime selected;
  const _MonthYearPickerDialog({required this.selected});

  @override
  State<_MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<_MonthYearPickerDialog> {
  late int _year;
  late int _month;

  @override
  void initState() {
    super.initState();
    _year  = widget.selected.year;
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
                _NavBtn(
                  icon: Icons.chevron_left_rounded,
                  onTap: () => setState(() => _year--),
                ),
                Text('$_year', style: context.titleSmall.copyWith(fontWeight: .w700)),
                _NavBtn(
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
                      _monthNames[i],
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

// ─── Main content ─────────────────────────────────────────────────────────────

class _LeavesContent extends StatelessWidget {
  final List<_LeaveRequest> leaves;
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      
      children: [
        // ── Stats card ──
        _StatsCard(total: total, sick: sick, other: other),
        const SizedBox(height: 12),
        // ── Leave Application button ──
        Align(
          alignment: .centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: context.primary.withValues(alpha: 0.08),
                borderRadius: .circular(20),
                border: Border.all(color: context.primary.withValues(alpha: 0.25)),
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(Icons.add_rounded, size: 15, color: context.primary),
                  const SizedBox(width: 4),
                  Text(
                    'Leave Application',
                    style: context.labelMedium.copyWith(
                      color: context.primary,
                      fontWeight: .w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        // ── Leave list ──
        if (leaves.isEmpty)
          _EmptyState()
        else
          _LeaveList(leaves: leaves),
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
                        : Colors.transparent,
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
  final List<_LeaveRequest> leaves;
  const _LeaveList({required this.leaves});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(leaves.length, (i) {
        final isLast = i == leaves.length - 1;
        return Column(
          children: [
            _LeaveTile(leave: leaves[i]),
            if (!isLast)
              Divider(height: 1, thickness: 1, color: context.border),
          ],
        );
      }),
    );
  }
}

class _LeaveTile extends StatelessWidget {
  final _LeaveRequest leave;
  const _LeaveTile({required this.leave});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.white,
      child: Padding(
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
                      Icon(
                        Iconsax.calendar_1,
                        size: 13,
                        color: context.textSecondary,
                      ),
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
                Icon(
                  Iconsax.notification,
                  size: 14,
                  color: leave.status.color,
                ),
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
                Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: context.textSecondary,
                ),
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
