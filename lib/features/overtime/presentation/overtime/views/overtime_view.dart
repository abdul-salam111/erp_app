import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../routes/route_exports.dart';
import '../../../overtime_exports.dart';

class OvertimeView extends StatelessWidget {
  const OvertimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OvertimeBloc>(),
      child: const _OvertimeBody(),
    );
  }
}

class _OvertimeBody extends StatelessWidget {
  const _OvertimeBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OvertimeBloc, OvertimeState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Overtime'),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: context.pagePadding.copyWith(top: 12, bottom: 15),
            child: CustomButton(
              text: 'Overtime Request',
              onPressed: () => context.pushNamed(RouteNames.apply_overtime),
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
        body: SingleChildScrollView(
          padding: context.pagePadding,
          child: Column(
            crossAxisAlignment: .start,
            children: const [_SummaryStrip(), SizedBox(height: 16), _OvertimeTable()],
          ),
        ),
      ),
    );
  }
}

// ── Summary strip ────────────────────────────────────────────────────────────

class _SummaryStrip extends StatelessWidget {
  const _SummaryStrip();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OvertimeBloc, OvertimeState>(
      builder: (context, state) => _SummaryContent(records: state.records),
    );
  }
}

class _SummaryContent extends StatefulWidget {
  final List<OvertimeRecord> records;
  const _SummaryContent({required this.records});

  @override
  State<_SummaryContent> createState() => _SummaryContentState();
}

