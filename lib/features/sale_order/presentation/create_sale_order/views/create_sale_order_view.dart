import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../blocs/create_sale_order_bloc.dart';
import '../blocs/create_sale_order_event.dart';
import '../blocs/create_sale_order_state.dart';
import '../widgets/sale_order_form.dart';
import '../widgets/sale_order_items_table.dart';

class CreateSaleOrderView extends StatelessWidget {
  const CreateSaleOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreateSaleOrderBloc>(),
      child: const _CreateSaleOrderBody(),
    );
  }
}

class _CreateSaleOrderBody extends StatefulWidget {
  const _CreateSaleOrderBody();

  @override
  State<_CreateSaleOrderBody> createState() => _CreateSaleOrderBodyState();
}

class _CreateSaleOrderBodyState extends State<_CreateSaleOrderBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _brokerController;
  late final TextEditingController _customerController;
  late final TextEditingController _calculationsController;
  late final TextEditingController _paymentModeController;
  late final TextEditingController _weightSourceController;
  late final TextEditingController _selectedCurrencyController;
  late final TextEditingController _currencyRateController;
  late final TextEditingController _rateController;
  late final TextEditingController _refDocNbrController;
  late final TextEditingController _orderSourceController;
  late final TextEditingController _orderRemarksController;

  double _productTotal(List<SaleOrderRowItem> rows) =>
      rows.fold(0.0, (s, r) => s + r.contractQty * r.price);
  double _totalDiscount(List<SaleOrderRowItem> rows) =>
      rows.fold(0.0, (s, r) => s + r.discValue);
  double _subTotal(List<SaleOrderRowItem> rows) =>
      _productTotal(rows) - _totalDiscount(rows);
  double _totalTax(List<SaleOrderRowItem> rows) =>
      rows.fold(0.0, (s, r) => s + r.vatAmount);
  double _netAmount(List<SaleOrderRowItem> rows) =>
      rows.fold(0.0, (s, r) => s + r.total);

  @override
  void initState() {
    super.initState();
    _brokerController = TextEditingController();
    _customerController = TextEditingController();
    _calculationsController = TextEditingController();
    _paymentModeController = TextEditingController();
    _weightSourceController = TextEditingController();
    _selectedCurrencyController = TextEditingController();
    _currencyRateController = TextEditingController();
    _rateController = TextEditingController();
    _refDocNbrController = TextEditingController();
    _orderSourceController = TextEditingController();
    _orderRemarksController = TextEditingController();
  }

  @override
  void dispose() {
    _brokerController.dispose();
    _customerController.dispose();
    _calculationsController.dispose();
    _paymentModeController.dispose();
    _weightSourceController.dispose();
    _selectedCurrencyController.dispose();
    _currencyRateController.dispose();
    _rateController.dispose();
    _refDocNbrController.dispose();
    _orderSourceController.dispose();
    _orderRemarksController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final bloc = context.read<CreateSaleOrderBloc>();
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: bloc.state.date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      bloc.add(SaleOrderDateChanged(picked));
    }
  }

  Future<void> _addRow() async {
    final result = await showSaleOrderRowBottomSheet(context);
    if (result != null && mounted) {
      context.read<CreateSaleOrderBloc>().add(SaleOrderRowAdded(result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateSaleOrderBloc, CreateSaleOrderState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        final rows = state.rows;
        return UnfocusWrapper(
          child: Scaffold(
            appBar: CustomAppBar(title: 'Create Sale Order'),
            body: Form(
              key: _formKey,
              child: ListView(
                padding: .all(8),
                children: [
                  SaleOrderForm(
                    date: state.date,
                    onDateTap: _pickDate,
                    hasItems: rows.isNotEmpty,
                    refDocNbrController: _refDocNbrController,
                    customerController: _customerController,
                    brokerController: _brokerController,
                    weightSourceController: _weightSourceController,
                    calculationsController: _calculationsController,
                    orderSourceController: _orderSourceController,
                    paymentModeController: _paymentModeController,
                    selectedCurrencyController: _selectedCurrencyController,
                    currencyRateController: _currencyRateController,
                    rateController: _rateController,
                  ),
                  heightBox(8),
                  if (rows.isEmpty)
                    const _EmptyItemsHint()
                  else ...[
                    SaleOrderItemsTable(
                      rows: rows,
                      onDelete: (index) => context
                          .read<CreateSaleOrderBloc>()
                          .add(SaleOrderRowRemoved(index)),
                      onEdit: (index, updated) => context
                          .read<CreateSaleOrderBloc>()
                          .add(SaleOrderRowUpdated(index, updated)),
                    ),
                  ],
                  heightBox(8),
                  GestureDetector(
                    onTap: _addRow,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: context.primary.withValues(alpha: 0.06),
                        borderRadius: .circular(8),
                        border: Border.all(
                          color: context.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(Icons.add_rounded, size: 18, color: context.primary),
                          const SizedBox(width: 6),
                          Text(
                            'Add Row',
                            style: context.bodySmall.copyWith(
                              color: context.primary,
                              fontWeight: .w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (rows.isNotEmpty) ...[
                    heightBox(8),
                    if (context.isPhone) ...[
                      _OrderSummarySection(
                        productTotal: _productTotal(rows),
                        totalDiscount: _totalDiscount(rows),
                        subTotal: _subTotal(rows),
                        totalTax: _totalTax(rows),
                        netAmount: _netAmount(rows),
                      ),
                      heightBox(8),
                      _OrderRemarksSection(controller: _orderRemarksController),
                    ] else
                      Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: _OrderSummarySection(
                              productTotal: _productTotal(rows),
                              totalDiscount: _totalDiscount(rows),
                              subTotal: _subTotal(rows),
                              totalTax: _totalTax(rows),
                              netAmount: _netAmount(rows),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _OrderRemarksSection(controller: _orderRemarksController),
                          ),
                        ],
                      ),
                    heightBox(8),
                    CustomButton(
                      text: 'Add Order',
                      onPressed: () {},
                      radius: 8,
                      elevation: 0,
                      fontsize: 14,
                      size: const Size.fromHeight(46),
                    ),
                  ],
                  heightBox(16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmptyItemsHint extends StatelessWidget {
  const _EmptyItemsHint();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 38,
            color: context.textSecondary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 10),
          Text(
            'No items added yet',
            style: context.bodySmall.copyWith(
              fontWeight: .w600,
              fontSize: 13,
              color: context.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Tap Add Row below to add items to this order.',
            style: context.bodySmall.copyWith(
              fontSize: 12,
              color: context.textSecondary,
            ),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}

class _OrderRemarksSection extends StatelessWidget {
  final TextEditingController controller;
  const _OrderRemarksSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Order Remarks',
            style: context.bodySmall.copyWith(
              fontWeight: .w600,
              fontSize: 12,
              color: context.textPrimary,
            ),
          ),
          heightBox(8),
          CustomTextFormField(
            controller: controller,
            hintText: 'Add any notes or remarks for this order…',
            maxLines: 6,
            fieldHeight: null,
            contentPadding: .all(12),
          ),
        ],
      ),
    );
  }
}

class _OrderSummarySection extends StatelessWidget {
  final double productTotal;
  final double totalDiscount;
  final double subTotal;
  final double totalTax;
  final double netAmount;

  const _OrderSummarySection({
    required this.productTotal,
    required this.totalDiscount,
    required this.subTotal,
    required this.totalTax,
    required this.netAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              'Order Summary',
              style: context.bodySmall.copyWith(
                fontWeight: .w600,
                fontSize: 12,
                color: context.textPrimary,
              ),
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              children: [
                _SummaryRow(label: 'Product Total', value: productTotal.asPrice),
                heightBox(8),
                _SummaryRow(
                  label: 'Discounts',
                  value: totalDiscount.asPrice,
                  valueColor: totalDiscount > 0 ? Colors.green.shade600 : null,
                ),
                heightBox(8),
                _SummaryRow(label: 'Sub Total', value: subTotal.asPrice),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: _SummaryRow(label: 'Total Tax', value: totalTax.asPrice),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Net Amount',
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    fontSize: 13,
                    color: context.primary,
                  ),
                ),
                Text(
                  netAmount.asPrice,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    fontSize: 14,
                    color: context.primary,
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

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _SummaryRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          label,
          style: context.bodySmall.copyWith(fontSize: 12, color: context.textSecondary),
        ),
        Text(
          value,
          style: context.bodySmall.copyWith(
            fontSize: 12,
            fontWeight: .w600,
            color: valueColor ?? context.textPrimary,
          ),
        ),
      ],
    );
  }
}
