import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/accounts/recovery_invoice_entity.dart';
import '../blocs/accounts_bloc.dart';
import '../blocs/accounts_state.dart';
import 'accounts_models.dart';


class RecoveryListSection extends StatelessWidget {
  const RecoveryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        BlocBuilder<AccountsBloc, AccountsState>(
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
        const SizedBox(height: 10),
        BlocBuilder<AccountsBloc, AccountsState>(
          buildWhen: (p, c) =>
              p.recoveryDueStatus != c.recoveryDueStatus ||
              p.recoveryDue != c.recoveryDue,
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

            final invoices = state.recoveryDue?.invoices ?? const [];

            if (invoices.isEmpty) {
              return Center(
                child: Padding(
                  padding: .symmetric(vertical: 24),
                  child: Text(
                    AppConstants.noDataAvailable,
                    style: context.bodySmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: invoices.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  _CustomerTile(invoice: invoices[index]),
            );
          },
        ),
      ],
    );
  }
}

// ─── Customer tile ────────────────────────────────────────────────────────────

class _CustomerTile extends StatelessWidget {
  final RecoveryInvoiceEntity invoice;
  const _CustomerTile({required this.invoice});

  CustomerStatus get _status {
    if (invoice.flgPostpone) return CustomerStatus.partial;
    if (invoice.isPartiallyPaid) return CustomerStatus.partial;
    return CustomerStatus.actionRequired;
  }

  @override
  Widget build(BuildContext context) {
    final remaining = invoice.remainingAmount;
    final total     = invoice.docAmount;

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
                  invoice.initials,
                  style: context.labelMedium.copyWith(
                    color: context.primary,
                    fontWeight: .w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  invoice.party.fullName,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    color: context.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              _StatusBadge(status: _status),
              if (_status == CustomerStatus.actionRequired) ...[
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
                    onSelected: (action) {},
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
                    invoice.docNbr,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    invoice.docDate,
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
                    'Rs ${remaining.formatPrice()}',
                    style: context.labelMedium.copyWith(
                      color: context.primary,
                      fontWeight: .w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'of Rs ${total.formatPrice()}',
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
