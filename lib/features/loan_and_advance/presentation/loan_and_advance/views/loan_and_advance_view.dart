import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../loan_and_advance_exports.dart';

class LoanAndAdvanceView extends StatelessWidget {
  const LoanAndAdvanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoanAndAdvanceBloc>(),
      child: const _LoanAndAdvanceBody(),
    );
  }
}

class _LoanAndAdvanceBody extends StatelessWidget {
  const _LoanAndAdvanceBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoanAndAdvanceBloc, LoanAndAdvanceState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Loans & Advances'),
        body: SingleChildScrollView(
          padding: context.pagePadding,
          child: const _LoanTable(),
        ),
      ),
    );
  }
}

class _LoanTable extends StatelessWidget {
  const _LoanTable();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanAndAdvanceBloc, LoanAndAdvanceState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: .circular(12),
            border: .all(color: context.border),
            boxShadow: [
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
              Padding(
                padding: const .symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  'Loan & advance history',
                  style: context.titleSmall.copyWith(fontWeight: .w600),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              const _TableHeader(),
              ...List.generate(state.records.length, (i) {
                return _TableRow(record: state.records[i], isAlt: i.isOdd);
              }),
            ],
          ),
        );
      },
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey200,
      padding: const .symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Type',
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Date',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Principal',
              textAlign: .center,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              textAlign: .end,
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
  final LoanRecord record;
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
              record.type,
              style: context.bodySmall.copyWith(color: context.textPrimary),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              record.date.displayDate,
              textAlign: .center,
              style: context.bodySmall,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              record.principal.asPKR,
              textAlign: .center,
              style: context.bodySmall,
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: .centerRight,
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

  void _showDetail(BuildContext context, LoanRecord record) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _LoanDetailSheet(record: record),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final LoanStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: status.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: context.labelSmall.copyWith(
          color: status.color,
          fontWeight: .w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

// ── Bottom Sheet ────────────────────────────────────────────────────────────

class _LoanDetailSheet extends StatelessWidget {
  final LoanRecord record;

  const _LoanDetailSheet({required this.record});

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
                      record.type,
                      style: context.titleSmall.copyWith(fontWeight: .w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Applied on ${record.date.displayDate}',
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
                label: 'Principal',
                amount: record.principal,
                color: context.primary,
              ),
              const SizedBox(width: 10),
              _AmountCard(
                label: 'Total Paid',
                amount: record.totalPaid,
                color: AppColors.creditGreen,
              ),
              const SizedBox(width: 10),
              _AmountCard(
                label: 'Remaining',
                amount: record.remaining,
                color: record.status == LoanStatus.overdue
                    ? AppColors.debitRed
                    : context.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // repayment progress
          Text(
            'Repayment Progress',
            style: context.bodySmall.copyWith(fontWeight: .w600),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: record.repaidFraction,
              minHeight: 10,
              backgroundColor: AppColors.grey200,
              valueColor: AlwaysStoppedAnimation(
                record.status == LoanStatus.overdue
                    ? AppColors.debitRed
                    : AppColors.creditGreen,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '${(record.repaidFraction * 100).toStringAsFixed(0)}% repaid',
                style: context.labelSmall.copyWith(color: context.textSecondary),
              ),
              Text(
                '${record.tenureMonths} months tenure',
                style: context.labelSmall.copyWith(color: context.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Divider(color: context.border, height: 1),
          const SizedBox(height: 16),

          // detail rows
          _DetailRow(
            icon: Icons.calendar_month_outlined,
            label: 'Disbursement Date',
            value: record.date.displayDate,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.event_available_outlined,
            label: 'End Date',
            value: record.endDate.displayDate,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.repeat_rounded,
            label: 'Monthly Installment',
            value: record.monthlyInstallment.asPKR,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.timelapse_rounded,
            label: 'Tenure',
            value: '${record.tenureMonths} months',
          ),
        ],
      ),
    );
  }
}

class _AmountCard extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _AmountCard({
    required this.label,
    required this.amount,
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
            Text(
              label,
              style: context.labelSmall.copyWith(color: context.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              amount.asPKR,
              style: context.bodySmall.copyWith(
                color: color,
                fontWeight: .w700,
              ),
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
        Text(
          value,
          style: context.bodySmall.copyWith(fontWeight: .w600),
        ),
      ],
    );
  }
}
