import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

// ─── View ─────────────────────────────────────────────────────────────────────

class PartyLedgerView extends StatelessWidget {
  const PartyLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PartyLedgerBloc>(),
      child: const _PartyLedgerBody(),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _PartyLedgerBody extends StatefulWidget {
  const _PartyLedgerBody();

  @override
  State<_PartyLedgerBody> createState() => _PartyLedgerBodyState();
}

class _PartyLedgerBodyState extends State<_PartyLedgerBody> {
  late DateTime _fromDate;
  late DateTime _toDate;
  int? _selectedPartyId;
  late final TextEditingController _partyController;

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtractMonths(1);
    _partyController = TextEditingController();
  }

  @override
  void dispose() {
    _partyController.dispose();
    super.dispose();
  }

  void _fetch() {
    if (_selectedPartyId == null) {
      AppToastsUtils.showErrorTop(context, 'Please select a party first');
      return;
    }
    context.read<PartyLedgerBloc>().add(
      PartyLedgerSubmitted(
        fromDate: _fromDate.format('yyyy-MM-dd'),
        toDate: _toDate.format('yyyy-MM-dd'),
        partyId: _selectedPartyId,
      ),
    );
  }

  void _onPartyChanged(String name) {
    final parties = context.read<PartyLedgerBloc>().state.parties;
    final match = parties.where((p) => p.name == name).firstOrNull;
    if (match != null) setState(() => _selectedPartyId = match.id);
  }

