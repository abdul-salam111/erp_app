import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
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
                  'Recent salary & payments',
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
      decoration: BoxDecoration(
        color: AppColors.indigoLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
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
              textAlign: .end,
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

  const _TableRow({required this.record, required this.isAlt});

  static final _monthFmt = DateFormat('MMM yyyy');
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
              _monthFmt.format(record.month),
              style: context.bodySmall.copyWith(color: AppColors.primary),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              record.netPay.asPKR,
              textAlign: .end,
              style: context.bodySmall,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              _dateFmt.format(record.disbursed),
              textAlign: .end,
              style: context.bodySmall,
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {},
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
