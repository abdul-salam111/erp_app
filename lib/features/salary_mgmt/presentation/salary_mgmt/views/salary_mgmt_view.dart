import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../routes/route_exports.dart';
import '../../../salary_mgmt_exports.dart';

class SalaryMgmtView extends StatelessWidget {
  const SalaryMgmtView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SalaryMgmtBloc>(),
      child: const _SalaryMgmtBody(),
    );
  }
}

class _SalaryMgmtBody extends StatelessWidget {
  const _SalaryMgmtBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalaryMgmtBloc, SalaryMgmtState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Salary Management'),
        body: SingleChildScrollView(
          padding: context.pagePadding,
          child: const _SalaryTable(),
        ),
      ),
    );
  }
}

class _SalaryTable extends StatelessWidget {
  const _SalaryTable();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaryMgmtBloc, SalaryMgmtState>(
      buildWhen: (previous, current) => previous.records != current.records,
      builder: (context, state) => _SalaryContent(records: state.records),
    );
  }
}

class _SalaryContent extends StatefulWidget {
  final List<SalaryRecord> records;
  const _SalaryContent({required this.records});

  @override
  State<_SalaryContent> createState() => _SalaryContentState();
}

class _SalaryContentState extends State<_SalaryContent>
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
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _buildAnimations();
    _ctrl.forward();
  }

  @override
  void didUpdateWidget(_SalaryContent old) {
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
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: context.isDark ? context.navyCard : context.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.isDark ? context.navyBorder : context.border,
        ),
        boxShadow: context.isDark
            ? null
            : [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          FadeTransition(
            opacity: _fades[0],
            child: SlideTransition(
              position: _slides[0],
              child: const _TableHeader(),
            ),
          ),
          ...List.generate(widget.records.length, (i) {
            return FadeTransition(
              opacity: _fades[i + 1],
              child: SlideTransition(
                position: _slides[i + 1],
                child: _TableRow(
                  record: widget.records[i],
                  isAlt: i.isOdd,
                  isLast: i == widget.records.length - 1,
                ),
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
      color: context.isDark
          ? AppColors.surfaceElevatedDark
          : context.surfaceHeader,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Period',
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Net Pay',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Disbursed',
              textAlign: .end,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  final SalaryRecord record;
  final bool isAlt;
  final bool isLast;

  const _TableRow({
    required this.record,
    required this.isAlt,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDark
            ? context.transparent
            : (isAlt ? context.tableRowAlt : context.surfaceElevated),
        border: context.isDark && !isLast
            ? Border(bottom: BorderSide(color: context.navyBorder))
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              record.month.shortMonthYear,
              style: context.bodySmall.copyWith(color: context.accentBlue),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              record.netPay.asPKR,
              textAlign: .center,
              style: context.bodySmall,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              record.disbursed.displayDate,
              textAlign: .end,
              style: context.bodySmall,
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () =>
                  context.pushNamed(RouteNames.salary_detail, extra: record),
              icon: const Icon(Iconsax.eye, size: 18),
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              color: context.primary,
            ),
          ),
        ],
      ),
    );
  }
}
