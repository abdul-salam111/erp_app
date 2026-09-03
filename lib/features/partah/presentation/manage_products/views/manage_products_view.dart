import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../../../domain/entities/product_template_entity.dart';
import '../blocs/manage_products_bloc.dart';
import '../blocs/manage_products_event.dart';
import '../blocs/manage_products_state.dart';
import '../controllers/manage_products_form.dart';

class ManageProductsView extends StatelessWidget {
  const ManageProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ManageProductsBloc>()..add(ManageProductsStarted()),
      child: const _ManageProductsBody(),
    );
  }
}

class _ManageProductsBody extends StatelessWidget {
  const _ManageProductsBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: const CustomAppBar(title: 'Manage Products'),
      body: BlocBuilder<ManageProductsBloc, ManageProductsState>(
        builder: (context, state) {
          if (state.loadStatus == ApiStatus.LOADING || state.loadStatus == ApiStatus.INITIAL) {
            return const LoadingIndicator().center();
          }
          if (state.loadStatus == ApiStatus.FAILURE) {
            return ErrorStateWidget(
              message: state.errorMessage,
              onRetry: () => context.read<ManageProductsBloc>().add(ManageProductsStarted()),
            );
          }
          return _ManageProductsScope(templates: state.templates);
        },
      ),
    );
  }
}

// ─── Form Scope — owns the ManageProductsForm across bloc rebuilds ───────────

class _ManageProductsScope extends StatefulWidget {
  final List<ProductTemplateEntity> templates;
  const _ManageProductsScope({required this.templates});

  @override
  State<_ManageProductsScope> createState() => _ManageProductsScopeState();
}

class _ManageProductsScopeState extends State<_ManageProductsScope> {
  late final ManageProductsForm form = ManageProductsForm(templates: widget.templates);

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  void _save(BuildContext context) {
    if (form.selectedMillType == null) {
      AppToastsUtils.showErrorTop(context, 'Select your mill type first');
      return;
    }
    final (error, templates) = form.buildTemplates();
    if (error != null) {
      AppToastsUtils.showErrorTop(context, error);
      return;
    }
    context.read<ManageProductsBloc>().add(ManageProductsSaveRequested(templates));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageProductsBloc, ManageProductsState>(
      listenWhen: (p, n) => p.saveStatus != n.saveStatus,
      listener: (context, state) async {
        if (state.saveStatus == ApiStatus.SUCCESS) {
          await form.persistSelectedMillType();
          if (context.mounted) {
            Navigator.of(context).pop();
            AppToastsUtils.showSuccessTop(context, 'Products updated successfully');
          }
        }
        if (state.saveStatus == ApiStatus.FAILURE && context.mounted) {
          AppToastsUtils.showErrorTop(context, state.errorMessage ?? 'Could not save products');
        }
      },
      child: ListenableBuilder(
        listenable: form,
        builder: (context, _) {
          return Column(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                children: [
                  const _ContextBanner(),
                  heightBox(14),
                  _MillTypeSelector(selectedType: form.selectedMillType, onSelect: form.selectMillType),
                  heightBox(14),
                  _ProductsTable(
                    rows: form.rows,
                    onDelete: (i) {
                      final error = form.removeRow(i);
                      if (error != null) AppToastsUtils.showErrorTop(context, error);
                    },
                    onAdd: form.addRow,
                  ),
                ],
              ).expanded(),
              BlocBuilder<ManageProductsBloc, ManageProductsState>(
                buildWhen: (p, n) => p.saveStatus != n.saveStatus,
                builder: (context, state) => _BottomBar(
                  onSave: () => _save(context),
                  isSaving: state.saveStatus == ApiStatus.LOADING,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Mill Type Selector ───────────────────────────────────────────────────────

class _MillTypeSelector extends StatelessWidget {
  final MillType? selectedType;
  final void Function(MillType) onSelect;

  const _MillTypeSelector({required this.selectedType, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Select your mill type',
          style: context.labelSmall.copyWith(
            color: context.textSecondary,
            fontWeight: .w700,
            letterSpacing: 0.4,
          ),
        ),
        heightBox(8),
        Row(
          children: [
            _MillTypeChip(
              label: 'Flour Mill',
              icon: Icons.grain_rounded,
              isSelected: selectedType == MillType.flour,
              onTap: () => onSelect(MillType.flour),
            ).expanded(),
            widthBox(10),
            _MillTypeChip(
              label: 'Rice Mill',
              icon: Icons.grass_rounded,
              isSelected: selectedType == MillType.rice,
              onTap: () => onSelect(MillType.rice),
            ).expanded(),
          ],
        ),
      ],
    );
  }
}

class _MillTypeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _MillTypeChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? context.primary.withAlpha(20) : context.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? context.primary : context.border, width: isSelected ? 1.5 : 1),
        ),
        child: Column(
          children: [
            Icon(icon, size: 22, color: isSelected ? context.primary : context.textSecondary),
            heightBox(6),
            Text(
              label,
              style: context.labelMedium.copyWith(
                color: isSelected ? context.primary : context.textPrimary,
                fontWeight: isSelected ? .w700 : .w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Context Banner ───────────────────────────────────────────────────────────

class _ContextBanner extends StatelessWidget {
  const _ContextBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.primary.withAlpha(18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.primary.withAlpha(40)),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Icon(Icons.edit_note_rounded, size: 18, color: context.primary),
          widthBox(10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Edit your product list',
                style: context.labelMedium.copyWith(color: context.primary, fontWeight: .w700),
              ),
              heightBox(4),
              Text(
                'Edit your products or bag sizes. Changes apply to all new Partah reports.',
                style: context.bodySmall.copyWith(color: context.textSecondary, height: 1.4),
              ),
            ],
          ).expanded(),
        ],
      ),
    );
  }
}

// ─── Products Table ───────────────────────────────────────────────────────────

class _ProductsTable extends StatelessWidget {
  final List<ProductEditRow> rows;
  final void Function(int) onDelete;
  final VoidCallback onAdd;

