import 'package:flutter/material.dart';

import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../domain/entities/cost_item_entity.dart';
import '../../../domain/entities/partah_record_entity.dart';
import '../../../domain/entities/production_entry_entity.dart';

class ReportDetailView extends StatelessWidget {
  final PartahRecordEntity record;
  const ReportDetailView({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final bag = record.baseWeightKg.asBagWeight;
    final isProfit = record.isProfit;
    final accentColor = isProfit ? context.primary : context.error;

    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: record.createdAt.displayDate),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _NetProfitHero(net: record.netProfit.abs(), isProfit: isProfit, accentColor: accentColor),
          heightBox(16),
          Row(
            children: [
              _MetricCard(label: 'Sale price / $bag Kg', value: record.salePricePer100Kg.asAmount).expanded(),
              widthBox(10),
              _MetricCard(label: 'Purchase / $bag Kg', value: record.purchasePrice.asAmount).expanded(),
            ],
          ),
          heightBox(8),
          Row(
            children: [
              _MetricCard(
                label: 'Variable cost / $bag Kg',
                value: record.totalVariableCostPer100Kg.asAmount,
              ).expanded(),
              widthBox(10),
              _MetricCard(label: 'Fixed cost / $bag Kg', value: record.totalFixedCostPer100Kg.asAmount).expanded(),
            ],
          ),
          heightBox(8),
          Row(
            children: [
              _MetricCard(
                label: 'Total Grinding',
                value: '${record.grindingBags.toStringAsFixed(record.grindingBags % 1 == 0 ? 0 : 1)} bags',
              ).expanded(),
              widthBox(10),
              _MetricCard(label: 'Gain %', value: '${record.gainPercentage.toStringAsFixed(0)}%').expanded(),
            ],
          ),
          heightBox(20),
          _SectionLabel(title: 'Products'),
          heightBox(8),
          _ProductsTable(entries: record.productionEntries, baseWeightKg: record.baseWeightKg),
          if (record.variableCosts.isNotEmpty) ...[
            heightBox(20),
            _SectionLabel(title: 'Variable Costs'),
            heightBox(8),
            _CostsTable(items: record.variableCosts),
          ],
          if (record.fixedCosts.isNotEmpty) ...[
            heightBox(20),
            _SectionLabel(title: 'Fixed Costs'),
            heightBox(8),
            _CostsTable(items: record.fixedCosts),
          ],
        ],
      ),
    );
  }
}

// ─── Net Profit Hero ──────────────────────────────────────────────────────────

class _NetProfitHero extends StatelessWidget {
  final double net;
  final bool isProfit;
  final Color accentColor;

  const _NetProfitHero({required this.net, required this.isProfit, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: accentColor.withAlpha(14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withAlpha(60)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor.withAlpha(20),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor.withAlpha(60)),
            ),
            child: Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  isProfit ? Icons.trending_up_rounded : Icons.trending_down_rounded,
                  size: 13,
                  color: accentColor,
                ),
                widthBox(5),
                Text(
                  isProfit ? 'PROFIT' : 'LOSS',
                  style: context.labelSmall.copyWith(
                    color: accentColor,
                    fontWeight: .w700,
                    fontSize: 11,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text(
                'NET ${isProfit ? 'PROFIT' : 'LOSS'}',
                textAlign: .right,
                style: context.labelSmall.copyWith(
                  color: accentColor.withAlpha(180),
                  fontWeight: .w600,
                  letterSpacing: 1.2,
                  fontSize: 11,
                ),
              ),
              heightBox(4),
              Text(
                'Rs ${net.asAmount}',
                textAlign: .right,
                style: context.headlineMedium.copyWith(color: accentColor, fontWeight: .w800),
              ),
            ],
          ).expanded(),
        ],
      ),
    );
  }
}

// ─── Metric Card ──────────────────────────────────────────────────────────────

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;

  const _MetricCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .end,
        children: [
          Text(
            label,
            textAlign: .right,
            style: context.bodySmall.copyWith(
              color: context.textPrimary.withAlpha(160),
              fontSize: 12,
              fontWeight: .w500,
            ),
          ),
          heightBox(5),
          Text(
            value,
            textAlign: .right,
            style: context.titleMedium.copyWith(
              color: context.textPrimary,
              fontWeight: .w800,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Section Label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String title;
  const _SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 16,
          decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(2)),
        ),
        widthBox(8),
        Text(
          title,
          style: context.titleSmall.copyWith(fontWeight: .w700, color: context.textPrimary),
        ),
      ],
    );
  }
}

// ─── Products Table ───────────────────────────────────────────────────────────

class _ProductsTable extends StatelessWidget {
  final List<ProductionEntryEntity> entries;
  final double baseWeightKg;

  const _ProductsTable({required this.entries, required this.baseWeightKg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          for (var i = 0; i < entries.length; i++) ...[
            _ProductRow(entry: entries[i], baseWeightKg: baseWeightKg),
            if (i < entries.length - 1) Divider(height: 1, thickness: 1, indent: 12, endIndent: 12, color: context.border),
          ],
        ],
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final ProductionEntryEntity entry;
  final double baseWeightKg;

  const _ProductRow({required this.entry, required this.baseWeightKg});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(entry.productName, style: context.labelMedium.copyWith(fontWeight: .w700)),
            Text(
              '${entry.bagSize.toStringAsFixed(0)} Kg · Rs ${entry.rate.toStringAsFixed(0)} · ${entry.percentage.toStringAsFixed(entry.percentage % 1 == 0 ? 0 : 1)}%',
              style: context.bodySmall.copyWith(color: context.textSecondary, fontSize: 12),
            ),
          ],
        ).expanded(),
        Text(
          entry.amountFor(baseWeightKg).asAmount,
          style: context.labelMedium.copyWith(color: context.success, fontWeight: .w800),
        ),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 14, vertical: 12));
  }
}

// ─── Costs Table ──────────────────────────────────────────────────────────────

class _CostsTable extends StatelessWidget {
  final List<CostItemEntity> items;
  const _CostsTable({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            Row(
              children: [
                Text(
                  items[i].description.isEmpty ? 'Untitled' : items[i].description,
                  style: context.bodyMedium.copyWith(color: context.textPrimary),
                ).expanded(),
                Text(
                  items[i].amount.asAmount,
                  style: context.labelMedium.copyWith(color: context.textPrimary, fontWeight: .w700),
                ),
              ],
            ).withPadding(const EdgeInsets.symmetric(horizontal: 14, vertical: 12)),
            if (i < items.length - 1) Divider(height: 1, thickness: 1, indent: 12, endIndent: 12, color: context.border),
          ],
        ],
      ),
    );
  }
}
