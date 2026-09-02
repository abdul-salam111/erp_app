import 'package:flutter/material.dart';

import '../../../../../../core/theme/theme_exports.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../controllers/partah_calculator.dart';

class SummaryStep extends StatelessWidget {
  final PartahCalculator calculator;
  const SummaryStep({super.key, required this.calculator});

  @override
  Widget build(BuildContext context) {
    final profitPer100 = calculator.profitPer100;
    final totalNetProfit = calculator.totalNetProfit;
    final isProfit = profitPer100 >= 0;
    final isTotalProfit = totalNetProfit >= 0;
    final bag = calculator.totalInput.asBagWeight;
    final grossPer100 =
        calculator.saleAmountPer100 + calculator.gainAmount - calculator.purchasePricePer100;
    final isGrossProfit = grossPer100 >= 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Profit/100Kg Hero ──
          _NetProfitHero(net: profitPer100.abs(), isProfit: isProfit, bag: bag),
          heightBox(16),

          Row(
            children: [
              _MetricCard(
                label: 'Sale price / $bag Kg',
                value: calculator.saleAmountPer100.asAmount,
                valueColor: context.primary,
              ).expanded(),
              widthBox(10),
              _MetricCard(
                label: 'Purchase / $bag Kg',
                value: calculator.purchasePricePer100.asAmount,
                valueColor: context.warning,
              ).expanded(),
            ],
          ),

          heightBox(8),
          Row(
            children: [
              _MetricCard(
                label: 'Variable cost / $bag Kg',
                value: calculator.variableCostPer100.asAmount,
                valueColor: context.error,
              ).expanded(),
              widthBox(10),
              _MetricCard(
                label: 'Fixed cost / $bag Kg',
                value: calculator.fixedCostPer100.asAmount,
                valueColor: context.error,
              ).expanded(),
            ],
          ),

          heightBox(8),
          Row(
            children: [
              _MetricCard(
                label: 'Total Grinding Bags',
                value: calculator.grindingBags > 0 ? calculator.grindingBags.toInt().toString() : '–',
                valueColor: context.warning,
              ).expanded(),
              widthBox(10),
              _GainCard(gainPct: calculator.gainPct, gainAmount: calculator.gainAmount).expanded(),
            ],
          ),

          heightBox(8),
          Row(
            children: [
              _MetricCard(
                label: isGrossProfit ? 'Gross profit / $bag Kg' : 'Gross loss / $bag Kg',
                value: grossPer100.abs().asAmount,
                valueColor: isGrossProfit ? context.success : context.error,
                tintColor: isGrossProfit ? context.success.withAlpha(14) : context.error.withAlpha(18),
              ).expanded(),
              widthBox(10),
              _MetricCard(
                label: isTotalProfit ? 'Total net profit' : 'Total net loss',
                value: totalNetProfit.abs().asAmount,
                valueColor: isTotalProfit ? context.success : context.error,
                tintColor: isTotalProfit ? context.success.withAlpha(18) : context.error.withAlpha(18),
              ).expanded(),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Net Profit Hero ──────────────────────────────────────────────────────────

class _NetProfitHero extends StatelessWidget {
  final double net;
  final bool isProfit;
  final String bag;

  const _NetProfitHero({required this.net, required this.isProfit, required this.bag});

  @override
  Widget build(BuildContext context) {
    final accentColor = isProfit ? context.primary : context.error;
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
              mainAxisSize: MainAxisSize.min,
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
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isProfit ? 'PROFIT' : 'LOSS'} / $bag KG',
                textAlign: TextAlign.right,
                style: context.labelSmall.copyWith(
                  color: accentColor.withAlpha(180),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  fontSize: 11,
                ),
              ),
              heightBox(4),
              Text(
                'Rs ${net.asAmount}',
                textAlign: TextAlign.right,
                style: context.headlineMedium.copyWith(color: accentColor, fontWeight: FontWeight.w800),
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
  final Color valueColor;
  final Color? tintColor;

  const _MetricCard({required this.label, required this.value, required this.valueColor, this.tintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: tintColor ?? context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(color: context.textPrimary.withAlpha(6), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label,
            textAlign: TextAlign.right,
            style: context.bodySmall.copyWith(
              color: context.textPrimary.withAlpha(160),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          heightBox(5),
          Text(
            value,
            textAlign: TextAlign.right,
            style: context.titleMedium.copyWith(color: valueColor, fontWeight: FontWeight.w800, fontSize: 22),
          ),
        ],
      ),
    );
  }
}

// ─── Gain Card ────────────────────────────────────────────────────────────────

class _GainCard extends StatelessWidget {
  final double gainPct;
  final double gainAmount;

  const _GainCard({required this.gainPct, required this.gainAmount});

  @override
  Widget build(BuildContext context) {
    final isGain = gainPct >= 0;
    final color = gainPct > 0
        ? context.success
        : gainPct < 0
            ? context.error
            : context.textDisabled;
    final pctStr =
        gainPct != 0 ? '${gainPct.abs().toStringAsFixed(gainPct.abs() % 1 == 0 ? 0 : 1)}%' : '–';
    final amtStr = gainAmount != 0 ? gainAmount.abs().asAmount : '–';

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(color: context.textPrimary.withAlpha(6), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isGain ? 'Gain %' : 'Loss %',
                style: context.bodySmall.copyWith(
                  color: context.textPrimary.withAlpha(160),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              heightBox(3),
              Text(
                pctStr,
                style: context.titleMedium.copyWith(color: color, fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ],
          ).expanded(),
          Container(width: 1, height: 40, color: context.border),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Amount',
                textAlign: TextAlign.right,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary.withAlpha(160),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              heightBox(3),
              Text(
                amtStr,
                textAlign: TextAlign.right,
                style: context.titleMedium.copyWith(color: color, fontWeight: FontWeight.w800, fontSize: 20),
              ),
            ],
          ).expanded(),
        ],
      ),
    );
  }
}