  const _ProductsTable({required this.rows, required this.onDelete, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                widthBox(22),
                widthBox(10),
                Expanded(
                  flex: 5,
                  child: Text(
                    'Product Name',
                    style: context.labelSmall.copyWith(color: context.textSecondary, fontWeight: .w600),
                  ),
                ),
                widthBox(8),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Bag Size',
                    style: context.labelSmall.copyWith(color: context.textSecondary, fontWeight: .w600),
                  ),
                ),
                widthBox(32),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.border),
          ...List.generate(rows.length, (i) {
            return Column(
              children: [
                _ProductRow(row: rows[i], index: i, onDelete: () => onDelete(i)),
                if (i < rows.length - 1)
                  Divider(height: 1, thickness: 1, indent: 12, endIndent: 12, color: context.border),
              ],
            );
          }),
          Divider(height: 1, thickness: 1, color: context.border),
          InkWell(
            onTap: onAdd,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.add_rounded, size: 16, color: context.primary),
                widthBox(6),
                Text(
                  'Add Product',
                  style: context.labelMedium.copyWith(color: context.primary, fontWeight: .w600),
                ),
              ],
            ).withPadding(const EdgeInsets.symmetric(vertical: 11)),
          ),
        ],
      ),
    );
  }
}

// ─── Single Row ───────────────────────────────────────────────────────────────

class _ProductRow extends StatelessWidget {
  final ProductEditRow row;
  final int index;
  final VoidCallback onDelete;

  const _ProductRow({required this.row, required this.index, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 22,
          child: Text(
            '${index + 1}',
            style: context.labelSmall.copyWith(color: context.primary, fontWeight: .w700),
            textAlign: .center,
          ),
        ),
        widthBox(10),
        Expanded(
          flex: 5,
          child: _InlineField(
            controller: row.nameController,
            hint: 'e.g. Atta',
            textCapitalization: TextCapitalization.words,
          ),
        ),
        widthBox(8),
        Expanded(
          flex: 3,
          child: _InlineField(
            controller: row.bagSizeController,
            hint: '0',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
            suffixText: 'Kg',
          ),
        ),
        Icon(Icons.close_rounded, size: 16, color: context.textSecondary)
            .withPadding(const EdgeInsets.only(left: 4))
            .onTap(onDelete),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 12, vertical: 6));
  }
}

// ─── Inline field ─────────────────────────────────────────────────────────────

class _InlineField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final TextCapitalization textCapitalization;

  const _InlineField({
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.suffixText,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: context.bodySmall.copyWith(color: context.textPrimary, fontWeight: .w500),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.bodySmall.copyWith(color: context.textSecondary),
        suffixText: suffixText,
        suffixStyle: context.labelSmall.copyWith(color: context.textSecondary, fontWeight: .w600),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        fillColor: context.background,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.primary, width: 1.5),
        ),
      ),
    );
  }
}

// ─── Bottom Bar ───────────────────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  final VoidCallback onSave;
  final bool isSaving;

  const _BottomBar({required this.onSave, required this.isSaving});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(color: context.surface, border: Border(top: BorderSide(color: context.border))),
      child: SafeArea(
        top: false,
        child: CustomButton(
          text: 'Save Changes',
          onPressed: onSave,
          isLoading: isSaving,
          radius: 10,
          size: const Size(200, 44),
        ).center(),
      ),
    );
  }
}
