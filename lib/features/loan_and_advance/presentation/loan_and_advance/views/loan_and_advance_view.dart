import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../loan_and_advance_exports.dart';
import '../models/loan_record.dart';

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
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.border),
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
        ],
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  final LoanRecord record;
  final bool isAlt;

  const _TableRow({required this.record, required this.isAlt});

  static final _dateFmt = DateFormat('dd MMM yyyy');

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
              style: context.bodySmall.copyWith(color: AppColors.primary),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              _dateFmt.format(record.date),
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
        ],
      ),
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
