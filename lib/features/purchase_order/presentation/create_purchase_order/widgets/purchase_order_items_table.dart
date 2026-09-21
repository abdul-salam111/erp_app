import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

// ── Local model ───────────────────────────────────────────────────────────────

class PurchaseOrderRowItem {
  final String item;
  final String mode;
  final double contractQty;
  final double price;
  final String rateUnit;
  final double discPercent;
  final double discValue;
  final double vatPercent;
  final double vatAmount;
  final double total;
  final String? remarks;

  const PurchaseOrderRowItem({
    required this.item,
    required this.mode,
    required this.contractQty,
    required this.price,
    required this.rateUnit,
    required this.discPercent,
    required this.discValue,
    required this.vatPercent,
    required this.vatAmount,
    required this.total,
    this.remarks,
  });
}

// ── Table ─────────────────────────────────────────────────────────────────────

class PurchaseOrderItemsTable extends StatelessWidget {
  final List<PurchaseOrderRowItem> rows;
  final VoidCallback? onAddRow;
  final void Function(int index)? onDelete;
  final void Function(int index, PurchaseOrderRowItem updated)? onEdit;

  const PurchaseOrderItemsTable({
    super.key,
    required this.rows,
    this.onAddRow,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.isDark ? context.navyBorder : context.divider;
    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: .circular(8),
        border: Border.all(
          color: context.isDark ? context.navyBorder : context.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: dividerColor),
          ...rows.asMap().entries.map(
            (e) => Column(
              children: [
                _ItemRow(
                  index: e.key,
                  item: e.value,
                  onDelete: onDelete != null ? () => onDelete!(e.key) : null,
                  onEdit: onEdit != null ? (updated) => onEdit!(e.key, updated) : null,
                ),
                Divider(height: 1, thickness: 1, color: dividerColor),
              ],
            ),
          ),
          if (onAddRow != null) _AddRowFooter(onTap: onAddRow!),
        ],
      ),
    );
  }
}

// ── Add Row footer (ghost row that lives inside the table) ────────────────────

