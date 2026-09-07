import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/accounts_widgets/accounts_ledger_states.dart';
import '../../../../../core/widgets/accounts_widgets/accounts_shimmer_body.dart';
import '../../../../../core/widgets/compact_date_picker.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../domain/entities/partah_report_entity.dart';
import '../blocs/partah_bloc.dart';
import '../blocs/partah_event.dart';
import '../blocs/partah_state.dart';

class PartahView extends StatelessWidget {
  const PartahView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PartahBloc>(),
      child: const _PartahBody(),
    );
  }
}

class _PartahBody extends StatefulWidget {
  const _PartahBody();

  @override
  State<_PartahBody> createState() => _PartahBodyState();
}

class _PartahBodyState extends State<_PartahBody> {
  Future<void> _pickDate(bool isFrom) async {
    final bloc = context.read<PartahBloc>();
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: isFrom ? bloc.state.fromDate : bloc.state.toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      bloc.add(isFrom ? PartahFromDateChanged(picked) : PartahToDateChanged(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: const CustomAppBar(title: 'Partah'),
      body: Column(
        children: [
          BlocBuilder<PartahBloc, PartahState>(
            buildWhen: (p, c) => p.fromDate != c.fromDate || p.toDate != c.toDate,
            builder: (context, state) {
              return _DateFilterForm(
                fromDate: state.fromDate,
                toDate: state.toDate,
                onPickFrom: () => _pickDate(true),
                onPickTo: () => _pickDate(false),
                onView: () =>
                    context.read<PartahBloc>().add(const PartahReportRequested()),
              );
            },
          ),
          BlocBuilder<PartahBloc, PartahState>(
            buildWhen: (p, c) =>
                p.loadStatus != c.loadStatus ||
                p.errorMessage != c.errorMessage ||
                p.report != c.report,
            builder: (context, state) {
              if (state.loadStatus == ApiStatus.LOADING) {
                return const AccountsShimmerBody().expanded();
              }
              if (state.loadStatus == ApiStatus.FAILURE) {
                return AccountsErrorBody(
                  message: state.errorMessage ?? AppConstants.somethingWentWrong,
                  onRetry: () =>
                      context.read<PartahBloc>().add(const PartahReportRequested()),
                ).expanded();
              }
              if (state.loadStatus == ApiStatus.SUCCESS && state.report != null) {
                return _ReportBody(report: state.report!).expanded();
              }
              return const AccountsIdleState(
                subtitle: 'Select a date range and tap View',
              ).expanded();
            },
          ),
        ],
      ),
    );
  }
}

// ─── Date filter form ─────────────────────────────────────────────────────────

class _DateFilterForm extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onView;

