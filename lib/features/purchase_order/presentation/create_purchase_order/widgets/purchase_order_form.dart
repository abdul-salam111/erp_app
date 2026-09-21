import 'package:flutter/material.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class PurchaseOrderForm extends StatefulWidget {
  final DateTime date;
  final VoidCallback onDateTap;
  final bool hasItems;
  final List<String> partyNames;
  final ValueChanged<String>? onSupplierChanged;
  final ValueChanged<String>? onBrokerChanged;
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
    this.partyNames = const [],
    this.onSupplierChanged,
    this.onBrokerChanged,
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
  late final TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: widget.date.format(AppConstants.ddMMMYyyyLabel),
    );
  }

  @override
  void didUpdateWidget(covariant PurchaseOrderForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.date != widget.date) {
      _dateController.text = widget.date.format(AppConstants.ddMMMYyyyLabel);
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  bool get _showAllFields => !widget.hasItems;

  Future<void> _openMoreFieldsSheet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.transparent,
      builder: (_) => _MoreFieldsSheet(
        partyNames: widget.partyNames,
        dateController: _dateController,
        onDateTap: widget.onDateTap,
        refDocNbrController: widget.refDocNbrController,
        supplierController: widget.supplierController,
        brokerController: widget.brokerController,
        onSupplierChanged: widget.onSupplierChanged,
        onBrokerChanged: widget.onBrokerChanged,
        weightSourceController: widget.weightSourceController,
        calculationsController: widget.calculationsController,
        orderSourceController: widget.orderSourceController,
        paymentModeController: widget.paymentModeController,
        selectedCurrencyController: widget.selectedCurrencyController,
        currencyRateController: widget.currencyRateController,
        rateController: widget.rateController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: .circular(8),
        border: Border.all(
          color: context.isDark ? context.navyBorder : context.border,
        ),
      ),
      child: Column(
        children: [
          // ── Header ───────────────────────────────────────────
          // Show More opens all extra fields in a modal bottom sheet
          // instead of expanding inline. Only visible once there's at
          // least one item — before that, the full form is inline.
          if (widget.hasItems) ...[
            _FormHeader(onShowMore: _openMoreFieldsSheet),
            heightBox(10),
          ],
          _TopFields(
            partyNames: widget.partyNames,
            dateController: _dateController,
            onDateTap: widget.onDateTap,
            refDocNbrController: widget.refDocNbrController,
            supplierController: widget.supplierController,
            brokerController: widget.brokerController,
            onSupplierChanged: widget.onSupplierChanged,
            onBrokerChanged: widget.onBrokerChanged,
          ),
          // ── Remaining fields (only inline when no items yet) ────
          if (_showAllFields) ...[
            heightBox(10),
            _ExtraFields(
              weightSourceController: widget.weightSourceController,
              calculationsController: widget.calculationsController,
              orderSourceController: widget.orderSourceController,
              paymentModeController: widget.paymentModeController,
              selectedCurrencyController: widget.selectedCurrencyController,
              currencyRateController: widget.currencyRateController,
              rateController: widget.rateController,
            ),
          ],
        ],
      ),
    );
  }
}

// ── Header ───────────────────────────────────────────────────────

class _FormHeader extends StatelessWidget {
  final VoidCallback onShowMore;

