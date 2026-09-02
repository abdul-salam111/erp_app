import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/theme_exports.dart';
import '../../../../../../core/utils/utils_exports.dart';
import '../../controllers/partah_calculator.dart';

class SaleStep extends StatelessWidget {
  final PartahCalculator calculator;
  final VoidCallback? onEditProducts;
  const SaleStep({super.key, required this.calculator, this.onEditProducts});

  @override
  Widget build(BuildContext context) {
    final rows = calculator.rows;
    final totalInput = calculator.totalInput;
    final totalYield = calculator.totalSaleYield100kg;
    final yieldReady = (totalYield - 100).abs() < 0.01;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(Icons.inventory_2_outlined, size: 15, color: context.textSecondary),
            widthBox(6),
            Text(
              'Revenue',
              style: context.headlineSmall.copyWith(
                color: context.textPrimary,
                fontWeight: .w800,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            if (onEditProducts != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: context.primary.withAlpha(14),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.primary.withAlpha(50)),
                ),
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    Icon(Icons.edit_outlined, size: 12, color: context.primary),
                    widthBox(5),
                    Text(
                      'Edit Products',
                      style: context.labelSmall.copyWith(
                        color: context.primary,
                        fontWeight: .w700,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ).onTap(onEditProducts!),
          ],
        ).withPadding(const EdgeInsets.fromLTRB(16, 14, 16, 8)),
        _SaleTable(
          rows: rows,
          totalInput: totalInput,
          totalYield: calculator.totalSaleYield100kg,
          totalAmount: calculator.totalSaleAmount100kg,
        ).withPadding(const EdgeInsets.fromLTRB(16, 0, 16, 8)),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: yieldReady ? context.primary : context.border,
                borderRadius: BorderRadius.circular(10),
                boxShadow: yieldReady
                    ? [
                        BoxShadow(
                          color: context.primary.withAlpha(60),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: yieldReady ? context.white : context.textDisabled,
              ),
            ).onTap(() {
              if (yieldReady) calculator.stepForward();
            }),
          ],
        ).withPadding(const EdgeInsets.fromLTRB(16, 0, 16, 12)),
      ],
    );
  }
}

// ─── Sale Table ───────────────────────────────────────────────────────────────

class _SaleTable extends StatelessWidget {
  final List<PartahRow> rows;
  final double totalInput;
  final double totalYield;
  final double totalAmount;

  const _SaleTable({
    required this.rows,
    required this.totalInput,
    required this.totalYield,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.primary.withAlpha(30)),
        boxShadow: [
          BoxShadow(
            color: context.primary.withAlpha(18),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: context.textPrimary.withAlpha(8),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _TableHeader(
            keyboardVisible: MediaQuery.of(context).viewInsets.bottom > 0,
            totalYield: totalYield,
          ),
          Divider(height: 1, thickness: 1, color: context.primary.withAlpha(30)),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: context.screenHeight * 0.35),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              itemCount: rows.length,
              itemBuilder: (ctx, i) => Column(
                children: [
                  _SaleRowWidget(row: rows[i], totalInput: totalInput, index: i),
                  if (i < rows.length - 1)
                    Divider(height: 1, thickness: 1, indent: 52, color: context.border),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.primary.withAlpha(10),
              borderRadius: _showYieldBanner(totalYield)
                  ? BorderRadius.zero
                  : const BorderRadius.vertical(bottom: Radius.circular(10)),
              border: Border(top: BorderSide(color: context.primary.withAlpha(35))),
            ),
            child: _SummaryRow(totalYield: totalYield, totalAmount: totalAmount, totalInput: totalInput),
          ),
          if (_showYieldBanner(totalYield))
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: context.warning.withAlpha(18),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                border: Border(top: BorderSide(color: context.warning.withAlpha(50))),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, size: 13, color: context.error),
                  widthBox(6),
                  Text(
                    'Yield must be 100%',
                    style: context.bodySmall.copyWith(
                      color: context.error,
                      fontSize: 10,
                      fontWeight: .w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final bool keyboardVisible;
  final double totalYield;

  const _TableHeader({required this.keyboardVisible, required this.totalYield});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.primary.withAlpha(18),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Row(
        children: [
          Text(
            'PRODUCT',
            style: context.labelSmall.copyWith(
              color: context.primary,
              fontWeight: .w800,
              letterSpacing: 0.6,
              fontSize: 10,
            ),
          ).expanded(flex: 4),
          widthBox(6),
          SizedBox(
            width: 80,
            child: Text(
              'RATE',
              textAlign: .center,
              style: context.labelSmall.copyWith(
                color: context.primary.withAlpha(180),
                fontWeight: .w700,
                letterSpacing: 0.5,
                fontSize: 10,
              ),
            ),
          ),
          widthBox(6),
          SizedBox(
            width: 80,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: keyboardVisible
                  ? Text(
                      totalYield > 0 ? '${_fmtYield(totalYield)}%' : '–',
                      key: const ValueKey('yield_val'),
                      textAlign: .center,
                      style: context.labelSmall.copyWith(
                        color: (totalYield - 100).abs() < 0.5 ? context.success : context.error,
                        fontWeight: .w800,
                        fontSize: 11,
                      ),
                    )
                  : Text(
                      'YIELD%',
                      key: const ValueKey('yield_hdr'),
                      textAlign: .center,
                      style: context.labelSmall.copyWith(
                        color: context.primary.withAlpha(180),
                        fontWeight: .w700,
                        letterSpacing: 0.5,
                        fontSize: 10,
                      ),
                    ),
            ),
          ),
          widthBox(6),
          SizedBox(
            width: 68,
            child: Text(
              'AMOUNT',
              textAlign: .right,
              style: context.labelSmall.copyWith(
                color: context.primary.withAlpha(180),
                fontWeight: .w700,
                letterSpacing: 0.5,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SaleRowWidget extends StatelessWidget {
  final PartahRow row;
  final double totalInput;
  final int index;

  const _SaleRowWidget({required this.row, required this.totalInput, required this.index});

  @override
  Widget build(BuildContext context) {
    final amt = row.saleAmount100kg(totalInput);
    final hasValue = amt > 0;

    return Row(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  row.template.name,
                  style: context.labelMedium.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w700,
                    fontSize: 13,
                  ),
                ),
                Text(
                  '${row.template.bagSize.toStringAsFixed(0)} Kg',
                  style: context.bodySmall.copyWith(color: context.textSecondary, fontSize: 12),
                ),
              ],
            ).expanded(),
          ],
        ).expanded(flex: 4),
        widthBox(6),
        SizedBox(width: 80, child: _PartahField(controller: row.rateController, hint: '0')),
        widthBox(6),
        SizedBox(
          width: 80,
          child: _PartahField(controller: row.yieldController, hint: '0', maxDecimals: 2),
        ),
        widthBox(6),
        SizedBox(
          width: 68,
          child: Text(
            hasValue ? amt.asAmount : '–',
            textAlign: .right,
            style: context.labelMedium.copyWith(
              color: hasValue ? context.success : context.textDisabled,
              fontWeight: .w800,
              fontSize: 13,
            ),
          ),
        ),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 7));
  }
}

class _SummaryRow extends StatelessWidget {
  final double totalYield;
  final double totalAmount;
  final double totalInput;