class _AddRowFooter extends StatelessWidget {
  final VoidCallback onTap;
  const _AddRowFooter({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.isDark ? AppColors.navyCardDark : context.grey50,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.add_rounded, size: 18, color: context.accentBlue),
              const SizedBox(width: 6),
              Text(
                'Add Row',
                style: context.bodySmall.copyWith(
                  color: context.accentBlue,
                  fontWeight: .w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    final headerColor = context.isDark
        ? AppColors.surfaceHeaderDark
        : context.primary;
    final labelColor = context.isDark ? context.accentBlue : context.white;
    final cellStyle = TextStyle(
      color: labelColor,
      fontWeight: .w700,
      fontSize: 12,
      letterSpacing: 0.6,
    );
    return Container(
      decoration: BoxDecoration(color: headerColor),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 22, child: Text('#', style: cellStyle)),
          Expanded(flex: 5, child: Text('ITEM', style: cellStyle)),
          Expanded(
            flex: 3,
            child: Text('MODE', style: cellStyle, textAlign: .center),
          ),
          Expanded(
            flex: 2,
            child: Text('QTY', style: cellStyle, textAlign: .end),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

// ── Row ───────────────────────────────────────────────────────────────────────

class _ItemRow extends StatelessWidget {
  final int index;
  final PurchaseOrderRowItem item;
  final VoidCallback? onDelete;
  final void Function(PurchaseOrderRowItem updated)? onEdit;
  const _ItemRow({required this.index, required this.item, this.onDelete, this.onEdit});

  Future<void> _openDetails(BuildContext context) async {
    final updated = await showAddRowBottomSheet(
      context,
      initialItem: item,
      onDelete: onDelete,
    );
    if (updated != null) onEdit?.call(updated);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.isDark ? AppColors.navyIconBgDark : AppColors.white,
      child: InkWell(
        onTap: () => _openDetails(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 22,
                child: Text(
                  '${index + 1}',
                style: context.labelSmall.copyWith(
                  color: context.textSecondary,
                  fontSize: 11,
                  fontWeight: .w600,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                item.item,
                style: context.bodySmall.copyWith(
                  fontWeight: .w600,
                  fontSize: 12,
                  color: context.textPrimary,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                item.mode,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontWeight: .w600,
                  fontSize: 12,
                ),
                textAlign: .center,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                item.contractQty.toStringAsFixed(2),
                style: context.bodySmall.copyWith(
                  fontWeight: .w600,
                  fontSize: 12,
                  color: context.textPrimary,
                ),
                textAlign: .end,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            SizedBox(
              width: 20,
              child: Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: context.textSecondary,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

// ── Row Details Bottom Sheet ──────────────────────────────────────────────────
// Kept for reference. The details sheet used to be shown on row tap, then the
// user chose "Edit" to open the Add Row sheet. That extra step was removed —
// tapping a row now opens the edit sheet directly, with delete moved into the
// edit sheet's header. This code is preserved (commented out) in case we ever
// want to reintroduce the read-only preview.
/*
enum _RowDetailAction { edit, delete }

class _RowDetailsSheet extends StatelessWidget {
  final int index;
  final PurchaseOrderRowItem item;
  final bool canEdit;
  final bool canDelete;

  const _RowDetailsSheet({
    required this.index,
    required this.item,
    required this.canEdit,
    required this.canDelete,
  });

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.isDark ? context.navyBorder : context.border;
    return Container(
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.isDark ? context.navyBorder : AppColors.grey300,
                borderRadius: .circular(2),
              ),
            ),

            // ── Header: icon + item name + mode chip + close ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 12, 14),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? AppColors.navyIconBgDark
                          : context.primary.withValues(alpha: 0.10),
                      borderRadius: .circular(12),
                    ),
                    alignment: .center,
                    child: Text(
                      '${index + 1}',
                      style: context.bodySmall.copyWith(
                        color: context.primary,
                        fontWeight: .w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text(
                          item.item,
                          style: context.titleSmall.copyWith(
                            fontWeight: .w700,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: context.isDark
                                    ? AppColors.navyIconBgDark
                                    : context.primary
                                          .withValues(alpha: 0.08),
                                borderRadius: .circular(20),
                              ),
                              child: Text(
                                item.mode.isEmpty ? '—' : item.mode,
                                style: context.labelSmall.copyWith(
                                  color: context.primary,
                                  fontWeight: .w600,
                                  fontSize: 10,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: context.textSecondary,
                    ),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: dividerColor),

            // ── Stat grid (2 columns of pill cards) ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                children: [
                  _StatRow(
                    left: _StatTile(
                      icon: Iconsax.box_1,
                      label: 'Contract Qty',
                      value: item.contractQty.toStringAsFixed(2),
                    ),
                    right: _StatTile(
                      icon: Iconsax.tag,
                      label: 'Price',
                      value: item.price.asPrice,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _StatRow(
                    left: _StatTile(
                      icon: Iconsax.ruler,
                      label: 'Rate Unit',
                      value: item.rateUnit.isEmpty ? '—' : item.rateUnit,
                    ),
                    right: _StatTile(
                      icon: Iconsax.discount_shape,
                      label: 'Disc %',
                      value: '${item.discPercent.toStringAsFixed(2)}%',
                    ),
                  ),
                  const SizedBox(height: 10),
                  _StatRow(
                    left: _StatTile(
                      icon: Iconsax.minus_square,
                      label: 'Disc Value',
                      value: item.discValue.asPrice,
                    ),
                    right: _StatTile(
                      icon: Iconsax.percentage_square,
                      label: 'VAT %',
                      value: '${item.vatPercent.toStringAsFixed(2)}%',
                    ),
                  ),
                  const SizedBox(height: 10),
                  _StatTile(
                    icon: Iconsax.receipt_2,
                    label: 'VAT Amount',
                    value: item.vatAmount.asPrice,
                    fullWidth: true,
                  ),
                ],
              ),
            ),

            // ── Total pill ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.primary.withValues(alpha: 0.14),
                      context.primary.withValues(alpha: 0.04),
                    ],
                    begin: .topLeft,
                    end: .bottomRight,
                  ),
                  borderRadius: .circular(14),
                  border: Border.all(
                    color: context.primary.withValues(alpha: 0.30),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: context.primary.withValues(alpha: 0.20),
                        shape: .circle,
                      ),
                      child: Icon(
                        Iconsax.wallet_3,
                        size: 17,
                        color: context.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisSize: .min,
                        children: [
                          Text(
                            'Line Total',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 11,
                              fontWeight: .w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.total.asPrice,
                            style: context.titleSmall.copyWith(
                              color: context.primary,
                              fontWeight: .w700,
                              fontSize: 18,
                              height: 1.1,
                            ),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Remarks ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                decoration: BoxDecoration(
                  color: context.isDark
                      ? AppColors.navyIconBgDark
                      : context.grey50,
                  borderRadius: .circular(12),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.note_text,
                          size: 13,
                          color: context.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Remarks',
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                            fontWeight: .w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.remarks?.isNotEmpty == true
                          ? item.remarks!
                          : 'No remarks added',
                      style: context.bodySmall.copyWith(
                        fontSize: 13,
                        color: item.remarks?.isNotEmpty == true
                            ? context.textPrimary
                            : context.textSecondary,
                        fontStyle: item.remarks?.isNotEmpty == true
                            ? .normal
                            : .italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Actions ──
            if (canEdit || canDelete)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                child: Row(
                  children: [
                    if (canDelete)
                      TextButton.icon(
                        onPressed: () => Navigator.of(context)
                            .pop(_RowDetailAction.delete),
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          size: 18,
                          color: context.error,
                        ),
                        label: Text(
                          'Remove',
                          style: context.bodySmall.copyWith(
                            fontWeight: .w600,
                            fontSize: 13,
                            color: context.error,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(0, 46),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(10),
                          ),
                          backgroundColor: context.error.withValues(
                            alpha: 0.08,
                          ),
                        ),
                      ),
                    if (canEdit && canDelete) const SizedBox(width: 8),
                    if (canEdit)
                      Expanded(
                        child: Material(
                          color: context.primary,
                          borderRadius: .circular(10),
                          child: InkWell(
                            borderRadius: .circular(10),
                            onTap: () => Navigator.of(context)
                                .pop(_RowDetailAction.edit),
                            child: SizedBox(
                              height: 46,
                              child: Row(
                                mainAxisAlignment: .center,
                                children: [
                                  Icon(
                                    Iconsax.edit,
                                    size: 17,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Edit Row',
                                    style: context.bodySmall.copyWith(
                                      color: AppColors.white,
                                      fontWeight: .w700,
                                      fontSize: 14,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            else
              const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _StatRow({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: .stretch,
        children: [
          Expanded(child: left),
          const SizedBox(width: 10),
          Expanded(child: right),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool fullWidth;
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.isDark
            ? AppColors.navyIconBgDark
            : context.grey50,
        borderRadius: .circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.10),
              borderRadius: .circular(8),
            ),
            child: Icon(icon, size: 15, color: context.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  label,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 10.5,
                    fontWeight: .w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    fontSize: 13,
                    color: context.textPrimary,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

// ── Add Row Bottom Sheet ───────────────────────────────────────────────────────

Future<PurchaseOrderRowItem?> showAddRowBottomSheet(
  BuildContext context, {
  PurchaseOrderRowItem? initialItem,
  VoidCallback? onDelete,
}) {
  return showModalBottomSheet<PurchaseOrderRowItem>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.transparent,
    builder: (_) => _AddRowSheet(initialItem: initialItem, onDelete: onDelete),
  );
}

class _AddRowSheet extends StatefulWidget {
  final PurchaseOrderRowItem? initialItem;
  final VoidCallback? onDelete;
  const _AddRowSheet({this.initialItem, this.onDelete});

  @override
  State<_AddRowSheet> createState() => _AddRowSheetState();
}

class _AddRowSheetState extends State<_AddRowSheet> {
  final _itemController = TextEditingController();
  final _modeController = TextEditingController();
  final _qtyController = TextEditingController();
  final _priceController = TextEditingController();
  final _rateUnitController = TextEditingController();
  final _discPercentController = TextEditingController();
  final _vatPercentController = TextEditingController();
  final _remarksController = TextEditingController();

  double _discValue = 0;
  double _vatAmount = 0;
  double _total = 0;

  bool get _isEdit => widget.initialItem != null;

  @override
  void initState() {
    super.initState();
    final i = widget.initialItem;
    if (i != null) {
      _itemController.text = i.item;
      _modeController.text = i.mode;
      _qtyController.text = i.contractQty == 0 ? '' : i.contractQty.toStringAsFixed(2);
      _priceController.text = i.price == 0 ? '' : i.price.toStringAsFixed(2);
      _rateUnitController.text = i.rateUnit;
      _discPercentController.text = i.discPercent == 0 ? '' : i.discPercent.toStringAsFixed(2);
      _vatPercentController.text = i.vatPercent == 0 ? '' : i.vatPercent.toStringAsFixed(2);
      _remarksController.text = i.remarks ?? '';
      _discValue = i.discValue;
      _vatAmount = i.vatAmount;
      _total = i.total;
    }
  }

  @override
  void dispose() {
    _itemController.dispose();
    _modeController.dispose();
    _qtyController.dispose();
    _priceController.dispose();
    _rateUnitController.dispose();
    _discPercentController.dispose();
    _vatPercentController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  void _calculate() {
    final qty = double.tryParse(_qtyController.text) ?? 0;
    final price = double.tryParse(_priceController.text) ?? 0;
    final disc = double.tryParse(_discPercentController.text) ?? 0;
    final vat = double.tryParse(_vatPercentController.text) ?? 0;

    final gross = qty * price;
    final discVal = gross * disc / 100;
    final subTotal = gross - discVal;
    final vatAmt = subTotal * vat / 100;

    setState(() {
      _discValue = discVal;
      _vatAmount = vatAmt;
      _total = subTotal + vatAmt;
    });
  }

  void _save() {
    if (_itemController.text.trim().isEmpty) return;

    Navigator.of(context).pop(
      PurchaseOrderRowItem(
        item: _itemController.text.trim(),
        mode: _modeController.text.trim(),
        contractQty: double.tryParse(_qtyController.text) ?? 0,
        price: double.tryParse(_priceController.text) ?? 0,
        rateUnit: _rateUnitController.text.trim(),
        discPercent: double.tryParse(_discPercentController.text) ?? 0,
        discValue: _discValue,
        vatPercent: double.tryParse(_vatPercentController.text) ?? 0,
        vatAmount: _vatAmount,
        total: _total,
        remarks: _remarksController.text.trim().isEmpty
            ? null
            : _remarksController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.isDark ? context.navyBorder : context.border;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 60),
        decoration: BoxDecoration(
          color: context.navyCard,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // ── Handle bar ──────────────────────────────────────
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.isDark ? context.navyBorder : AppColors.grey300,
                borderRadius: .circular(2),
              ),
            ),
            // ── Header (icon + title + close) ───────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 12, 14),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? AppColors.navyIconBgDark
                          : context.accentBlue.withValues(alpha: 0.10),
                      borderRadius: .circular(10),
                    ),
                    child: Icon(
                      _isEdit ? Iconsax.edit : Iconsax.add_square,
                      size: 18,
                      color: context.accentBlue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text(
                          _isEdit ? 'Edit Row' : 'Add Row',
                          style: context.titleSmall.copyWith(
                            fontWeight: .w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Fill in the item details below',
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.onDelete != null)
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        widget.onDelete!();
                      },
                      icon: Icon(
                        Iconsax.trash,
                        size: 20,
                        color: context.error,
                      ),
                      splashRadius: 20,
                      tooltip: 'Remove Row',
                    ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: context.textSecondary,
                    ),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: dividerColor),

            // ── Scrollable form ──────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                children: [
                  const _SectionHeader(
                    icon: Iconsax.box,
                    label: 'Item Details',
                  ),
                  const SizedBox(height: 10),
                  _SheetField(
                    label: 'Item',
                    controller: _itemController,
                    hintText: 'Enter item name',
                  ),
                  const SizedBox(height: 12),
                  _SheetField(
                    label: 'Mode',
                    controller: _modeController,
                    hintText: 'Contract Mode',
                  ),

                  const SizedBox(height: 22),
                  const _SectionHeader(
                    icon: Iconsax.dollar_circle,
                    label: 'Pricing',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _SheetField(
                          label: 'Contract Qty',
                          controller: _qtyController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => _calculate(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _SheetField(
                          label: 'Price',
                          controller: _priceController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => _calculate(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _SheetField(
                          label: 'Rate Unit',
                          controller: _rateUnitController,
                          hintText: 'e.g. /Kg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _SheetField(
                          label: 'Disc %',
                          controller: _discPercentController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => _calculate(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),
                  const _SectionHeader(
                    icon: Iconsax.receipt_item,
                    label: 'Tax',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _ReadOnlyField(
                          label: 'Disc Value',
                          value: _discValue.asPrice,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _SheetField(
                          label: 'VAT %',
                          controller: _vatPercentController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => _calculate(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _ReadOnlyField(
                    label: 'VAT Amount',
                    value: _vatAmount.asPrice,
                  ),

                  const SizedBox(height: 18),
                  _TotalCard(total: _total),

                  const SizedBox(height: 22),
                  const _SectionHeader(
                    icon: Iconsax.note_text,
                    label: 'Notes',
                  ),
                  const SizedBox(height: 10),
                  _SheetField(
                    label: 'Remarks',
                    controller: _remarksController,
                    hintText: 'Optional remarks',
                    maxLines: 5,
                    contentPadding: const EdgeInsets.all(14),
                  ),
                ],
              ),
            ),

            // ── Sticky footer buttons ────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: context.navyCard,
                border: Border(top: BorderSide(color: dividerColor)),
              ),
              padding: EdgeInsets.fromLTRB(
                16,
                12,
                16,
                MediaQuery.of(context).padding.bottom + 12,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: context.textSecondary,
                      minimumSize: const Size(88, 46),
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        fontSize: 14,
                        color: context.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Material(
                      color: context.primary,
                      borderRadius: .circular(10),
                      elevation: 0,
                      child: InkWell(
                        onTap: _save,
                        borderRadius: .circular(10),
                        child: SizedBox(
                          height: 46,
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(
                                _isEdit
                                    ? Icons.check_rounded
                                    : Icons.add_rounded,
                                size: 18,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _isEdit ? 'Save Changes' : 'Add Row',
                                style: context.bodySmall.copyWith(
                                  color: AppColors.white,
                                  fontWeight: .w700,
                                  fontSize: 14,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Sheet helpers ─────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SectionHeader({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: context.accentBlue),
        const SizedBox(width: 8),
        Text(
          label.toUpperCase(),
          style: context.labelSmall.copyWith(
            color: context.accentBlue,
            fontWeight: .w700,
            fontSize: 11,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: context.isDark ? context.navyBorder : context.divider,
          ),
        ),
      ],
    );
  }
}

class _TotalCard extends StatelessWidget {
  final double total;
  const _TotalCard({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: context.isDark
            ? AppColors.navyIconBgDark
            : context.primary.withValues(alpha: 0.06),
        borderRadius: .circular(12),
        border: Border.all(color: context.primary.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.18),
              shape: .circle,
            ),
            child: Icon(
              Iconsax.wallet_3,
              size: 16,
              color: context.accentBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  'Line Total',
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 11,
                    fontWeight: .w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  total.asPrice,
                  style: context.titleSmall.copyWith(
                    color: context.accentBlue,
                    fontWeight: .w700,
                    fontSize: 17,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;

  const _SheetField({
    required this.label,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.maxLines,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontSize: 11,
            fontWeight: .w600,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextFormField(
          controller: controller,
          fieldHeight: maxLines != null ? null : 44,
          hintText: hintText,
          keyboardType: keyboardType ?? TextInputType.text,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          contentPadding: contentPadding,
          fillColor: context.isDark ? AppColors.navyIconBgDark : null,
          borderColor: Colors.transparent,
        ),
      ],
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;
  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontSize: 11,
                fontWeight: .w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.lock_outline_rounded,
              size: 11,
              color: context.textSecondary.withValues(alpha: 0.6),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: context.isDark
                ? AppColors.navyIconBgDark.withValues(alpha: 0.55)
                : context.surface,
            borderRadius: .circular(8),
          ),
          alignment: .centerLeft,
          child: Text(
            value,
            style: context.bodySmall.copyWith(
              fontSize: 13,
              color: context.textSecondary,
              fontWeight: .w600,
            ),
          ),
        ),
      ],
    );
  }
}