  const _DateFilterForm({
    required this.fromDate,
    required this.toDate,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePadding.copyWith(bottom: 12),
      child: Row(
        children: [
          _DateField(label: 'From', date: fromDate, onTap: onPickFrom).expanded(),
          widthBox(10),
          _DateField(label: 'To', date: toDate, onTap: onPickTo).expanded(),
          widthBox(10),
          ElevatedButton(
            onPressed: onView,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: .circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              elevation: 0,
            ),
            child: const Text('View'),
          ),
        ],
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime date;
  final VoidCallback onTap;

  const _DateField({required this.label, required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.border),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(label, style: context.labelSmall.copyWith(color: context.textSecondary)),
            heightBox(2),
            Text(
              date.displayDate,
              style: context.bodySmall.copyWith(fontWeight: .w700),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Report body ──────────────────────────────────────────────────────────────

class _ReportBody extends StatelessWidget {
  final PartahReportEntity report;
  const _ReportBody({required this.report});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.pagePadding.copyWith(top: 0),
      children: [
        _SummaryRow(summary: report.summary),
        heightBox(16),
        _SectionCard(
          title: 'Sales Summary',
          rows: [
            ('Total Sale Amount', report.salesSummary.totalSaleAmount.asAmount),
            ('Total Weight (Kg)', report.salesSummary.totalWeightKg.withCommas),
            ('Sale Rate Index / 100Kg', report.salesSummary.saleRateIndexPer100Kg.asAmount),
          ],
        ),
        heightBox(12),
        _SectionCard(
          title: 'Wheat Cost',
          rows: [
            ('Quantity', report.wheatCost.quantity.withCommas),
            ('Rate', report.wheatCost.rate.asAmount),
            ('Amount', report.wheatCost.amount.asAmount),
          ],
        ),
        heightBox(12),
        _SectionCard(
          title: 'Production',
          rows: [
            ('Total Grinding', report.production.totalGrinding.withCommas),
            ('Gain %', '${report.production.gainPercent.withCommas}%'),
          ],
        ),
        heightBox(12),
        _ExpensesCard(expenses: report.expensesSummary),
        if (report.categoryIndex.isNotEmpty) ...[
          heightBox(16),
          Text('Category Breakdown', style: context.titleSmall.copyWith(fontWeight: .w700)),
          heightBox(8),
          _CategoryIndexTable(items: report.categoryIndex),
        ],
        heightBox(24),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final PartahSummaryEntity summary;
  const _SummaryRow({required this.summary});

  @override
  Widget build(BuildContext context) {
    final isProfit = summary.totalProfit >= 0;
    final profitColor = isProfit ? context.success : context.error;
    return Row(
      children: [
        _StatTile(
          label: 'Revenue / 100Kg',
          value: summary.totalRevenuePer100Kg.asAmount,
        ).expanded(),
        widthBox(10),
        _StatTile(
          label: 'Cost / 100Kg',
          value: summary.totalCostPer100Kg.asAmount,
        ).expanded(),
        widthBox(10),
        _StatTile(
          label: isProfit ? 'Total Profit' : 'Total Loss',
          value: summary.totalProfit.abs().asAmount,
          color: profitColor,
        ).expanded(),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _StatTile({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(label, style: context.labelSmall.copyWith(color: context.textSecondary)),
          heightBox(4),
          Text(
            value,
            style: context.titleSmall.copyWith(fontWeight: .w800, color: color),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<(String, String)> rows;

  const _SectionCard({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(title, style: context.labelMedium.copyWith(fontWeight: .w700)),
          heightBox(8),
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(row.$1, style: context.bodySmall.copyWith(color: context.textSecondary)),
                  Text(row.$2, style: context.bodySmall.copyWith(fontWeight: .w600)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ExpensesCard extends StatelessWidget {
  final PartahExpensesSummaryEntity expenses;
  const _ExpensesCard({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Expenses', style: context.labelMedium.copyWith(fontWeight: .w700)),
          heightBox(8),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Variable Total', style: context.bodySmall.copyWith(color: context.textSecondary)),
              Text(expenses.variableTotal.asAmount, style: context.bodySmall.copyWith(fontWeight: .w600)),
            ],
          ),
          heightBox(4),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Fixed Total', style: context.bodySmall.copyWith(color: context.textSecondary)),
              Text(expenses.fixedTotal.asAmount, style: context.bodySmall.copyWith(fontWeight: .w600)),
            ],
          ),
          if (expenses.costs.isNotEmpty) ...[
            heightBox(10),
            Divider(color: context.border, height: 1),
            heightBox(8),
            for (final cost in expenses.costs)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      cost.description,
                      style: context.bodySmall.copyWith(color: context.textSecondary),
                    ).expanded(),
                    Text(cost.amount.asAmount, style: context.bodySmall.copyWith(fontWeight: .w600)),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _CategoryIndexTable extends StatelessWidget {
  final List<PartahCategoryIndexEntity> items;
  const _CategoryIndexTable({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.grey200,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Text(
                'Category',
                style: context.labelSmall.copyWith(fontWeight: .w700, color: context.textSecondary),
              ).expanded(flex: 3),
              Text(
                'Qty',
                style: context.labelSmall.copyWith(fontWeight: .w700, color: context.textSecondary),
                textAlign: .end,
              ).expanded(flex: 2),
              Text(
                'Amount',
                style: context.labelSmall.copyWith(fontWeight: .w700, color: context.textSecondary),
                textAlign: .end,
              ).expanded(flex: 2),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (_, __) => Divider(height: 1, color: context.border),
          itemBuilder: (_, i) {
            final item = items[i];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(item.displayName, style: context.bodySmall).expanded(flex: 3),
                  Text(item.qty.withCommas, style: context.bodySmall, textAlign: .end).expanded(flex: 2),
                  Text(item.amount.asAmount, style: context.bodySmall, textAlign: .end).expanded(flex: 2),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