  const _FormHeader({required this.onShowMore});

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
          onTap: onShowMore,
          borderRadius: .circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              mainAxisSize: .min,
              children: [
                Text(
                  'Show More',
                  style: context.labelSmall.copyWith(
                    color: context.accentBlue,
                    fontWeight: .w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.open_in_new_rounded,
                  size: 14,
                  color: context.accentBlue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Top fields (shared between inline + bottom sheet) ──────────────

class _TopFields extends StatelessWidget {
  final List<String> partyNames;
  final TextEditingController dateController;
  final VoidCallback onDateTap;
  final TextEditingController refDocNbrController;
  final TextEditingController supplierController;
  final TextEditingController brokerController;
  final ValueChanged<String>? onSupplierChanged;
  final ValueChanged<String>? onBrokerChanged;

  const _TopFields({
    required this.partyNames,
    required this.dateController,
    required this.onDateTap,
    required this.refDocNbrController,
    required this.supplierController,
    required this.brokerController,
    required this.onSupplierChanged,
    required this.onBrokerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: dateController,
                label: AppConstants.dateLabel,
                isRequired: true,
                fieldHeight: 37,
                readOnly: true,
                onTap: onDateTap,
                labelFontSize: 12,
                fillColor: context.isDark ? context.navyIconBg : null,
                borderColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextFormField(
                controller: refDocNbrController,
                label: 'Ref Doc Nbr',
                fieldHeight: 37,
                hintText: 'Ref Doc Nbr',
                labelFontSize: 12,
                fillColor: context.isDark ? context.navyIconBg : null,
                borderColor: Colors.transparent,
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
                items: partyNames,
                controller: supplierController,
                label: AppConstants.supplierLabel,
                isRequired: true,
                hintText: AppConstants.supplierLabel,
                onChanged: (value) => onSupplierChanged?.call(value),
                fieldHeight: 40,
                isShowIcon: false,
                borderColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SearchableDropdown(
                items: partyNames,
                controller: brokerController,
                label: 'Broker',
                hintText: AppConstants.brokerLabel,
                onChanged: (value) => onBrokerChanged?.call(value),
                fieldHeight: 40,
                isShowIcon: false,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Extra fields (shared between inline + bottom sheet) ────────────

class _ExtraFields extends StatelessWidget {
  final TextEditingController weightSourceController;
  final TextEditingController calculationsController;
  final TextEditingController orderSourceController;
  final TextEditingController paymentModeController;
  final TextEditingController selectedCurrencyController;
  final TextEditingController currencyRateController;
  final TextEditingController rateController;

  const _ExtraFields({
    required this.weightSourceController,
    required this.calculationsController,
    required this.orderSourceController,
    required this.paymentModeController,
    required this.selectedCurrencyController,
    required this.currencyRateController,
    required this.rateController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: SearchableDropdown(
                items: const [],
                controller: weightSourceController,
                label: AppConstants.weightSourceLabel,
                hintText: AppConstants.weightSourceLabel,
                onChanged: (value) {},
                fieldHeight: 40,
                isShowIcon: false,
                borderColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SearchableDropdown(
                items: const [],
                controller: calculationsController,
                label: AppConstants.calculationsLabel,
                hintText: AppConstants.calculationsLabel,
                onChanged: (value) {},
                fieldHeight: 40,
                isShowIcon: false,
                borderColor: Colors.transparent,
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
                items: const [],
                controller: orderSourceController,
                label: AppConstants.orderSourceLabel,
                hintText: AppConstants.orderSourceLabel,
                onChanged: (value) {},
                fieldHeight: 40,
                isShowIcon: false,
                borderColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SearchableDropdown(
                items: const [],
                controller: paymentModeController,
                label: AppConstants.paymentModeLabel,
                hintText: AppConstants.paymentModeLabel,
                onChanged: (value) {},
                fieldHeight: 40,
                isShowIcon: false,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
        heightBox(10),
        SearchableDropdown(
          items: const [],
          controller: selectedCurrencyController,
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
                controller: currencyRateController,
                label: AppConstants.currencyRateLabel,
                fieldHeight: 37,
                hintText: AppConstants.currencyRateLabel,
                labelFontSize: 12,
                fillColor: context.isDark ? context.navyIconBg : null,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextFormField(
                controller: rateController,
                label: AppConstants.currencyRate,
                isRequired: true,
                fieldHeight: 37,
                hintText: AppConstants.currencyRate,
                labelFontSize: 12,
                fillColor: context.isDark ? context.navyIconBg : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── More Fields Bottom Sheet ───────────────────────────────────────

class _MoreFieldsSheet extends StatelessWidget {
  final List<String> partyNames;
  final TextEditingController dateController;
  final VoidCallback onDateTap;
  final TextEditingController refDocNbrController;
  final TextEditingController supplierController;
  final TextEditingController brokerController;
  final ValueChanged<String>? onSupplierChanged;
  final ValueChanged<String>? onBrokerChanged;
  final TextEditingController weightSourceController;
  final TextEditingController calculationsController;
  final TextEditingController orderSourceController;
  final TextEditingController paymentModeController;
  final TextEditingController selectedCurrencyController;
  final TextEditingController currencyRateController;
  final TextEditingController rateController;

  const _MoreFieldsSheet({
    required this.partyNames,
    required this.dateController,
    required this.onDateTap,
    required this.refDocNbrController,
    required this.supplierController,
    required this.brokerController,
    required this.onSupplierChanged,
    required this.onBrokerChanged,
    required this.weightSourceController,
    required this.calculationsController,
    required this.orderSourceController,
    required this.paymentModeController,
    required this.selectedCurrencyController,
    required this.currencyRateController,
    required this.rateController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 80),
        decoration: BoxDecoration(
          color: context.navyCard,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.isDark
                    ? context.navyBorder
                    : AppColors.grey300,
                borderRadius: .circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'More Fields',
                    style: context.titleSmall.copyWith(fontWeight: .w700),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: context.isDark ? context.navyBorder : context.border,
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _TopFields(
                      partyNames: partyNames,
                      dateController: dateController,
                      onDateTap: onDateTap,
                      refDocNbrController: refDocNbrController,
                      supplierController: supplierController,
                      brokerController: brokerController,
                      onSupplierChanged: onSupplierChanged,
                      onBrokerChanged: onBrokerChanged,
                    ),
                    heightBox(10),
                    _ExtraFields(
                      weightSourceController: weightSourceController,
                      calculationsController: calculationsController,
                      orderSourceController: orderSourceController,
                      paymentModeController: paymentModeController,
                      selectedCurrencyController: selectedCurrencyController,
                      currencyRateController: currencyRateController,
                      rateController: rateController,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                8,
                16,
                MediaQuery.of(context).padding.bottom + 12,
              ),
              child: CustomButton(
                text: 'Done',
                onPressed: () => Navigator.of(context).pop(),
                radius: 8,
                elevation: 0,
                fontsize: 14,
                size: const Size.fromHeight(44),
              ),
            ),
          ],
        ),
      ),
    );
  }
}