import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class CreditManagementView extends StatelessWidget {
  const CreditManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreditManagementBloc>(),
      child: const _CreditManagementBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _CreditManagementBody extends StatefulWidget {
  const _CreditManagementBody();

  @override
  State<_CreditManagementBody> createState() => _CreditManagementBodyState();
}

class _CreditManagementBodyState extends State<_CreditManagementBody> {
  late DateTime _date;
  late final TextEditingController _partyController;
  late final ScrollController _scrollController;

  String? _financialYear;
  String? _customerType;
  String? _groupOn;
  String? _creditRating;
  bool _filterCollapsed = false;

  static const _financialYearOptions = ['2023-2024', '2024-2025', '2025-2026'];
  static const _customerTypeOptions = ['Retailer', 'Wholesaler', 'Distributor'];
  static const _groupOnOptions = ['Party', 'City', 'Category'];
  static const _creditRatingOptions = ['A', 'B', 'C'];

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _partyController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _partyController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final collapsed = _scrollController.offset > 40;
    if (collapsed != _filterCollapsed) setState(() => _filterCollapsed = collapsed);
  }

  void _fetch() {
    setState(() => _filterCollapsed = false);
    context.read<CreditManagementBloc>().add(const CreditManagementSubmitted());
  }

  Future<void> _pickDate() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditManagementBloc, CreditManagementState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, AppConstants.successSuccessMsg);
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: UnfocusWrapper(
        child: Scaffold(
          backgroundColor: context.grey50,
          appBar: CustomAppBar(title: AppConstants.creditManagementLabel),
          body: Column(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeInOut,
                alignment: .topCenter,
                child: _filterCollapsed
                    ? _CompactFilterBar(
                        partyName: _partyController.text,
                        date: _date,
                        onExpand: () {
                          setState(() => _filterCollapsed = false);
                          if (_scrollController.hasClients) {
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                      )
                    : _FilterForm(
                        date: _date,
                        partyController: _partyController,
                        financialYear: _financialYear,
                        customerType: _customerType,
                        groupOn: _groupOn,
                        creditRating: _creditRating,
                        financialYearOptions: _financialYearOptions,
                        customerTypeOptions: _customerTypeOptions,
                        groupOnOptions: _groupOnOptions,
                        creditRatingOptions: _creditRatingOptions,
                        onPartyChanged: (_) => setState(() {}),
                        onFinancialYearChanged: (val) => setState(() => _financialYear = val),
                        onCustomerTypeChanged: (val) => setState(() => _customerType = val),
                        onGroupOnChanged: (val) => setState(() => _groupOn = val),
                        onCreditRatingChanged: (val) => setState(() => _creditRating = val),
                        onPickDate: _pickDate,
                        onView: _fetch,
                      ),
              ),
              Expanded(
                child: ColoredBox(
                  color: context.white,
                  child: BlocBuilder<CreditManagementBloc, CreditManagementState>(
                    builder: (context, state) {
                      if (state.apiStatus == ApiStatus.LOADING) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state.apiStatus == ApiStatus.FAILURE) {
                        return Center(
                          child: Text(
                            state.message ?? AppConstants.somethingWentWrong,
                            style: context.bodySmall.copyWith(color: context.textSecondary),
                            textAlign: .center,
                          ),
                        );
                      }
                      return const _IdleState();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Compact filter bar ───────────────────────────────────────────────────────

class _CompactFilterBar extends StatelessWidget {
  final String partyName;
  final DateTime date;
  final VoidCallback onExpand;

  const _CompactFilterBar({
    required this.partyName,
    required this.date,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final hasParty = partyName.isNotEmpty;
    return GestureDetector(
      onTap: onExpand,
      child: Container(
        decoration: BoxDecoration(color: context.grey100),
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left, 10, context.pagePadding.right, 10),
        child: Row(
          children: [
            Icon(Iconsax.setting_4, size: 15, color: context.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                hasParty ? partyName : AppConstants.selectParty,
                style: context.bodySmall.copyWith(
                  color: hasParty ? context.textPrimary : context.textSecondary,
                  fontWeight: .w500,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date.format(AppConstants.ddMMMYyyyLabel),
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 11,
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.keyboard_arrow_down_rounded,
                size: 18, color: context.textSecondary),
          ],
        ),
      ),
    );
  }
}

// ─── Filter form ──────────────────────────────────────────────────────────────

class _FilterForm extends StatelessWidget {
  final DateTime date;
  final TextEditingController partyController;
  final String? financialYear;
  final String? customerType;
  final String? groupOn;
  final String? creditRating;
  final List<String> financialYearOptions;
  final List<String> customerTypeOptions;
  final List<String> groupOnOptions;
  final List<String> creditRatingOptions;
  final ValueChanged<String> onPartyChanged;
  final ValueChanged<String?> onFinancialYearChanged;
  final ValueChanged<String?> onCustomerTypeChanged;
  final ValueChanged<String?> onGroupOnChanged;
  final ValueChanged<String?> onCreditRatingChanged;
  final VoidCallback onPickDate;
  final VoidCallback onView;

  const _FilterForm({
    required this.date,
    required this.partyController,
    required this.financialYear,
    required this.customerType,
    required this.groupOn,
    required this.creditRating,
    required this.financialYearOptions,
    required this.customerTypeOptions,
    required this.groupOnOptions,
    required this.creditRatingOptions,
    required this.onPartyChanged,
    required this.onFinancialYearChanged,
    required this.onCustomerTypeChanged,
    required this.onGroupOnChanged,
    required this.onCreditRatingChanged,
    required this.onPickDate,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.white,
      padding: EdgeInsets.fromLTRB(
          context.pagePadding.left, 12, context.pagePadding.right, 12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // ── Row 1: Party (full width) ────────────────────────
          _FormLabel(text: AppConstants.partyBtn),
          const SizedBox(height: 6),
          SearchableDropdown(
            items: const [],
            controller: partyController,
            hintText: AppConstants.selectPartyHint,
            onChanged: onPartyChanged,
            fieldHeight: 40,
          ),
          const SizedBox(height: 10),

          // ── Row 2: Financial Year | Date ─────────────────────
          Row(
            crossAxisAlignment: .end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: 'Financial Year'),
                    const SizedBox(height: 6),
                    _SimpleDropdown(
                      items: financialYearOptions,
                      value: financialYear,
                      hint: 'Select Year',
                      onChanged: onFinancialYearChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: AppConstants.dateLabel),
                    const SizedBox(height: 6),
                    _DateTile(
                      label: date.format(AppConstants.ddMMMYyyyLabel),
                      onTap: onPickDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // ── Row 3: Customer Type | Group On | Credit Rating ──
          Row(
            crossAxisAlignment: .end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: 'Customer Type'),
                    const SizedBox(height: 6),
                    _SimpleDropdown(
                      items: customerTypeOptions,
                      value: customerType,
                      hint: 'Select',
                      onChanged: onCustomerTypeChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: 'Group On'),
                    const SizedBox(height: 6),
                    _SimpleDropdown(
                      items: groupOnOptions,
                      value: groupOn,
                      hint: 'Select',
                      onChanged: onGroupOnChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: 'Credit Rating'),
                    const SizedBox(height: 6),
                    _SimpleDropdown(
                      items: creditRatingOptions,
                      value: creditRating,
                      hint: 'Select',
                      onChanged: onCreditRatingChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // ── View button ───────────────────────────────────────
          CustomButton(
            text: AppConstants.view,
            onPressed: onView,
            radius: 10,
            elevation: 0,
            fontsize: 14,
            size: const Size(double.infinity, 40),
          ),
        ],
      ),
    );
  }
}

// ─── Form label ───────────────────────────────────────────────────────────────

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w500,
        fontSize: 12,
      ),
      maxLines: 1,
      overflow: .ellipsis,
    );
  }
}

// ─── Date tile ────────────────────────────────────────────────────────────────

class _DateTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DateTile({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: .circular(6),
          border: .all(color: context.border.withAlpha(50)),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 16, color: context.textSecondary),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                label,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 12,
                ),
                overflow: .ellipsis,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded,
                size: 18, color: context.grey500),
          ],
        ),
      ),
    );
  }
}

// ─── Simple dropdown ──────────────────────────────────────────────────────────

class _SimpleDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hint;
  final ValueChanged<String?> onChanged;

  const _SimpleDropdown({
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = context.border.withAlpha(50);
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          isDense: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: context.grey500, size: 20),
          hint: Text(
            hint,
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
          style: context.bodySmall.copyWith(color: context.textPrimary),
          dropdownColor: context.surface,
          borderRadius: BorderRadius.circular(10),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// ─── Idle state ───────────────────────────────────────────────────────────────

class _IdleState extends StatelessWidget {
  const _IdleState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Iconsax.user_tick, size: 48, color: AppColors.grey300),
          const SizedBox(height: 12),
          Text(
            'No data yet',
            style: context.bodyMedium.copyWith(
              fontWeight: .w500,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            AppConstants.selectAPartyAndTap,
            style: context.bodySmall.copyWith(color: AppColors.grey400),
          ),
        ],
      ),
    );
  }
}
