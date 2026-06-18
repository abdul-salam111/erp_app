import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../blocs/accounts_bloc.dart';
import '../blocs/accounts_event.dart';
import '../blocs/accounts_state.dart';
import 'accounts_models.dart';


class RecoveryListSection extends StatelessWidget {
  final List<CustomerRow> rows;
  const RecoveryListSection({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<AccountsBloc, AccountsState>(
                buildWhen: (p, c) =>
                    p.recoveryDueStatus != c.recoveryDueStatus ||
                    p.recoveryDue != c.recoveryDue,
                builder: (context, state) {
                  final isLoading =
                      state.recoveryDueStatus == ApiStatus.INITIAL ||
                      state.recoveryDueStatus == ApiStatus.LOADING;

                  if (isLoading) {
                    return Column(
                      crossAxisAlignment: .start,
                      children: [
                        ShimmerBox(height: 11, radius: 4),
                        const SizedBox(height: 5),
                        ShimmerBox(height: 5, radius: 4),
                      ],
                    );
                  }

                  final rd       = state.recoveryDue;
                  final total    = rd?.ttlRecoveryAmount ?? 0;
                  final received = rd?.ttlReceivedAmount ?? 0;
                  final progress = total > 0
                      ? (received / total).clamp(0.0, 1.0)
                      : 0.0;
                  final pct = (progress * 100).round();
                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            AppConstants.recoveryProgress,
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                          Text(
                            '$pct%',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontWeight: .w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: .circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 5,
                          backgroundColor: AppColors.grey200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.primary,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            BlocBuilder<AccountsBloc, AccountsState>(
              buildWhen: (prev, curr) =>
                  prev.selectedFilter != curr.selectedFilter,
              builder: (context, state) => Row(
                children: [
                  _FilterTab(
                    label: AppConstants.todayLabel,
                    selected: state.selectedFilter == FilterType.today,
                    onTap: () => context.read<AccountsBloc>().add(
                      const RecoveryFilterChanged(FilterType.today),
                    ),
                  ),
                  const SizedBox(width: 6),
                  _FilterTab(
                    label: AppConstants.oldestLabel,
                    selected: state.selectedFilter == FilterType.oldest,
                    onTap: () => context.read<AccountsBloc>().add(
                      const RecoveryFilterChanged(FilterType.oldest),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        BlocBuilder<AccountsBloc, AccountsState>(
          buildWhen: (p, c) => p.recoveryDueStatus != c.recoveryDueStatus,
          builder: (context, state) {
            final isLoading =
                state.recoveryDueStatus == ApiStatus.INITIAL ||
                state.recoveryDueStatus == ApiStatus.LOADING;

            if (isLoading) {
              return Column(
                children: List.generate(
                  4,
                  (i) => Padding(
                    padding: EdgeInsets.only(bottom: i < 3 ? 8 : 0),
                    child: const ShimmerBox(height: 82, radius: 10),
                  ),
                ),
              );
            }

            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                itemCount: rows.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) =>
                    _CustomerTile(row: rows[index]),
              ),
            );
          },
        ),
        Align(
          alignment: .centerRight,
          child: TextButton.icon(
            onPressed: () => context
                .read<AccountsBloc>()
                .add(const TodayOverviewExpansionToggled()),
            icon: const Icon(Icons.keyboard_arrow_up_rounded, size: 16),
            label: const Text(AppConstants.hideDetailsLabel),
          ),
        ),
      ],
    );
  }
}

// ─── Customer tile ────────────────────────────────────────────────────────────

class _CustomerTile extends StatelessWidget {
  final CustomerRow row;
  const _CustomerTile({required this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: context.primary.withValues(alpha: 0.12),
                child: Text(
                  row.initials,
                  style: context.labelMedium.copyWith(
                    color: context.primary,
                    fontWeight: .w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      row.name,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      row.city,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _StatusBadge(status: row.status),
              if (row.status == CustomerStatus.actionRequired) ...[
                const SizedBox(width: 2),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: PopupMenuButton<TileAction>(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: context.textSecondary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(10),
                    ),
                    onSelected: (action) {
                      // TODO: wire up actions
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: TileAction.addReceipt,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.receipt_long_outlined,
                              size: 16,
                              color: context.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppConstants.addReceipt,
                              style: context.bodySmall.copyWith(
                                color: context.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(height: 1),
                      PopupMenuItem(
                        value: TileAction.postponeInvoice,
                        height: 40,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.schedule_outlined,
                              size: 16,
                              color: AppColors.orange,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppConstants.postponeInvoice,
                              style: context.bodySmall.copyWith(
                                color: context.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    row.invoiceNo,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    row.date,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: .end,
                children: [
                  Text(
                    'Rs ${row.paid}',
                    style: context.labelMedium.copyWith(
                      color: context.primary,
                      fontWeight: .w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'of Rs ${row.total}',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Filter tab ───────────────────────────────────────────────────────────────

class _FilterTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: .symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? context.primary : AppColors.transparent,
          borderRadius: .circular(20),
          border: Border.all(
            color: selected ? context.primary : AppColors.grey200,
          ),
        ),
        child: Text(
          label,
          style: context.labelSmall.copyWith(
            color: selected ? AppColors.white : context.textSecondary,
            fontWeight: .w600,
          ),
        ),
      ),
    );
  }
}

// ─── Status badge ─────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final CustomerStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final isAction = status == CustomerStatus.actionRequired;
    final color = isAction ? AppColors.orange : AppColors.green;
    final label = isAction ? AppConstants.actionReq : AppConstants.partial;
    return Container(
      padding: .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: .circular(20),
      ),
      child: Text(
        label,
        style: context.labelSmall.copyWith(
          color: color,
          fontWeight: .w600,
          fontSize: 10,
        ),
      ),
    );
  }
}
