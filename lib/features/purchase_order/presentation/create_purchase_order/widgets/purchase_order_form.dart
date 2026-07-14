import 'package:flutter/material.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class PurchaseOrderForm extends StatefulWidget {
  final DateTime date;
  final VoidCallback onDateTap;
  final bool hasItems;
  final TextEditingController refDocNbrController;
  final TextEditingController supplierController;
  final TextEditingController brokerController;
  final TextEditingController weightSourceController;
  final TextEditingController calculationsController;
  final TextEditingController orderSourceController;
  final TextEditingController paymentModeController;
  final TextEditingController selectedCurrencyController;
  final TextEditingController currencyRateController;
  final TextEditingController rateController;

  const PurchaseOrderForm({
    super.key,
    required this.date,
    required this.onDateTap,
    required this.hasItems,
    required this.refDocNbrController,
    required this.supplierController,
    required this.brokerController,
    required this.weightSourceController,
    required this.calculationsController,
    required this.orderSourceController,
    required this.paymentModeController,
    required this.selectedCurrencyController,
    required this.currencyRateController,
    required this.rateController,
  });

  @override
  State<PurchaseOrderForm> createState() => _PurchaseOrderFormState();
}

class _PurchaseOrderFormState extends State<PurchaseOrderForm> {
  // Only meaningful once widget.hasItems is true.
  bool _expanded = false;

  @override
  void didUpdateWidget(covariant PurchaseOrderForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The moment the first row is added, collapse the form automatically.
    if (!oldWidget.hasItems && widget.hasItems) {
      _expanded = false;
    }
  }

  bool get _showAllFields => !widget.hasItems || _expanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          // ── Header ───────────────────────────────────────────
          // Toggle only shows once there's at least one item — before
          // that, the full form is always visible.
          if (widget.hasItems) ...[
            _FormHeader(
              expanded: _expanded,
              onToggle: () => setState(() => _expanded = !_expanded),
            ),
            heightBox(10),
          ],
          Row(
            crossAxisAlignment: .start,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: TextEditingController(
                    text: widget.date.format(AppConstants.ddMMMYyyyLabel),
                  ),
                  label: AppConstants.dateLabel,
                  isRequired: true,
                  fieldHeight: 37,
                  readOnly: true,
                  onTap: widget.onDateTap,
                  labelFontSize: 12,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextFormField(
                  controller: widget.refDocNbrController,
                  label: 'Ref Doc Nbr',
                  fieldHeight: 37,
                  hintText: 'Ref Doc Nbr',
                  labelFontSize: 12,
                ),
              ),
            ],
          ),
          heightBox(10),
          Row(
            crossAxisAlignment: .start,
            children: [
              Expanded(
                child: SearchableDropdown(
                  items: [],
                  controller: widget.supplierController,
                  label: AppConstants.supplierLabel,
                  isRequired: true,
                  hintText: AppConstants.supplierLabel,
                  onChanged: (value) {},
                  fieldHeight: 40,
                  isShowIcon: false,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SearchableDropdown(
                  items: [],
                  controller: widget.brokerController,
                  label: 'Broker',
                  hintText: AppConstants.brokerLabel,
                  onChanged: (value) {},
                  fieldHeight: 40,
                  isShowIcon: false,
                ),
              ),
            ],
          ),
          // ── Remaining fields ─────────────────────────────────
          // Always laid out; AnimatedSize handles the collapse/expand
          // once hasItems is true.
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            alignment: .topCenter,
            child: _showAllFields
                ? Column(
                    crossAxisAlignment: .start,
                    children: [
                      heightBox(10),
                      Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: SearchableDropdown(
                              items: [],
                              controller: widget.weightSourceController,
                              label: AppConstants.weightSourceLabel,
                              hintText: AppConstants.weightSourceLabel,
                              onChanged: (value) {},
                              fieldHeight: 40,
                              isShowIcon: false,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SearchableDropdown(
                              items: [],
                              controller: widget.calculationsController,
                              label: AppConstants.calculationsLabel,
                              hintText: AppConstants.calculationsLabel,
                              onChanged: (value) {},
                              fieldHeight: 40,
                              isShowIcon: false,
                            ),
                          ),
                        ],
                      ),
                      heightBox(10),
                      Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: SearchableDropdown(
                              items: [],
                              controller: widget.orderSourceController,
                              label: AppConstants.orderSourceLabel,
                              hintText: AppConstants.orderSourceLabel,
                              onChanged: (value) {},
                              fieldHeight: 40,
                              isShowIcon: false,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SearchableDropdown(
                              items: [],
                              controller: widget.paymentModeController,
                              label: AppConstants.paymentModeLabel,
                              hintText: AppConstants.paymentModeLabel,
                              onChanged: (value) {},
                              fieldHeight: 40,
                              isShowIcon: false,
                            ),
                          ),
                        ],
                      ),
                      heightBox(10),
                      SearchableDropdown(
                        items: [],
                        controller: widget.selectedCurrencyController,
                        label: AppConstants.currencyLabel,
                        hintText: AppConstants.currencyLabel,
                        onChanged: (value) {},
                        fieldHeight: 40,
                        isShowIcon: false,
                      ),
                      heightBox(10),
                      Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: widget.currencyRateController,
                              label: AppConstants.currencyRateLabel,
                              fieldHeight: 37,
                              hintText: AppConstants.currencyRateLabel,
                              labelFontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextFormField(
                              controller: widget.rateController,
                              label: AppConstants.currencyRate,
                              isRequired: true,
                              fieldHeight: 37,
                              hintText: AppConstants.currencyRate,
                              labelFontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ── Header ───────────────────────────────────────────────────────

class _FormHeader extends StatelessWidget {
  final bool expanded;
  final VoidCallback onToggle;

  const _FormHeader({required this.expanded, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          'Purchase Order Form',
          style: context.bodySmall.copyWith(
            fontWeight: .w600,
            fontSize: 13,
            color: context.textPrimary,
          ),
        ),
        InkWell(
          onTap: onToggle,
          borderRadius: .circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              mainAxisSize: .min,
              children: [
                Text(
                  expanded ? 'Show Less' : 'Show More',
                  style: context.labelSmall.copyWith(
                    color: context.primary,
                    fontWeight: .w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 2),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 16,
                    color: context.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}