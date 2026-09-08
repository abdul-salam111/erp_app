import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/theme_exports.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../controllers/partah_calculator.dart';

class CostsStep extends StatelessWidget {
  final PartahCalculator calculator;
  const CostsStep({super.key, required this.calculator});

  @override
  Widget build(BuildContext context) {
    final bag = calculator.totalInput.asBagWeight;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                _StepHeader(
                  icon: Icons.tune_rounded,
                  iconColor: context.primary,
                  title: 'Operational Costs',
                  subtitle: 'Variable and fixed costs per $bag Kg',
                ),
                heightBox(20),
                _CostSection(
                  sectionLabel: 'Variable Costs',
                  color: context.textSecondary,
                  items: calculator.variableCosts,
                  onAdd: calculator.addVariableCost,
                  onRemove: calculator.removeVariableCost,
                  total: calculator.totalVariableCosts,
                ),
                heightBox(20),
                _CostSection(
                  sectionLabel: 'Fixed Costs',
                  color: context.primary,
                  items: calculator.fixedCosts,
                  onAdd: calculator.addFixedCost,
                  onRemove: calculator.removeFixedCost,
                  total: calculator.totalFixedCosts,
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: context.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.border),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: context.textSecondary),
            ).onTap(calculator.stepBack),
            const Spacer(),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: context.primary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: context.primary.withAlpha(60),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: context.white),
            ).onTap(calculator.stepForward),
          ],
        ).withPadding(const EdgeInsets.fromLTRB(16, 0, 16, 12)),
      ],
    );
  }
}

// ─── Unified Cost Section Card ────────────────────────────────────────────────

class _CostSection extends StatelessWidget {
  final String sectionLabel;
  final Color color;
  final List<CostItem> items;
  final VoidCallback onAdd;
  final void Function(int) onRemove;
  final double total;

  const _CostSection({
    required this.sectionLabel,
    required this.color,
    required this.items,
    required this.onAdd,
    required this.onRemove,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final hasTotal = total > 0;
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          // ── Section header ──
          Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
            decoration: BoxDecoration(
              color: color.withAlpha(18),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 13,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
                ),
                widthBox(7),
                Text(
                  sectionLabel.toUpperCase(),
                  style: context.labelSmall.copyWith(
                    color: color,
                    fontWeight: .w700,
                    letterSpacing: 0.6,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: color.withAlpha(18),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: color.withAlpha(50)),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Icon(Icons.add_rounded, size: 12, color: color),
                      widthBox(4),
                      Text(
                        'Add',
                        style: context.labelSmall.copyWith(
                          color: color,
                          fontWeight: .w700,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ).onTap(onAdd),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: color.withAlpha(30)),
          // ── Items ──
          if (items.isEmpty)
            Text(
              'Tap + Add to add costs',
              style: context.bodySmall.copyWith(color: context.textDisabled, fontSize: 11),
            ).center().withPadding(const EdgeInsets.symmetric(vertical: 14))
          else
            Column(
              children: List.generate(items.length * 2 - 1, (i) {
                if (i.isOdd) {
                  return Divider(height: 1, thickness: 1, indent: 48, color: context.border);
                }
                final idx = i ~/ 2;
                return _CostItemRow(item: items[idx], color: color, onRemove: () => onRemove(idx));
              }),
            ),
          // ── Total footer ──
          if (hasTotal)
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(14)),
                border: Border(top: BorderSide(color: color.withAlpha(40))),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              child: Row(
                children: [
                  Icon(Icons.calculate_outlined, size: 14, color: color),
                  widthBox(8),
                  Text(
                    'Total $sectionLabel',
                    style: context.labelSmall.copyWith(color: context.textPrimary, fontWeight: .w700),
                  ).expanded(),
                  Text(
                    total.asAmount,
                    style: context.titleSmall.copyWith(color: context.textPrimary, fontWeight: .w800),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Cost Item Row ────────────────────────────────────────────────────────────

class _CostItemRow extends StatelessWidget {
  final CostItem item;
  final Color color;
  final VoidCallback onRemove;

  const _CostItemRow({required this.item, required this.color, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          controller: item.descriptionController,
          textCapitalization: TextCapitalization.sentences,
          style: context.labelMedium.copyWith(color: context.textPrimary),
          decoration: InputDecoration(
            hintText: 'Description',
            hintStyle: context.labelMedium.copyWith(color: context.textDisabled, fontWeight: .w400),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            fillColor: context.background,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.primary, width: 1.5),
            ),
          ),
        ).expanded(),
        widthBox(8),
        SizedBox(
          width: 84,
          child: TextField(
            controller: item.costController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
            textAlign: .center,
            style: context.labelMedium.copyWith(color: context.textPrimary),
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: context.labelMedium.copyWith(color: context.textDisabled, fontWeight: .w400),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              fillColor: context.background,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.primary, width: 1.5),
              ),
            ),
          ),
        ),
        widthBox(6),
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(color: context.error.withAlpha(14), borderRadius: BorderRadius.circular(7)),
          child: Icon(Icons.close_rounded, size: 13, color: context.error),
        ).onTap(onRemove),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 7));
  }
}

// ─── Step Header ──────────────────────────────────────────────────────────────

class _StepHeader extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _StepHeader({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: iconColor),
            widthBox(8),
            Text(
              title,
              style: context.headlineSmall.copyWith(
                color: context.textPrimary,
                fontWeight: .w800,
                fontSize: 14,
              ),
            ),
          ],
        ),
        heightBox(4),
        Text(subtitle, style: context.bodySmall.copyWith(color: context.textSecondary)),
      ],
    );
  }
}
