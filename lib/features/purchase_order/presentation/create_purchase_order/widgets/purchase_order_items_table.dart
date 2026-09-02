import 'package:flutter/material.dart';
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
  final void Function(int index)? onDelete;
  final void Function(int index, PurchaseOrderRowItem updated)? onEdit;

  const PurchaseOrderItemsTable({
    super.key,
    required this.rows,
    this.onDelete,
    this.onEdit,
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
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: AppColors.grey200),
          ...rows.asMap().entries.map(
            (e) => Column(
              children: [
                _ItemRow(
                  index: e.key,
                  item: e.value,
                  onDelete: onDelete != null ? () => onDelete!(e.key) : null,
                  onEdit: onEdit != null ? (updated) => onEdit!(e.key, updated) : null,
                ),
                if (e.key < rows.length - 1)
                  Divider(height: 1, thickness: 1, color: AppColors.grey100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    final cellStyle = TextStyle(
      color: context.white,
      fontWeight: .w600,
      fontSize: 11,
    );
    return Container(
      decoration: BoxDecoration(
        color: context.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 22, child: Text('#', style: cellStyle)),
          Expanded(flex: 5, child: Text('Item', style: cellStyle)),
          Expanded(flex: 3, child: Text('Mode', style: cellStyle, textAlign: .center)),
          Expanded(flex: 2, child: Text('Qty', style: cellStyle, textAlign: .end)),
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
    final action = await showModalBottomSheet<_RowDetailAction>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.transparent,
      builder: (_) => _RowDetailsSheet(index: index, item: item, canEdit: onEdit != null, canDelete: onDelete != null),
    );
    if (!context.mounted) return;
    switch (action) {
      case _RowDetailAction.edit:
        final updated = await showAddRowBottomSheet(context, initialItem: item);
        if (updated != null) onEdit?.call(updated);
      case _RowDetailAction.delete:
        onDelete?.call();
      case null:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  color: AppColors.grey700,
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
    );
  }
}

// ── Row Details Bottom Sheet ──────────────────────────────────────────────────

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
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: .circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: context.primary.withValues(alpha: 0.10),
                      shape: .circle,
                    ),
                    alignment: .center,
                    child: Text(
                      '${index + 1}',
                      style: context.bodySmall.copyWith(
                        color: context.primary,
                        fontWeight: .w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          item.item,
                          style: context.bodySmall.copyWith(
                            fontWeight: .w700,
                            fontSize: 14,
                            color: context.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.mode,
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
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
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: context.grey50,
                  borderRadius: .circular(10),
                  border: Border.all(color: context.border),
                ),
                child: Column(
                  children: [
                    _DetailTileRow(
                      left: _DetailTile(label: 'Contract Qty', value: item.contractQty.toStringAsFixed(2)),
                      right: _DetailTile(label: 'Price', value: item.price.asPrice),
                    ),
                    Divider(height: 1, thickness: 1, color: context.border),
                    _DetailTileRow(
                      left: _DetailTile(label: 'Rate Unit', value: item.rateUnit.isEmpty ? '—' : item.rateUnit),
                      right: _DetailTile(label: 'Disc %', value: '${item.discPercent.toStringAsFixed(2)}%'),
                    ),
                    Divider(height: 1, thickness: 1, color: context.border),
                    _DetailTileRow(
                      left: _DetailTile(label: 'Disc Value', value: item.discValue.asPrice),
                      right: _DetailTile(label: 'VAT %', value: '${item.vatPercent.toStringAsFixed(2)}%'),
                    ),
                    Divider(height: 1, thickness: 1, color: context.border),
                    _DetailTileRow(
                      left: _DetailTile(label: 'VAT Amount', value: item.vatAmount.asPrice),
                      right: const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: context.primary.withValues(alpha: 0.06),
                  borderRadius: .circular(10),
                  border: Border.all(color: context.primary.withValues(alpha: 0.2)),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        fontSize: 13,
                        color: context.primary,
                      ),
                    ),
                    Text(
                      item.total.asPrice,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        fontSize: 15,
                        color: context.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: context.grey50,
                  borderRadius: .circular(10),
                  border: Border.all(color: context.border),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Remarks',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.remarks?.isNotEmpty == true ? item.remarks! : '—',
                      style: context.bodySmall.copyWith(
                        fontSize: 12,
                        color: context.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (canEdit || canDelete)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                child: Row(
                  children: [
                    if (canDelete)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              Navigator.of(context).pop(_RowDetailAction.delete),
                          icon: Icon(Icons.delete_outline_rounded,
                              size: 16, color: context.error),
                          label: Text(
                            'Remove Row',
                            style: context.bodySmall.copyWith(
                              fontWeight: .w600,
                              fontSize: 13,
                              color: context.error,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: context.error.withValues(alpha: 0.4)),
                            minimumSize: const Size.fromHeight(44),
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(8),
                            ),
                          ),
                        ),
                      ),
                    if (canEdit && canDelete) const SizedBox(width: 12),
                    if (canEdit)
                      Expanded(
                        child: CustomButton(
                          text: 'Edit Row',
                          onPressed: () =>
                              Navigator.of(context).pop(_RowDetailAction.edit),
                          radius: 8,
                          elevation: 0,
                          fontsize: 13,
                          size: const Size.fromHeight(44),
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

class _DetailTileRow extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _DetailTileRow({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: left),
          VerticalDivider(width: 1, thickness: 1, color: context.border),
          Expanded(child: right),
        ],
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final String label;
  final String value;
  const _DetailTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: context.bodySmall.copyWith(
              fontWeight: .w600,
              fontSize: 13,
              color: context.textPrimary,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }
}

// ── Add Row Bottom Sheet ───────────────────────────────────────────────────────

Future<PurchaseOrderRowItem?> showAddRowBottomSheet(
  BuildContext context, {
  PurchaseOrderRowItem? initialItem,
}) {
  return showModalBottomSheet<PurchaseOrderRowItem>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.transparent,
    builder: (_) => _AddRowSheet(initialItem: initialItem),
  );
}

class _AddRowSheet extends StatefulWidget {
  final PurchaseOrderRowItem? initialItem;
  const _AddRowSheet({this.initialItem});

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
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 80),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.grey300,
                    borderRadius: .circular(2),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      _isEdit ? 'Edit Row' : 'Add Row',
                      style: context.titleSmall.copyWith(fontWeight: .w600),
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
              ],
            ),
          ),
          Divider(color: context.border),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              children: [
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
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _SheetField(
                        label: 'Contract Qty',
                        controller: _qtyController,
                        hintText: '0.00',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (_) => _calculate(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SheetField(
                        label: 'Price',
                        controller: _priceController,
                        hintText: '0.00',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (_) => _calculate(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _ReadOnlyField(label: 'Disc Value', value: _discValue.asPrice),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SheetField(
                        label: 'VAT %',
                        controller: _vatPercentController,
                        hintText: '0.00',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (_) => _calculate(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _ReadOnlyField(label: 'VAT Amount', value: _vatAmount.asPrice),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ReadOnlyField(label: 'Total', value: _total.asPrice),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _SheetField(
                  label: 'Remarks',
                  controller: _remarksController,
                  hintText: 'Optional remarks',
                  maxLines: 6,
                  contentPadding: const EdgeInsets.all(15),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              8,
              16,
              MediaQuery.of(context).padding.bottom + 12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.primary,
                      side: BorderSide(color: context.primary),
                      minimumSize: const Size.fromHeight(44),
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(8),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: context.bodySmall.copyWith(
                        fontWeight: .w600,
                        fontSize: 14,
                        color: context.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: _isEdit ? 'Save Changes' : 'Add Row',
                    onPressed: _save,
                    radius: 8,
                    elevation: 0,
                    fontsize: 14,
                    size: const Size.fromHeight(44),
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
        FormLabel(text: label),
        const SizedBox(height: 4),
        CustomTextFormField(
          controller: controller,
          fieldHeight: maxLines != null ? null : 45,
          hintText: hintText,
          keyboardType: keyboardType ?? TextInputType.text,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          contentPadding: contentPadding,
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
        FormLabel(text: label),
        const SizedBox(height: 4),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: context.grey50,
            borderRadius: .circular(6),
            border: Border.all(color: context.border),
          ),
          alignment: .centerLeft,
          child: Text(
            value,
            style: context.bodySmall.copyWith(
              fontSize: 13,
              color: context.textPrimary,
              fontWeight: .w500,
            ),
          ),
        ),
      ],
    );
  }
}
