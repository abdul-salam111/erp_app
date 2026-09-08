import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/accounts_widgets/accounts_ledger_states.dart';
import '../../../../../core/widgets/accounts_widgets/accounts_shimmer_body.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../routes/route_names.dart';
import '../../../domain/entities/partah_category_entity.dart';
import '../blocs/partah_categories_bloc.dart';
import '../blocs/partah_categories_event.dart';
import '../blocs/partah_categories_state.dart';

class PartahCategoriesView extends StatelessWidget {
  const PartahCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PartahCategoriesBloc>()..add(const PartahCategoriesStarted()),
      child: const _PartahCategoriesBody(),
    );
  }
}

class _PartahCategoriesBody extends StatelessWidget {
  const _PartahCategoriesBody();

  Future<void> _openEdit(BuildContext context, PartahCategoryEntity? category) async {
    final saved = await context.pushNamed<bool>(
      RouteNames.category_edit,
      extra: category,
    );
    if (saved == true && context.mounted) {
      context.read<PartahCategoriesBloc>().add(const PartahCategoriesStarted());
      AppToastsUtils.showSuccessTop(context, 'Category saved');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'Parta Categories'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openEdit(context, null),
        child: const Icon(Iconsax.add),
      ),
      body: BlocBuilder<PartahCategoriesBloc, PartahCategoriesState>(
        builder: (context, state) {
          if (state.loadStatus == ApiStatus.LOADING ||
              state.loadStatus == ApiStatus.INITIAL) {
            return const AccountsShimmerBody();
          }
          if (state.loadStatus == ApiStatus.FAILURE) {
            return AccountsErrorBody(
              message: state.errorMessage ?? AppConstants.somethingWentWrong,
              onRetry: () =>
                  context.read<PartahCategoriesBloc>().add(const PartahCategoriesStarted()),
            );
          }
          return Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: context.pagePadding.copyWith(bottom: 0),
                child: Text(
                  'Assign each inventory item to one category. Mark exactly one category '
                  'as raw material (e.g. Wheat) for purchase cost.',
                  style: context.bodySmall.copyWith(color: context.textSecondary),
                ),
              ),
              heightBox(12),
              Padding(
                padding: context.pagePadding.copyWith(top: 0, bottom: 0),
                child: _UnassignedCard(count: state.unassignedCount),
              ),
              heightBox(16),
              if (state.categories.isEmpty)
                const AccountsEmptyState(title: 'No categories yet').expanded()
              else
                _CategoriesTable(
                  categories: state.categories,
                  onTap: (c) => _openEdit(context, c),
                ).expanded(),
            ],
          );
        },
      ),
    );
  }
}

// ─── Unassigned items card ──────────────────────────────────────────────────

class _UnassignedCard extends StatelessWidget {
  final int count;
  const _UnassignedCard({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.border),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Unassigned items',
            style: context.labelMedium.copyWith(color: context.textSecondary),
          ),
          heightBox(4),
          Text(
            '$count',
            style: context.titleLarge.copyWith(fontWeight: .w800),
          ),
        ],
      ),
    );
  }
}

// ─── Categories table ────────────────────────────────────────────────────────

class _CategoriesTable extends StatelessWidget {
  final List<PartahCategoryEntity> categories;
  final ValueChanged<PartahCategoryEntity> onTap;

  const _CategoriesTable({required this.categories, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.pagePadding.left),
      child: Column(
        children: [
          const _TableHeader(),
          Divider(height: 1, thickness: 1, color: context.border),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (_, __) => Divider(height: 1, thickness: 1, color: context.border),
            itemBuilder: (_, i) {
              final category = categories[i];
              return _CategoryRow(category: category, onTap: () => onTap(category));
            },
          ).expanded(),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    final style = context.labelSmall.copyWith(fontWeight: .w700, color: context.textSecondary);
    return Container(
      color: AppColors.grey200,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Text('Name', style: style).expanded(flex: 3),
          Text('Type', style: style).expanded(flex: 2),
          Text('Items', style: style, textAlign: .center).expanded(flex: 1),
          Text('Bag (kg)', style: style, textAlign: .end).expanded(flex: 2),
        ],
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final PartahCategoryEntity category;
  final VoidCallback onTap;

  const _CategoryRow({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Text(
              category.displayName,
              style: context.bodySmall.copyWith(fontWeight: .w600),
            ).expanded(flex: 3),
            Text(
              category.isRawMaterial ? 'Raw material' : 'Output',
              style: context.bodySmall.copyWith(
                color: category.isRawMaterial ? context.primary : context.textSecondary,
                fontWeight: category.isRawMaterial ? .w700 : .w400,
              ),
            ).expanded(flex: 2),
            Text(
              '${category.itemCount}',
              style: context.bodySmall,
              textAlign: .center,
            ).expanded(flex: 1),
            Text(
              '${category.standardBagKg}',
              style: context.bodySmall,
              textAlign: .end,
            ).expanded(flex: 2),
          ],
        ),
      ),
    );
  }
}
