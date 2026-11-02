import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';
import 'attendance_types.dart';

// Full circular donut split across present/absent/late/leave, with the
// present percentage in the center and a count-per-status grid on the side.
class AttendanceDonutCard extends StatefulWidget {
  final int present;
  final int absent;
  final int late;
  final int leave;

  const AttendanceDonutCard({
    super.key,
    required this.present,
    required this.absent,
    required this.late,
    required this.leave,
  });

  @override
  State<AttendanceDonutCard> createState() => _AttendanceDonutCardState();
}

class _AttendanceDonutCardState extends State<AttendanceDonutCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _progress = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void didUpdateWidget(AttendanceDonutCard old) {
    super.didUpdateWidget(old);
    if (old.present != widget.present ||
        old.absent != widget.absent ||
        old.late != widget.late ||
        old.leave != widget.leave) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.present + widget.absent + widget.late + widget.leave;
    final presentPercent = total == 0
        ? 0
        : (widget.present / total * 100).round();

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
      child: Row(
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: AnimatedBuilder(
              animation: _progress,
              builder: (context, _) {
                final t = _progress.value;
                return Stack(
                  alignment: .center,
                  children: [
                    PieChart(
                      PieChartData(
                        startDegreeOffset: -90,
                        sectionsSpace: 3,
                        centerSpaceRadius: 42,
                        sections: total == 0
                            ? [
                                PieChartSectionData(
                                  value: 1,
                                  color: context.border,
                                  radius: 20,
                                  showTitle: false,
                                ),
                              ]
                            : [
                                PieChartSectionData(
                                  value: widget.present * t,
                                  color: AttendanceStatus.present.color,
                                  radius: 20,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: widget.absent * t,
                                  color: AttendanceStatus.absent.color,
                                  radius: 20,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: widget.late * t,
                                  color: AttendanceStatus.late.color,
                                  radius: 20,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: widget.leave * t,
                                  color: AttendanceStatus.leave.color,
                                  radius: 20,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: total * (1 - t),
                                  color: context.transparent,
                                  radius: 20,
                                  showTitle: false,
                                ),
                              ],
                        pieTouchData: PieTouchData(enabled: false),
                      ),
                      duration: Duration.zero,
                    ),
                    Column(
                      mainAxisSize: .min,
                      children: [
                        Text(
                          '$presentPercent%',
                          style: context.titleLarge.copyWith(
                            fontWeight: .w800,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          AttendanceStatus.present.label,
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Row(
                  crossAxisAlignment: .start,
                  children: [
                    Expanded(
                      child: _StatGroup(
                        status: AttendanceStatus.present,
                        count: widget.present,
                      ),
                    ),
                    Expanded(
                      child: _StatGroup(
                        status: AttendanceStatus.leave,
                        count: widget.leave,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: .start,
                  children: [
                    Expanded(
                      child: _StatGroup(
                        status: AttendanceStatus.late,
                        count: widget.late,
                      ),
                    ),
                    Expanded(
                      child: _StatGroup(
                        status: AttendanceStatus.absent,
                        count: widget.absent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatGroup extends StatelessWidget {
  final AttendanceStatus status;
  final int count;

  const _StatGroup({required this.status, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          status.label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontSize: 10.5,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(shape: .circle, color: status.color),
            ),
            const SizedBox(width: 6),
            Text(
              '$count',
              style: context.bodyMedium.copyWith(
                fontWeight: .w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
