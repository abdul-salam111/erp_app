import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../purchase_order_exports.dart';

class CreatePurchaseOrderView extends StatelessWidget {
  const CreatePurchaseOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreatePurchaseOrderBloc>(),
      child: const _CreatePurchaseOrderBody(),
    );
  }
}

class _CreatePurchaseOrderBody extends StatefulWidget {
  const _CreatePurchaseOrderBody();

  @override
  State<_CreatePurchaseOrderBody> createState() =>
      _CreatePurchaseOrderBodyState();
}

class _CreatePurchaseOrderBodyState extends State<_CreatePurchaseOrderBody> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickDate() async {
    final bloc = context.read<CreatePurchaseOrderBloc>();
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: bloc.state.date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      bloc.add(PurchaseOrderDateChanged(picked));
    }
  }

  late final TextEditingController _brokerController;
  late final TextEditingController _supplierController;
  late final TextEditingController _calculationsController;
  late final TextEditingController _paymentModeController;
  late final TextEditingController _weightSourceController;
  late final TextEditingController _selectedCurrencyController;
  late final TextEditingController _currencyRateController;
  late final TextEditingController _rateController;
  late final TextEditingController _refDocNbrController;
  late final TextEditingController _orderSourceController;

  @override
  initState() {
    super.initState();
    _brokerController = TextEditingController();
    _supplierController = TextEditingController();
    _calculationsController = TextEditingController();
    _paymentModeController = TextEditingController();
    _weightSourceController = TextEditingController();
    _selectedCurrencyController = TextEditingController();
    _currencyRateController = TextEditingController();
    _rateController = TextEditingController();
    _refDocNbrController = TextEditingController();
    _orderSourceController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePurchaseOrderBloc, CreatePurchaseOrderState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return UnfocusWrapper(
          child: Scaffold(
            appBar: CustomAppBar(title: 'Create Purchase Order'),
            body: Form(
              key: _formKey,
              child: ListView(
                padding: .all(8),
                children: [
                  Container(
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
                                      text: state.date.format(
                                        AppConstants.ddMMMYyyyLabel,
                                      ),
                                    ),
                                    fieldHeight: 37,
                                    readOnly: true,
                                    onTap: _pickDate,
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
                                    controller: _refDocNbrController,
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
                                    controller: _supplierController,
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
                                    controller: _brokerController,
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
                                  FormLabel(
                                    text: AppConstants.weightSourceLabel,
                                  ),
                                  const SizedBox(height: 6),
                                  SearchableDropdown(
                                    items: [],
                                    controller: _weightSourceController,
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
                                  FormLabel(
                                    text: AppConstants.calculationsLabel,
                                  ),
                                  const SizedBox(height: 6),
                                  SearchableDropdown(
                                    items: [],
                                    controller: _calculationsController,
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
                                  FormLabel(
                                    text: AppConstants.orderSourceLabel,
                                  ),
                                  const SizedBox(height: 6),
                                  SearchableDropdown(
                                    items: [],
                                    controller: _orderSourceController,
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
                                  FormLabel(
                                    text: AppConstants.paymentModeLabel,
                                  ),
                                  const SizedBox(height: 6),
                                  SearchableDropdown(
                                    items: [],
                                    controller: _calculationsController,
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
                              controller: _selectedCurrencyController,
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
                                  FormLabel(
                                    text: AppConstants.currencyRateLabel,
                                  ),
                                  const SizedBox(height: 6),
                                  CustomTextFormField(
                                    controller: _currencyRateController,
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
                                    controller: _rateController,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