  Future<void> _pickDate(bool isFrom) async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: isFrom ? _fromDate : _toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PartyLedgerBloc, PartyLedgerState>(
      listenWhen: (p, c) => p.pdfStatus != c.pdfStatus,
      listener: (context, state) {
        if (state.pdfStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
        if (state.pdfStatus == ApiStatus.SUCCESS && state.pdfUrl != null) {
          AppToastsUtils.showSuccessTop(context, 'Invoice ready');
        }
      },
      child: Scaffold(
        backgroundColor: context.grey50,
        appBar: CustomAppBar(title: AppConstants.partyLedgerLabel),
        body: Column(
          children: [
            BlocBuilder<PartyLedgerBloc, PartyLedgerState>(
              buildWhen: (p, c) =>
                  p.parties != c.parties ||
                  p.partiesStatus != c.partiesStatus,
              builder: (context, state) => _FilterForm(
                fromDate: _fromDate,
                toDate: _toDate,
                partyItems: state.parties.map((p) => p.name).toList(),
                partySubtitles: state.parties.map((p) => p.partyType).toList(),
                isLoadingParties: state.partiesStatus == ApiStatus.INITIAL ||
                    state.partiesStatus == ApiStatus.LOADING,
                partyController: _partyController,
                onPartyChanged: _onPartyChanged,
                onPickFrom: () => _pickDate(true),
                onPickTo: () => _pickDate(false),
                onView: _fetch,
              ),
            ),
            Expanded(
              child: BlocBuilder<PartyLedgerBloc, PartyLedgerState>(
                builder: (context, state) {
                  if (state.apiStatus == ApiStatus.INITIAL) {
                    return const _IdleState();
                  }
                  if (state.apiStatus == ApiStatus.LOADING) {
                    return const _ShimmerBody();
                  }
                  if (state.apiStatus == ApiStatus.FAILURE) {
                    return _ErrorBody(
                      message: state.message ?? 'Something went wrong',
                      onRetry: _fetch,
                    );
                  }
                  if (state.apiStatus == ApiStatus.SUCCESS &&
                      state.statements.isEmpty) {
                    return const _EmptyState();
                  }
                  return _StatementsBody(statements: state.statements);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Filter form ──────────────────────────────────────────────────────────────

class _FilterForm extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final List<String> partyItems;
  final List<String>? partySubtitles;
  final bool isLoadingParties;
  final TextEditingController partyController;
  final ValueChanged<String> onPartyChanged;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onView;

  const _FilterForm({
    required this.fromDate,
    required this.toDate,
    required this.partyItems,
    this.partySubtitles,
    this.isLoadingParties = false,
    required this.partyController,
    required this.onPartyChanged,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.white,
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        12,
        context.pagePadding.right,
        12,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _FormLabel(text: 'Party'),
          const SizedBox(height: 6),
          if (isLoadingParties)
            const ShimmerBox(height: 56, radius: 10)
          else
            SearchableDropdown(
              items: partyItems,
              subtitles: partySubtitles,
              controller: partyController,
              hintText: 'Select Party',
              onChanged: onPartyChanged,
            ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: 'From Date'),
                    const SizedBox(height: 6),
                    _FieldTile(
                      icon: Iconsax.calendar_1,
                      label: fromDate.format('dd MMM yyyy'),
                      onTap: onPickFrom,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _FormLabel(text: 'To Date'),
                    const SizedBox(height: 6),
                    _FieldTile(
                      icon: Iconsax.calendar_1,
                      label: toDate.format('dd MMM yyyy'),
                      onTap: onPickTo,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onView,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 13),
                elevation: 0,
              ),
              child: Text(
                'View',
                style: context.bodySmall.copyWith(
                  color: AppColors.white,
                  fontWeight: .w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    );
  }
}

class _FieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _FieldTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        decoration: BoxDecoration(
          color: context.grey50,
          borderRadius: .circular(8),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: context.textSecondary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: context.bodySmall.copyWith(
                  color: onTap != null ? context.textPrimary : context.textSecondary,
                  fontSize: 13,
                ),
                overflow: .ellipsis,
              ),
            ),
            if (onTap != null)
              Icon(Icons.keyboard_arrow_down_rounded,
                  size: 18, color: context.textSecondary),
          ],
        ),
      ),
    );
  }
}

// ─── Statements body ──────────────────────────────────────────────────────────

class _StatementsBody extends StatelessWidget {
  final List<LedgerStatementEntity> statements;
  const _StatementsBody({required this.statements});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: context.pagePadding.left,
        right: context.pagePadding.right,
        top: 12,
        bottom: 16,
      ),
      children: [
        const _SectionLabel(text: 'Statements'),
        const SizedBox(height: 8),
        for (final yearData in statements) ...[
          _YearCard(yearData: yearData),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: context.labelSmall.copyWith(
        fontSize: 11,
        fontWeight: .w500,
        color: context.textSecondary,
        letterSpacing: 0.8,
      ),
    );
  }
}

// ─── Year card ────────────────────────────────────────────────────────────────

class _YearCard extends StatefulWidget {
  final LedgerStatementEntity yearData;
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
        ) ??
        false;

    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.grey50,
                borderRadius: _expanded
                    ? const BorderRadius.vertical(top: Radius.circular(10))
                    : .circular(10),
                border: _expanded
                    ? Border(bottom: BorderSide(color: context.border))
                    : null,
              ),
              child: Row(
                children: [
                  Icon(Iconsax.calendar_1, color: context.primary, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      yearData.finYear?.name ?? '',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        color: context.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      Text(
                        _formatBalance(context, (yearData.balance ?? 0).toDouble()),
                        style: context.bodySmall.copyWith(
                          fontWeight: .w700,
                          color: context.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            'Rs. ${(yearData.ttlDebit ?? 0).toDouble().formatPrice()} Dr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rs. ${(yearData.ttlCredit ?? 0).toDouble().formatPrice()} Cr',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
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
                      color: AppColors.grey400,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
  final LedgerTypeEntity ledgerType;
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.grey100,
              border: Border(top: BorderSide(color: context.border)),
            ),
            child: Text(
              type.toUpperCase(),
              style: context.labelSmall.copyWith(
                fontWeight: .w600,
                color: context.textSecondary,
                fontSize: 10,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ...(ledgerType.ledgers ?? []).map((l) => _LedgerRow(ledger: l)),
      ],
    );
  }
}

// ─── Ledger row ───────────────────────────────────────────────────────────────

class _LedgerRow extends StatelessWidget {
  final LedgerEntryEntity ledger;
  const _LedgerRow({required this.ledger});

  @override
  Widget build(BuildContext context) {
    final isOpening = ledger.isOpening ?? false;
    final drAmt = (ledger.drAmount ?? 0).toDouble();
    final crAmt = (ledger.crAmount ?? 0).toDouble();
    final isDrOnly = drAmt > 0 && crAmt == 0;
    final isCrOnly = crAmt > 0 && drAmt == 0;

    final docDate = ledger.docDate;
    final date = (!isOpening && docDate != null && docDate.year > 1)
        ? DateFormat('dd MMM yyyy').format(docDate)
        : '';

    final dr = drAmt == 0 ? '0.0' : drAmt.formatPrice();
    final cr = crAmt == 0 ? '0.0' : crAmt.formatPrice();

    final Color iconBg;
    final Color iconColor;
    final IconData iconData;
    if (isOpening) {
      iconBg = AppColors.grey100;
      iconColor = AppColors.grey500;
      iconData = Icons.horizontal_rule_rounded;
    } else if (isDrOnly) {
      iconBg = AppColors.debitContainer;
      iconColor = AppColors.debitRed;
      iconData = Icons.arrow_upward_rounded;
    } else if (isCrOnly) {
      iconBg = AppColors.creditContainer;
      iconColor = AppColors.creditGreen;
      iconData = Icons.arrow_downward_rounded;
    } else {
      iconBg = context.primary.withValues(alpha: 0.12);
      iconColor = context.primary;
      iconData = Icons.swap_horiz_rounded;
    }

    final String amountText;
    final Color amountColor;
    if (isOpening) {
      final val = drAmt > 0 ? drAmt : crAmt;
      amountText = val.formatPrice();
      amountColor = AppColors.grey600;
    } else if (isDrOnly) {
      amountText = drAmt.formatPrice();
      amountColor = AppColors.debitRed;
    } else if (isCrOnly) {
      amountText = crAmt.formatPrice();
      amountColor = AppColors.creditGreen;
    } else {
      amountText = '${drAmt.formatPrice()} / ${crAmt.formatPrice()}';
      amountColor = context.textPrimary;
    }

    final title = isOpening
        ? 'Opening balance'
        : [
            if (ledger.featureName?.isNotEmpty == true) ledger.featureName!,
            if (ledger.docNbr?.isNotEmpty == true) ledger.docNbr!,
          ].join(' • ');

    return InkWell(
      onTap: () => _openDetail(context, date, dr, cr),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: context.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: .circular(12),
              ),
              child: Icon(iconData, size: 18, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w600,
                      color: context.textPrimary,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  if (date.isNotEmpty || isOpening) ...[
                    const SizedBox(height: 3),
                    Text(
                      isOpening ? '---' : date,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: .end,
              children: [
                if (!isOpening)
                  Text(
                    isDrOnly ? 'Debit' : isCrOnly ? 'Credit' : 'Dr / Cr',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                if (!isOpening) const SizedBox(height: 2),
                Text(
                  amountText,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    color: amountColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  _formatBalance(context, (ledger.balance ?? 0).toDouble()),
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
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
        value: context.read<PartyLedgerBloc>(),
        child: _LedgerDetailDialog(
          ledger: ledger,
          date: date,
          dr: dr,
          cr: cr,
        ),
      ),
    );
  }
}

// ─── Ledger detail dialog ─────────────────────────────────────────────────────

class _LedgerDetailDialog extends StatelessWidget {
  final LedgerEntryEntity ledger;
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
      accentColor = AppColors.grey500;
      directionIcon = Icons.horizontal_rule_rounded;
    } else if (hasDebit && !hasCredit) {
      accentColor = AppColors.debitRed;
      directionIcon = Icons.arrow_upward_rounded;
    } else if (!hasDebit && hasCredit) {
      accentColor = AppColors.creditGreen;
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
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
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
                      fontSize: 12,
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

            if (isOpening) ...[
              _AmountCard(
                label: 'Opening Balance',
                amount: 'Rs. ${hasDebit ? dr : cr}',
                bg: AppColors.grey100,
                color: AppColors.grey700,
              ),
            ] else ...[
              if (hasDebit) ...[
                _AmountCard(
                  label: 'Debit',
                  amount: 'Rs. $dr',
                  bg: AppColors.debitContainer,
                  color: AppColors.debitRed,
                ),
                if (hasCredit) const SizedBox(height: 10),
              ],
              if (hasCredit)
                _AmountCard(
                  label: 'Credit',
                  amount: 'Rs. $cr',
                  bg: AppColors.creditContainer,
                  color: AppColors.creditGreen,
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
              value: _formatBalance(context, (ledger.balance ?? 0).toDouble()),
            ),
            const SizedBox(height: 20),

            BlocBuilder<PartyLedgerBloc, PartyLedgerState>(
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
                        child: Text('Close', style: context.bodySmall),
                      ),
                    ),
                    if (canPrint) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: loading
                              ? null
                              : () => context.read<PartyLedgerBloc>().add(
                                    PartyLedgerPrintRequested(
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
                              : const Icon(Icons.print_outlined, size: 16),
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
      decoration: BoxDecoration(color: bg, borderRadius: .circular(12)),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: color.withValues(alpha: 0.75),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: context.titleSmall.copyWith(
              fontWeight: .w700,
              color: color,
              fontSize: 20,
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
        Text(
          label,
          style: context.bodySmall.copyWith(
            color: context.textSecondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            textAlign: .end,
            softWrap: true,
            style: context.bodySmall.copyWith(
              fontWeight: .w500,
              color: context.textPrimary,
              fontSize: 13,
            ),
          ),
        ),
      ],
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
          Icon(Iconsax.document_text, size: 48, color: AppColors.grey300),
          const SizedBox(height: 12),
          Text(
            'No statements yet',
            style: context.bodyMedium.copyWith(
              fontWeight: .w500,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Select a party and tap View',
            style: context.bodySmall.copyWith(color: AppColors.grey400),
          ),
        ],
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: AppColors.grey300),
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
            style: context.bodySmall.copyWith(color: AppColors.grey400),
          ),
        ],
      ),
    );
  }
}

// ─── Error state ──────────────────────────────────────────────────────────────

class _ErrorBody extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorBody({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.error_outline_rounded,
              size: 48, color: AppColors.grey300),
          const SizedBox(height: 12),
          Text(
            message,
            style: context.bodySmall.copyWith(color: context.textSecondary),
            textAlign: .center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: .circular(10)),
              elevation: 0,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

// ─── Shimmer ──────────────────────────────────────────────────────────────────

class _ShimmerBody extends StatelessWidget {
  const _ShimmerBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: context.pagePadding.left,
        right: context.pagePadding.right,
        top: 12,
        bottom: 16,
      ),
      children: [
        ShimmerBox(height: 12, width: 90, radius: 4),
        const SizedBox(height: 10),
        _ShimmerYearCard(),
        const SizedBox(height: 8),
        _ShimmerYearCard(rowCount: 3),
      ],
    );
  }
}

class _ShimmerYearCard extends StatelessWidget {
  final int rowCount;
  const _ShimmerYearCard({this.rowCount = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              children: [
                ShimmerBox(height: 24, width: 24, radius: 6),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      ShimmerBox(height: 12, width: 100, radius: 4),
                      const SizedBox(height: 5),
                      ShimmerBox(height: 10, width: 160, radius: 4),
                    ],
                  ),
                ),
                ShimmerBox(height: 30, width: 80, radius: 6),
              ],
            ),
          ),
          ...List.generate(
            rowCount,
            (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  ShimmerBox(height: 40, width: 40, radius: 12),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        ShimmerBox(height: 12, width: double.infinity, radius: 4),
                        const SizedBox(height: 5),
                        ShimmerBox(height: 10, width: 80, radius: 4),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      ShimmerBox(height: 14, width: 70, radius: 4),
                      const SizedBox(height: 4),
                      ShimmerBox(height: 11, width: 60, radius: 4),
                    ],
                  ),
                ],
              ),
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