  const _SummaryRow({required this.totalYield, required this.totalAmount, required this.totalInput});

  @override
  Widget build(BuildContext context) {
    final hasAmount = totalAmount > 0;
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Total Sale ',
                style: context.labelMedium.copyWith(
                  color: context.primary,
                  fontWeight: .w800,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: '/ ${_fmtYield(totalInput)} Kg',
                style: context.bodySmall.copyWith(color: context.textSecondary, fontSize: 12),
              ),
            ],
          ),
        ).expanded(flex: 4),
        widthBox(6),
        SizedBox(
          width: 80,
          child: Text(
            totalYield > 0 ? '${_fmtYield(totalYield)}%' : '–',
            textAlign: .center,
            style: context.labelMedium.copyWith(
              color: _yieldColor(context, totalYield),
              fontWeight: .w700,
              fontSize: 14,
            ),
          ),
        ),
        widthBox(6),
        SizedBox(
          width: 68,
          child: Text(
            hasAmount ? totalAmount.asAmount : '–',
            textAlign: .right,
            style: context.titleSmall.copyWith(
              color: hasAmount ? context.success : context.textDisabled,
              fontWeight: .w800,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 10));
  }

  Color _yieldColor(BuildContext context, double yield) {
    if (yield == 0) return context.textDisabled;
    if (yield > 100) return context.error;
    if ((yield - 100).abs() < 0.5) return context.success;
    return context.textPrimary;
  }
}

// ─── Inline Field ─────────────────────────────────────────────────────────────

class _PartahField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int? maxDecimals;

  const _PartahField({required this.controller, required this.hint, this.maxDecimals});

  @override
  Widget build(BuildContext context) {
    final pattern = maxDecimals != null
        ? RegExp(r'^\d*\.?\d{0,' + maxDecimals.toString() + r'}')
        : RegExp(r'^\d*\.?\d*');
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(pattern)],
      onTap: () {
        controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
      },
      textAlign: .center,
      style: context.labelMedium.copyWith(
        color: context.textPrimary,
        fontWeight: .w700,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.bodySmall.copyWith(color: context.textDisabled, fontSize: 14),
        suffixStyle: context.labelSmall.copyWith(
          color: context.textSecondary,
          fontWeight: .w600,
          fontSize: 12,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
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
    );
  }
}

// ─── Shared Helpers ───────────────────────────────────────────────────────────

bool _showYieldBanner(double v) => v > 0 && (v - 100).abs() >= 0.005;

String _fmtYield(double v) {
  final s = v.toStringAsFixed(2);
  final rounded = double.parse(s);
  if (rounded % 1 == 0) return rounded.toInt().toString();
  return s.endsWith('0') ? s.substring(0, s.length - 1) : s;
}
