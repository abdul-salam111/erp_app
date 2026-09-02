import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/theme_exports.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../controllers/partah_calculator.dart';

class PurchaseStep extends StatelessWidget {
  final PartahCalculator calculator;
  const PurchaseStep({super.key, required this.calculator});

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
                  icon: Icons.shopping_bag_outlined,
                  iconColor: context.warning,
                  title: 'Purchase Details',
                  subtitle: 'Enter the purchase price per $bag Kg',
                ),
                heightBox(20),
                _InputCard(children: [
                  _FieldRow(
                    label: 'Price',
                    sublabel: 'per $bag Kg',
                    hint: '0',
                    icon: Icons.monetization_on_outlined,
                    iconColor: context.warning,
                    controller: calculator.purchasePriceController,
                  ),
                  _Divider(),
                  _FieldRow(
                    label: 'Grinding',
                    sublabel: 'no. of bags',
                    hint: '0',
                    icon: Icons.all_inbox_rounded,
                    iconColor: context.warning,
                    controller: calculator.grindingController,
                  ),
                  _Divider(),
                  _FieldRow(
                    label: 'Gain',
                    sublabel: 'Enter gain or loss',
                    hint: '0',
                    suffixText: '%',
                    icon: Icons.trending_up_rounded,
                    iconColor: context.success,
                    controller: calculator.gainPctController,
                    allowNegative: true,
                  ),
                  if (calculator.gainPct != 0) ...[
                    _Divider(),
                    _GainAmountRow(amount: calculator.gainAmount),
                  ],
                ]),
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
                color: context.primary.withAlpha(18),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.primary.withAlpha(50)),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: context.primary),
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
              child: const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.white),
            ).onTap(calculator.stepForward),
          ],
        ).withPadding(const EdgeInsets.fromLTRB(16, 0, 16, 12)),
      ],
    );
  }
}

// ─── Shared sub-widgets ───────────────────────────────────────────────────────

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

class _InputCard extends StatelessWidget {
  final List<Widget> children;
  const _InputCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: context.primary.withAlpha(20),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: context.textPrimary.withAlpha(10),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, thickness: 1, indent: 52, color: context.border);
  }
}

class _GainAmountRow extends StatelessWidget {
  final double amount;
  const _GainAmountRow({required this.amount});

  @override
  Widget build(BuildContext context) {
    final isPositive = amount >= 0;
    final color = isPositive ? context.success : context.error;
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: color.withAlpha(18), borderRadius: BorderRadius.circular(8)),
          child: Icon(
            isPositive ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
            size: 15,
            color: color,
          ),
        ),
        widthBox(10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Gain Amount',
              style: context.labelMedium.copyWith(
                color: context.textPrimary,
                fontWeight: .w600,
                fontSize: 15,
              ),
            ),
            Text(
              'Calculated from gain %',
              style: context.bodySmall.copyWith(color: context.textSecondary, fontSize: 13),
            ),
          ],
        ).expanded(),
        Text(
          'Rs ${amount.abs().withCommas}',
          style: context.labelMedium.copyWith(color: color, fontWeight: .w800, fontSize: 16),
        ),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 10));
  }
}

class _FieldRow extends StatelessWidget {
  final String label;
  final String? sublabel;
  final String hint;
  final String? suffixText;
  final IconData icon;
  final Color iconColor;
  final TextEditingController controller;
  final bool allowNegative;

  const _FieldRow({
    required this.label,
    this.sublabel,
    required this.hint,
    this.suffixText,
    required this.icon,
    required this.iconColor,
    required this.controller,
    this.allowNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: iconColor.withAlpha(18), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 15, color: iconColor),
        ),
        widthBox(10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              label,
              style: context.labelMedium.copyWith(
                color: context.textPrimary,
                fontWeight: .w600,
                fontSize: 15,
              ),
            ),
            if (sublabel != null)
              Text(
                sublabel!,
                style: context.bodySmall.copyWith(color: context.textSecondary, fontSize: 13),
              ),
          ],
        ).expanded(),
        SizedBox(
          width: 110,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: allowNegative),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                allowNegative ? RegExp(r'^-?\d*\.?\d*') : RegExp(r'^\d*\.?\d*'),
              ),
            ],
            onTap: () {
              controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
            },
            textAlign: .center,
            style: context.labelMedium.copyWith(
              color: context.textPrimary,
              fontWeight: .w800,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: context.labelMedium.copyWith(
                color: context.textDisabled,
                fontWeight: .w500,
                fontSize: 16,
              ),
              suffixText: suffixText,
              suffixStyle: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontWeight: .w600,
                fontSize: 13,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 10));
  }
}
