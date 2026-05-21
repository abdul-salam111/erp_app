import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dropdown_textfield.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../accounts_exports.dart';

class AccountLedgerView extends StatelessWidget {
  const AccountLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AccountLedgerBloc>(),
      child: const _AccountLedgerBody(),
    );
  }
}

class _AccountLedgerBody extends StatefulWidget {
  const _AccountLedgerBody();

  @override
  State<_AccountLedgerBody> createState() => _AccountLedgerBodyState();
}

class _AccountLedgerBodyState extends State<_AccountLedgerBody> {
  final _formKey = GlobalKey<FormState>();
  final _accountController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();

  late DateTime _fromDate;
  late DateTime _toDate;

  // Placeholder — replace with API-loaded accounts
  static const List<String> _accounts = [
    'HMB Okara-PK39MPBL0224027140126601',
    'MCB Lahore-PK12MCBL0000001234567890',
    'HBL Karachi-PK36HABB0000049008001001',
  ];

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _fromDateController.text = _fromDate.format('dd/MM/yyyy');
    _toDateController.text = _toDate.format('dd/MM/yyyy');
  }

  @override
  void dispose() {
    _accountController.dispose();
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(bool isFrom) async {
    final initial = isFrom ? _fromDate : _toDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
          _fromDateController.text = picked.format('dd/MM/yyyy');
        } else {
          _toDate = picked;
          _toDateController.text = picked.format('dd/MM/yyyy');
        }
      });
    }
  }

  void _onView() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AccountLedgerBloc>().add(const AccountLedgerSubmitted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountLedgerBloc, AccountLedgerState>(
      listenWhen: (prev, curr) => prev.apiStatus != curr.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(title: AppConstants.accountLedgerLabel),
        body: SingleChildScrollView(
          padding: context.pagePadding,
          child: Form(
            key: _formKey,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(10),
                border: .all(color: context.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const .all(10),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  // Account
                  _FieldLabel('Account', isRequired: true),
                  const SizedBox(height: 5),
                  SearchableDropdown(
                    items: _accounts,
                    controller: _accountController,
                    hintText: 'Select account',
                    fieldHeight: 35,
                    onChanged: (_) {},
                  ),

                  const SizedBox(height: 12),

                  // From / To dates
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          label: 'From Date',
                          isRequired: true,
                          labelFontSize: 12,
                          hintText: 'dd/MM/yyyy',
                          prefixIcon: Iconsax.calendar,
                          controller: _fromDateController,
                          readOnly: true,
                          fieldHeight: 35,
                          onTap: () => _pickDate(true),
                          validator: (val) => Validator.validateRequired(
                            val,
                            fieldName: 'From Date',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFormField(
                          label: 'To Date',
                          isRequired: true,
                          labelFontSize: 12,
                          hintText: 'dd/MM/yyyy',
                          prefixIcon: Iconsax.calendar,
                          controller: _toDateController,
                          readOnly: true,
                          fieldHeight: 35,
                          onTap: () => _pickDate(false),
                          validator: (val) => Validator.validateRequired(
                            val,
                            fieldName: 'To Date',
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Divider(height: 1, thickness: 1, color: context.border),
                  const SizedBox(height: 10),

                  // Action buttons
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'View',
                          icon: Iconsax.eye,
                          size: const Size(.infinity, 36),
                          radius: 8,
                          fontsize: 13,
                          iconSize: 16,
                          onPressed: _onView,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          size: const Size(.infinity, 36),
                          text: 'Print',
                          icon: Iconsax.printer,
                          radius: 8,
                          fontsize: 13,
                          iconSize: 16,
                          backgroundColor: AppColors.primaryLight,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label, {this.isRequired = false});

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
          if (isRequired)
            TextSpan(
              text: ' *',
              style: context.bodySmall.copyWith(
                color: context.error,
                fontWeight: .bold,
              ),
            ),
        ],
      ),
    );
  }
}
