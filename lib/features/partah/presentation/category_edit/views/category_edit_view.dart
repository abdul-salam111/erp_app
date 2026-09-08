import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/accounts_widgets/accounts_shimmer_body.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../domain/entities/partah_category_entity.dart';
import '../../../domain/entities/partah_category_product_entity.dart';
import '../blocs/category_edit_bloc.dart';
import '../blocs/category_edit_event.dart';
import '../blocs/category_edit_state.dart';

class CategoryEditView extends StatelessWidget {
  final PartahCategoryEntity? initial;
  const CategoryEditView({super.key, this.initial});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CategoryEditBloc>()..add(CategoryEditStarted(initial)),
      child: _CategoryEditBody(initial: initial),
    );
  }
}

class _CategoryEditBody extends StatefulWidget {
  final PartahCategoryEntity? initial;
  const _CategoryEditBody({required this.initial});

  bool get isEditing => initial != null;

  @override
  State<_CategoryEditBody> createState() => _CategoryEditBodyState();
}

class _CategoryEditBodyState extends State<_CategoryEditBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _bagWeightController;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initial?.displayName ?? '');
    _bagWeightController = TextEditingController(
      text: (widget.initial?.standardBagKg ?? 100).toString(),
    );
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bagWeightController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: widget.isEditing ? 'Edit Category' : 'New Category'),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: context.pagePadding,
          child: BlocBuilder<CategoryEditBloc, CategoryEditState>(
            buildWhen: (previous, current) => previous.saveStatus != current.saveStatus,
            builder: (context, state) {
              final saving = state.saveStatus == ApiStatus.LOADING;
              return SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: saving
                      ? null
                      : () => context
                          .read<CategoryEditBloc>()
                          .add(const CategoryEditSaveRequested()),
                  icon: saving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.white,
                          ),
                        )
                      : const Icon(Icons.save_rounded, color: AppColors.white),
                  label: Text(
                    'Save',
                    style: context.titleSmall.copyWith(
                      color: AppColors.white,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: BlocConsumer<CategoryEditBloc, CategoryEditState>(
        listenWhen: (p, c) => p.saveStatus != c.saveStatus,
        listener: (context, state) {
          if (state.saveStatus == ApiStatus.SUCCESS) {
            context.pop(true);
          }
          if (state.saveStatus == ApiStatus.FAILURE) {
            AppToastsUtils.showErrorTop(
              context,
              state.errorMessage ?? AppConstants.somethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          if (state.loadStatus == ApiStatus.LOADING ||
              state.loadStatus == ApiStatus.INITIAL) {
            return const AccountsShimmerBody();
          }
          return ListView(
            padding: context.pagePadding,
            children: [
              Text(
                'Category name',
                style: context.labelMedium.copyWith(fontWeight: .w600),
              ),
              heightBox(6),
              TextField(
                controller: _nameController,
                onChanged: (v) => context.read<CategoryEditBloc>().add(
                  CategoryEditNameChanged(v),
                ),
                decoration: InputDecoration(
                  hintText: 'e.g. Rice',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              heightBox(16),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: .leading,
                value: state.isRawMaterial,
                onChanged: (v) => context.read<CategoryEditBloc>().add(
                  CategoryEditRawMaterialToggled(v ?? false),
                ),
                title: Text(
                  'This category is for Raw Material (e.g Wheat)',
                  style: context.bodySmall.copyWith(fontWeight: .w600),
                ),
                subtitle: Text(
                  'Only one category can be raw material. It drives wheat purchase '
                  'cost on the Parta report.',
                  style: context.bodySmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ),
              heightBox(8),
              Text(
                'Standard bag (kg)',
                style: context.labelMedium.copyWith(fontWeight: .w600),
              ),
              heightBox(6),
              TextField(
                controller: _bagWeightController,
                keyboardType: TextInputType.number,
                onChanged: (v) => context.read<CategoryEditBloc>().add(
                  CategoryEditBagWeightChanged(int.tryParse(v) ?? 0),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              heightBox(24),
              Text(
                'Products',
                style: context.titleSmall.copyWith(fontWeight: .w700),
              ),
              heightBox(4),
              Text(
                'Each item can belong to one Parta category only.',
                style: context.bodySmall.copyWith(color: context.textSecondary),
              ),
              heightBox(12),
              _SearchField(
                controller: _searchController,
                onChanged: (v) => context.read<CategoryEditBloc>().add(
                  CategoryEditSearchChanged(v),
                ),
              ),
              heightBox(12),
              _ProductsTable(
                products: state.filteredProducts,
                selected: state.selectedItemIds,
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Search field ────────────────────────────────────────────────────────────

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.border),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: context.bodySmall.copyWith(fontSize: 13),
        decoration: InputDecoration(
          filled: false,
          hintText: 'Filter by product or item group',
          hintStyle: context.bodySmall.copyWith(
            color: context.textSecondary,
            fontSize: 13,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 18,
            color: context.textSecondary,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}

// ─── Products table ───────────────────────────────────────────────────────────

class _ProductsTable extends StatelessWidget {
  final List<PartahCategoryProductEntity> products;
  final Set<int> selected;

  const _ProductsTable({required this.products, required this.selected});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          'No products found',
          textAlign: .center,
          style: context.bodySmall.copyWith(color: context.textSecondary),
        ),
      );
    }
    return Column(
      children: [
        Container(
          color: AppColors.grey200,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Text(
                'Product',
                style: context.labelSmall.copyWith(
                  fontWeight: .w700,
                  color: context.textSecondary,
                ),
              ).expanded(flex: 3),
              Text(
                'Item group',
                style: context.labelSmall.copyWith(
                  fontWeight: .w700,
                  color: context.textSecondary,
                ),
              ).expanded(flex: 2),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.border),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          separatorBuilder: (_, __) =>
              Divider(height: 1, thickness: 1, color: context.border),
          itemBuilder: (_, i) {
            final product = products[i];
            final isSelected = selected.contains(product.itemId);
            return CheckboxListTile(
              value: isSelected,
              controlAffinity: .leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              onChanged: (_) => context.read<CategoryEditBloc>().add(
                CategoryEditProductToggled(product.itemId),
              ),
              title: Row(
                children: [
                  Text(
                    product.itemName,
                    style: context.bodySmall,
                  ).expanded(flex: 3),
                  Text(
                    product.itemGroupName ?? '—',
                    style: context.bodySmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ).expanded(flex: 2),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
