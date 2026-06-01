import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

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

// ─── Body ─────────────────────────────────────────────────────────────────────

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
    context.read<AccountLedgerBloc>().add(
      AccountLedgerSubmitted(
        fromDate: _fromDate.format('dd-MMM-yyyy'),
        toDate: _toDate.format('dd-MMM-yyyy'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountLedgerBloc, AccountLedgerState>(
      listenWhen: (prev, curr) =>
          prev.apiStatus != curr.apiStatus ||
          prev.pdfStatus != curr.pdfStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
        if (state.pdfStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
        if (state.pdfStatus == ApiStatus.SUCCESS && state.pdfUrl != null) {
          // TODO: Navigate to PDF preview screen when available
          AppToastsUtils.showSuccessTop(context, 'Invoice ready');
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(title: AppConstants.accountLedgerLabel),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
          crossAxisAlignment: .start,
          children: [
            // ── Filter form ──────────────────────────────────────────────────
            Padding(
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
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
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<AccountLedgerBloc, AccountLedgerState>(
                              buildWhen: (p, c) => p.apiStatus != c.apiStatus,
                              builder: (context, state) => CustomButton(
                                text: 'View',
                                icon: Iconsax.eye,
                                size: const Size(double.infinity, 36),
                                radius: 8,
                                fontsize: 13,
                                iconSize: 16,
                                isLoading: state.apiStatus == ApiStatus.LOADING,
                                onPressed: _onView,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              size: const Size(double.infinity, 36),
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

            // ── Statements section ───────────────────────────────────────────
            Expanded(
              child: BlocBuilder<AccountLedgerBloc, AccountLedgerState>(
                buildWhen: (p, c) =>
                    p.apiStatus != c.apiStatus ||
                    p.statements != c.statements,
                builder: (context, state) {
                  if (state.apiStatus == ApiStatus.LOADING) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.apiStatus == ApiStatus.SUCCESS &&
                      state.statements.isEmpty) {
                    return _EmptyStatements(onChangeDates: _onView);
                  }
                  if (state.apiStatus == ApiStatus.SUCCESS) {
                    return _StatementsList(statements: state.statements);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyStatements extends StatelessWidget {
  final VoidCallback onChangeDates;
  const _EmptyStatements({required this.onChangeDates});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'No records found',
            style: context.bodyMedium.copyWith(
              fontWeight: .w500,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Try selecting a different date range',
            style: context.bodySmall.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}

// ─── Statements list ──────────────────────────────────────────────────────────

class _StatementsList extends StatelessWidget {
  final List<AccountLedgerModel> statements;
  const _StatementsList({required this.statements});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: context.pagePadding.left,
        right: context.pagePadding.right,
        top: 8,
        bottom: 16,
      ),
      children: [
        for (final yearData in statements)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _YearCard(yearData: yearData),
          ),
      ],
    );
  }
}

// ─── Year card ────────────────────────────────────────────────────────────────

class _YearCard extends StatefulWidget {
  final AccountLedgerModel yearData;
  const _YearCard({required this.yearData});

  @override
  State<_YearCard> createState() => _YearCardState();
}

class _YearCardState extends State<_YearCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final yearData = widget.yearData;
    final hasContent = yearData.ledgerTypes?.any(
      (lt) =>
          (lt.ledgers ?? []).isNotEmpty &&
          !(lt.ttlDebit == 0 && lt.ttlCredit == 0 && lt.balance == 0),
    ) ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          // ── Year header ──
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: _expanded
                    ? const BorderRadius.vertical(top: Radius.circular(10))
                    : .circular(10),
                border: _expanded
                    ? Border(bottom: BorderSide(color: context.border))
                    : null,
              ),
              child: Row(
                children: [
                  Icon(Iconsax.calendar_1, color: context.primary, size: 22),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      yearData.finYear?.name??"",
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        color: context.textPrimary,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      Text(
                        _formatBalance(context, yearData.balance ?? 0),
                        style: context.bodySmall.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            'Rs. ${yearData.ttlDebit!.formatPrice()} Dr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rs. ${yearData.ttlCredit!.formatPrice()} Cr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Ledger types ──
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOutCubic,
            alignment: .topCenter,
            child: _expanded
                ? hasContent
                    ? Column(
                        crossAxisAlignment: .start,
                        children: (yearData.ledgerTypes ?? [])
                            .where(
                              (lt) =>
                                  (lt.ledgers ?? []).isNotEmpty &&
                                  !(lt.ttlDebit == 0 &&
                                      lt.ttlCredit == 0 &&
                                      lt.balance == 0),
                            )
                            .map((lt) => _LedgerTypeSection(ledgerType: lt))
                            .toList(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'No ledger data available',
                          style: context.bodySmall.copyWith(
                            color: context.textSecondary,
                          ),
                        ),
                      )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ─── Ledger type section ──────────────────────────────────────────────────────

class _LedgerTypeSection extends StatelessWidget {
  final LedgerTypeModel ledgerType;
  const _LedgerTypeSection({required this.ledgerType});

  @override
  Widget build(BuildContext context) {
    final type = ledgerType.type ?? '';
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (type.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(top: BorderSide(color: context.border)),
            ),
            child: Text(
              type.toUpperCase(),
              style: context.labelSmall.copyWith(
                fontWeight: .w600,
                color: context.textSecondary,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ...(ledgerType.ledgers ?? []).map((ledger) => _LedgerRow(ledger: ledger)),
      ],
    );
  }
}

// ─── Ledger row ───────────────────────────────────────────────────────────────

class _LedgerRow extends StatelessWidget {
  final LedgerModel ledger;
  const _LedgerRow({required this.ledger});

  @override
  Widget build(BuildContext context) {
    final isOpening = ledger.isOpening ?? false;
    final drAmount = ledger.drAmount ?? 0;
    final crAmount = ledger.crAmount ?? 0;
    final date = _parsedDate(ledger.docDate ?? '', isOpening);
    final dr = drAmount == 0 ? '0.0' : drAmount.formatPrice();
    final cr = crAmount == 0 ? '0.0' : crAmount.formatPrice();

    final bool isDrOnly = drAmount > 0 && crAmount == 0;
    final bool isCrOnly = crAmount > 0 && drAmount == 0;

    final Color iconBg;
    final Color iconColor;
    final IconData iconData;

    if (isOpening) {
      iconBg = Colors.grey.shade100;
      iconColor = Colors.grey.shade500;
      iconData = Icons.horizontal_rule_rounded;
    } else if (isDrOnly) {
      iconBg = const Color(0xFFFFE8E8);
      iconColor = const Color(0xFFD63A3A);
      iconData = Icons.arrow_upward_rounded;
    } else if (isCrOnly) {
      iconBg = const Color(0xFFDCF5E7);
      iconColor = const Color(0xFF1B8A5A);
      iconData = Icons.arrow_downward_rounded;
    } else {
      iconBg = context.primary.withValues(alpha: 0.12);
      iconColor = context.primary;
      iconData = Icons.swap_horiz_rounded;
    }

    final String amountText;
    final Color amountColor;

    if (isOpening) {
      final val = drAmount > 0 ? drAmount : crAmount;
      amountText = val.formatPrice();
      amountColor = Colors.grey.shade600;
    } else if (isDrOnly) {
      amountText = drAmount.formatPrice();
      amountColor = const Color(0xFFD63A3A);
    } else if (isCrOnly) {
      amountText = crAmount.formatPrice();
      amountColor = const Color(0xFF1B8A5A);
    } else {
      amountText = '${drAmount.formatPrice()} / ${crAmount.formatPrice()}';
      amountColor = context.textPrimary;
    }

    final String title = isOpening
        ? 'Opening balance'
        : [
            if (ledger.featureName?.isNotEmpty == true) ledger.featureName!,
            if (ledger.docNbr?.isNotEmpty == true) ledger.docNbr!,
          ].join(' • ');

    return InkWell(
      onTap: () => _openDetail(context, date, dr, cr),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: context.border)),
        ),
        child: Row(
          children: [
            // Icon box
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: .circular(10),
              ),
              child: Icon(iconData, size: 17, color: iconColor),
            ),
            const SizedBox(width: 10),

            // Title + date
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w600,
                      color: context.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  if (date.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      date,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Amount + balance
            Column(
              crossAxisAlignment: .end,
              children: [
                if (!isOpening)
                  Text(
                    isDrOnly ? 'Debit' : isCrOnly ? 'Credit' : 'Dr / Cr',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                Text(
                  amountText,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    color: amountColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatBalance(context, ledger.balance ?? 0),
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, String date, String dr, String cr) {
    showDialog(
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<AccountLedgerBloc>(),
        child: _LedgerDetailDialog(
          ledger: ledger,
          date: date,
          dr: dr,
          cr: cr,
        ),
      ),
    );
  }

  static String _parsedDate(String docDate, bool isOpening) {
    if (isOpening || docDate.isEmpty || docDate == '0001-01-01') return '';
    try {
      return DateFormat('dd MMM yyyy').format(DateTime.parse(docDate));
    } catch (_) {
      return '';
    }
  }
}

// ─── Ledger detail dialog ─────────────────────────────────────────────────────

class _LedgerDetailDialog extends StatelessWidget {
  final LedgerModel ledger;
  final String date;
  final String dr;
  final String cr;

  const _LedgerDetailDialog({
    required this.ledger,
    required this.date,
    required this.dr,
    required this.cr,
  });

  @override
  Widget build(BuildContext context) {
    final isOpening = ledger.isOpening ?? false;
    final hasDebit = dr != '0.0';
    final hasCredit = cr != '0.0';

    final Color accentColor;
    final IconData directionIcon;

    if (isOpening) {
      accentColor = Colors.grey.shade500;
      directionIcon = Icons.horizontal_rule_rounded;
    } else if (hasDebit && !hasCredit) {
      accentColor = const Color(0xFFD63A3A);
      directionIcon = Icons.arrow_upward_rounded;
    } else if (!hasDebit && hasCredit) {
      accentColor = const Color(0xFF1B8A5A);
      directionIcon = Icons.arrow_downward_rounded;
    } else {
      accentColor = context.primary;
      directionIcon = Icons.swap_horiz_rounded;
    }

    final String typeLabel = isOpening
        ? 'Opening Balance'
        : hasDebit && !hasCredit
            ? 'Debit Transaction'
            : !hasDebit && hasCredit
                ? 'Credit Transaction'
                : 'Dr / Cr Transaction';

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            // Type chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.10),
                borderRadius: .circular(20),
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(directionIcon, size: 13, color: accentColor),
                  const SizedBox(width: 5),
                  Text(
                    typeLabel,
                    style: context.labelSmall.copyWith(
                      fontWeight: .w600,
                      color: accentColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            if (!isOpening && ledger.docNbr != null) ...[
              _InfoRow(label: 'Doc #', value: ledger.docNbr!),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            if (!isOpening && date.isNotEmpty) ...[
              _InfoRow(label: 'Date', value: date),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],

            // Amount cards
            if (isOpening) ...[
              _AmountCard(
                label: 'Opening Balance',
                amount: 'Rs. ${hasDebit ? dr : cr}',
                bg: Colors.grey.shade100,
                color: Colors.grey.shade700,
              ),
            ] else ...[
              if (hasDebit) ...[
                _AmountCard(
                  label: 'Debit',
                  amount: 'Rs. $dr',
                  bg: const Color(0xFFFFE8E8),
                  color: const Color(0xFFD63A3A),
                ),
                if (hasCredit) const SizedBox(height: 10),
              ],
              if (hasCredit)
                _AmountCard(
                  label: 'Credit',
                  amount: 'Rs. $cr',
                  bg: const Color(0xFFDCF5E7),
                  color: const Color(0xFF1B8A5A),
                ),
            ],
            const SizedBox(height: 16),
            Divider(color: context.border, height: 1),
            const SizedBox(height: 14),

            if (!isOpening && (ledger.narration?.isNotEmpty ?? false)) ...[
              _InfoRow(label: 'Narration', value: ledger.narration!),
              const SizedBox(height: 12),
              Divider(color: context.border, height: 1),
              const SizedBox(height: 12),
            ],
            _InfoRow(
              label: 'Balance after',
              value: _formatBalance(context, ledger.balance ?? 0),
            ),
            const SizedBox(height: 20),

            // Buttons
            BlocBuilder<AccountLedgerBloc, AccountLedgerState>(
              buildWhen: (p, c) =>
                  p.isPrinting != c.isPrinting ||
                  p.printableFeatureIds != c.printableFeatureIds,
              builder: (context, state) {
                final loading = state.isPrinting;
                final canPrint =
                    !isOpening && state.canPrint(ledger.featureId ?? 0);
                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: context.textSecondary,
                          side: BorderSide(color: context.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          'Close',
                          style: context.bodySmall,
                        ),
                      ),
                    ),
                    if (canPrint) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: loading
                              ? null
                              : () => context.read<AccountLedgerBloc>().add(
                                    AccountLedgerPrintRequested(
                                      featureId: ledger.featureId ?? 0,
                                      parentEntityId:
                                          ledger.parentEntityId ?? 0,
                                      featureName: ledger.featureName,
                                      docNbr: ledger.docNbr,
                                    ),
                                  ),
                          icon: loading
                              ? SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: context.textSecondary,
                                  ),
                                )
                              : const Icon(
                                  Icons.print_outlined,
                                  size: 16,
                                ),
                          label: Text('Print Invoice', style: context.bodySmall),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: context.textPrimary,
                            side: BorderSide(color: context.border),
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Amount card ──────────────────────────────────────────────────────────────

class _AmountCard extends StatelessWidget {
  final String label;
  final String amount;
  final Color bg;
  final Color color;

  const _AmountCard({
    required this.label,
    required this.amount,
    required this.bg,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: .circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: color.withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: context.titleSmall.copyWith(
              fontWeight: .w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Info row ─────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(label, style: context.bodySmall.copyWith(color: context.textSecondary)),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            textAlign: .end,
            softWrap: true,
            style: context.bodySmall.copyWith(
              fontWeight: .w500,
              color: context.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Field label ──────────────────────────────────────────────────────────────

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

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _formatBalance(BuildContext context, double balance) {
  final abs = balance.abs();
  final suffix = balance >= 0 ? 'Dr' : 'Cr';
  return 'Rs. ${abs.formatPrice()} $suffix';
}
