import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/theme_utils.dart';

class AttendanceDonutChart extends StatefulWidget {
  final double presentPct;
  final double absentPct;
  final String centerLabel;
  final String centerValue;

  const AttendanceDonutChart({
    super.key,
    required this.presentPct,
    required this.absentPct,
    required this.centerLabel,
    required this.centerValue,
  });

  @override
  State<AttendanceDonutChart> createState() => _AttendanceDonutChartState();
}

class _AttendanceDonutChartState extends State<AttendanceDonutChart>
    with SingleTickerProviderStateMixin {
  static const _chartSize = 220.0;
  static const _innerR = 60.0;
  static const _sectionR = 28.0;
  static const _absentColor = Color(0xFFD0E4FF);

  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _progress = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AttendanceDonutChart old) {
    super.didUpdateWidget(old);
    if (old.presentPct != widget.presentPct || old.absentPct != widget.absentPct) {
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
    return AnimatedBuilder(
      animation: _progress,
      builder: (context, _) {
        final t = _progress.value;
        final present = widget.presentPct * t;
        final absent = widget.absentPct * t;

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: _chartSize,
                  child: Stack(
                    alignment: .bottomCenter,
                    children: [
                      ClipRect(
                        child: Align(
                          alignment: .topCenter,
                          heightFactor: 0.5,
                          child: SizedBox.square(
                            dimension: _chartSize,
                            child: PieChart(
                              PieChartData(
                                startDegreeOffset: 180,
                                sections: [
                                  PieChartSectionData(
                                    value: present,
                                    color: AppColors.primary,
                                    radius: _sectionR,
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: absent,
                                    color: _absentColor,
                                    radius: _sectionR,
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: present + absent,
                                    color: context.transparent,
                                    radius: _sectionR,
                                    showTitle: false,
                                  ),
                                ],
                                centerSpaceRadius: _innerR,
                                sectionsSpace: 3,
                                pieTouchData: PieTouchData(enabled: false),
                              ),
                              duration: Duration.zero,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              widget.centerLabel,
                              textAlign: .center,
                              style: context.labelSmall.copyWith(
                                color: context.textSecondary,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              widget.centerValue,
                              textAlign: .center,
                              style: context.titleMedium.copyWith(
                                fontWeight: .w700,
                                fontSize: 22,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: .center,
                children: [
                  _LegendDot(
                    color: AppColors.primary,
                    label: 'Present',
                    value: '${widget.presentPct ~/ 1}%',
                  ),
                  const SizedBox(width: 36),
                  _LegendDot(
                    color: _absentColor,
                    label: 'Leave / Absent',
                    value: '${widget.absentPct ~/ 1}%',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _LegendDot({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Row(
          mainAxisSize: .min,
          children: [
            Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(color: color, shape: .circle),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: context.bodySmall.copyWith(
            fontWeight: .w700,
            fontSize: 15,
            color: context.textPrimary,
          ),
        ),
      ],
    );
  }
}
