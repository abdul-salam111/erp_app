import 'package:flutter/material.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class PurchaseOrderForm extends StatelessWidget {
  final DateTime date;
  final VoidCallback onDateTap;
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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.dateLabel),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      controller: TextEditingController(
                        text: date.format(AppConstants.ddMMMYyyyLabel),
                      ),
                      fieldHeight: 37,
                      readOnly: true,
                      onTap: onDateTap,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: "Ref Doc Nbr"),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      controller: refDocNbrController,
                      fieldHeight: 37,
                      hintText: "Ref Doc Nbr",
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightBox(10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.supplierLabel),
                    const SizedBox(height: 6),
                    SearchableDropdown(
                      items: [],
                      controller: supplierController,
                      hintText: AppConstants.supplierLabel,
                      onChanged: (value) {},
                      fieldHeight: 40,
                      isShowIcon: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: "Broker"),
                    const SizedBox(height: 6),
                    SearchableDropdown(
                      items: [],
                      controller: brokerController,
                      hintText: AppConstants.brokerLabel,
                      onChanged: (value) {},
                      fieldHeight: 40,
                      isShowIcon: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightBox(10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.weightSourceLabel),
                    const SizedBox(height: 6),
                    SearchableDropdown(
                      items: [],
                      controller: weightSourceController,
                      hintText: AppConstants.weightSourceLabel,
                      onChanged: (value) {},
                      fieldHeight: 40,
                      isShowIcon: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.calculationsLabel),
                    const SizedBox(height: 6),
                    SearchableDropdown(
                      items: [],
                      controller: calculationsController,
                      hintText: AppConstants.calculationsLabel,
                      onChanged: (value) {},
                      fieldHeight: 40,
                      isShowIcon: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightBox(10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.orderSourceLabel),
                    const SizedBox(height: 6),
                    SearchableDropdown(
                      items: [],
                      controller: orderSourceController,
                      hintText: AppConstants.orderSourceLabel,
                      onChanged: (value) {},
                      fieldHeight: 40,
                      isShowIcon: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.paymentModeLabel),
                    const SizedBox(height: 6),
                    SearchableDropdown(
                      items: [],
                      controller: paymentModeController,
                      hintText: AppConstants.paymentModeLabel,
                      onChanged: (value) {},
                      fieldHeight: 40,
                      isShowIcon: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightBox(10),
          Column(
            crossAxisAlignment: .start,
            children: [
              FormLabel(text: AppConstants.currencyLabel),
              const SizedBox(height: 6),
              SearchableDropdown(
                items: [],
                controller: selectedCurrencyController,
                hintText: AppConstants.currencyLabel,
                onChanged: (value) {},
                fieldHeight: 40,
                isShowIcon: false,
              ),
            ],
          ),
          heightBox(10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.currencyRateLabel),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      controller: currencyRateController,
                      fieldHeight: 37,
                      hintText: AppConstants.currencyRateLabel,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    FormLabel(text: AppConstants.currencyRate),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      controller: rateController,
                      fieldHeight: 37,
                      hintText: AppConstants.currencyRate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