class _SummaryContentState extends State<_SummaryContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _ctrl.forward();
  }

  @override
  void didUpdateWidget(_SummaryContent old) {
    super.didUpdateWidget(old);
    if (old.records != widget.records) {
      _ctrl.reset();
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
    final records = widget.records;
    final totalHours = records.fold(0.0, (s, r) => s + r.hours);
    final approvedHours = records
        .where((r) => r.status == OvertimeStatus.approved || r.status == OvertimeStatus.paid)
        .fold(0.0, (s, r) => s + r.hours);
    final pendingHours = records
        .where((r) => r.status == OvertimeStatus.pending)
        .fold(0.0, (s, r) => s + r.hours);
    final totalEarnings = records
        .where((r) => r.status == OvertimeStatus.approved || r.status == OvertimeStatus.paid)
        .fold(0.0, (s, r) => s + r.amount);

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Column(
          children: [
            Row(
              children: [
                _SummaryCard(
                  label: 'Total Hours',
                  value: '${totalHours.toStringAsFixed(1)}h',
                  icon: Icons.access_time_rounded,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                _SummaryCard(
                  label: 'Approved',
                  value: '${approvedHours.toStringAsFixed(1)}h',
                  icon: Icons.check_circle_outline_rounded,
                  color: AppColors.creditGreen,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _SummaryCard(
                  label: 'Pending',
                  value: '${pendingHours.toStringAsFixed(1)}h',
                  icon: Icons.hourglass_empty_rounded,
                  color: AppColors.amber,
                ),
                const SizedBox(width: 8),
                _SummaryCard(
                  label: 'Earnings',
                  value: totalEarnings.asPKR,
                  icon: Icons.account_balance_wallet_outlined,
                  color: AppColors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
       
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, size: 13, color: color),
            ),
          widthBox(10),
            Column(
              crossAxisAlignment: .start,
              children: [
              Text(
              value,
              style: context.labelMedium.copyWith(
                fontWeight: .w700,
                color: context.textPrimary,
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 9,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}

// ── Table ────────────────────────────────────────────────────────────────────

class _OvertimeTable extends StatelessWidget {
  const _OvertimeTable();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OvertimeBloc, OvertimeState>(
      builder: (context, state) => _OvertimeContent(records: state.records),
    );
  }
}

class _OvertimeContent extends StatefulWidget {
  final List<OvertimeRecord> records;
  const _OvertimeContent({required this.records});

  @override
  State<_OvertimeContent> createState() => _OvertimeContentState();
}

class _OvertimeContentState extends State<_OvertimeContent>
    with SingleTickerProviderStateMixin {
  static const _offscreen = Offset(0, 0.06);

  late AnimationController _ctrl;
  late List<Animation<double>> _fades;
  late List<Animation<Offset>> _slides;

  void _buildAnimations() {
    final count = widget.records.length;
    _fades = [
      _fade(0.00, 0.45),
      for (int i = 0; i < count; i++) _fade(0.10 + i * 0.07, 0.55 + i * 0.07),
    ];
    _slides = [
      _slide(0.00, 0.45),
      for (int i = 0; i < count; i++) _slide(0.10 + i * 0.07, 0.55 + i * 0.07),
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
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 750));
    _buildAnimations();
    _ctrl.forward();
  }

  @override
  void didUpdateWidget(_OvertimeContent old) {
    super.didUpdateWidget(old);
    if (old.records != widget.records) {
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
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          FadeTransition(
            opacity: _fades[0],
            child: SlideTransition(
              position: _slides[0],
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      'Overtime history',
                      style: context.titleSmall.copyWith(fontWeight: .w600),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  const _TableHeader(),
                ],
              ),
            ),
          ),
          ...List.generate(widget.records.length, (i) {
            return FadeTransition(
              opacity: _fades[i + 1],
              child: SlideTransition(
                position: _slides[i + 1],
                child: _TableRow(record: widget.records[i], isAlt: i.isOdd),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Date',
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Hrs',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded( 
            flex: 3,
            child: Text(
              'Type',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Status',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  final OvertimeRecord record;
  final bool isAlt;

  const _TableRow({required this.record, required this.isAlt});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isAlt ? AppColors.tableRowAlt : AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              record.date.displayDate,
              style: context.bodySmall.copyWith(color: context.textPrimary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${record.hours}h',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              record.type.label,
              textAlign: .center,
              style: context.bodySmall,
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: .center,
              child: _StatusBadge(status: record.status),
            
            ),
          ),
          SizedBox(
            width: 10,
            child: GestureDetector(
              onTap: () => _showDetail(context, record),
              child: Icon(
                Icons.remove_red_eye_outlined,
                size: 18,
                color: context.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetail(BuildContext context, OvertimeRecord record) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _OvertimeDetailSheet(record: record),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final OvertimeStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      constraints: const BoxConstraints(minWidth: 72),
      decoration: BoxDecoration(
        color: status.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        textAlign: .center,
        style: context.labelSmall.copyWith(
          color: status.color,
          fontWeight: .w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

// ── Bottom Sheet ─────────────────────────────────────────────────────────────

class _OvertimeDetailSheet extends StatelessWidget {
  final OvertimeRecord record;

  const _OvertimeDetailSheet({required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          // drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // title + status
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      record.type.label,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.date.displayDate,
                      style: context.bodySmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(status: record.status),
            ],
          ),
          const SizedBox(height: 20),

          // amount summary cards
          Row(
            children: [
              _AmountCard(
                label: 'Hours Worked',
                value: '${record.hours}h',
                icon: Icons.access_time_rounded,
                color: AppColors.primary,
              ),
              const SizedBox(width: 10),
              _AmountCard(
                label: 'Rate / Hour',
                value: record.ratePerHour.asPKR,
                icon: Icons.sell_outlined,
                color: AppColors.amber,
              ),
              const SizedBox(width: 10),
              _AmountCard(
                label: 'Total Amount',
                value: record.amount.asPKR,
                icon: Icons.account_balance_wallet_outlined,
                color: AppColors.creditGreen,
              ),
            ],
          ),
          const SizedBox(height: 20),

          Divider(color: context.border, height: 1),
          const SizedBox(height: 16),

          _DetailRow(
            icon: Icons.calendar_month_outlined,
            label: 'Date',
            value: record.date.displayDate,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.category_outlined,
            label: 'Type',
            value: record.type.label,
          ),
          if (record.approver != null) ...[
            const SizedBox(height: 12),
            _DetailRow(
              icon: Icons.person_outline_rounded,
              label: 'Approver',
              value: record.approver!,
            ),
          ],
          if (record.remarks != null) ...[
            const SizedBox(height: 12),
            _DetailRow(
              icon: Icons.notes_rounded,
              label: 'Remarks',
              value: record.remarks!,
            ),
          ],
        ],
      ),
    );
  }
}

class _AmountCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _AmountCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(height: 6),
            Text(
              value,
              style: context.bodySmall.copyWith(
                color: color,
                fontWeight: .w700,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 9.5,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: context.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: context.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
        ),
        Text(value, style: context.bodySmall.copyWith(fontWeight: .w600)),
      ],
    );
  }
}
