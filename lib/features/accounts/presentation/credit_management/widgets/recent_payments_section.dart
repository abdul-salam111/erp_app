import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/party_top_receipt_entity.dart';
import '../blocs/credit_management_details_cubit.dart';

class RecentPaymentsSection extends StatelessWidget {
  const RecentPaymentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditManagementDetailsCubit,
        CreditManagementDetailsState>(
      buildWhen: (p, c) =>
          p.receiptsStatus != c.receiptsStatus ||
          p.receiptsItems != c.receiptsItems ||
          p.receiptsMessage != c.receiptsMessage,
      builder: (_, state) {
        if (state.receiptsStatus == ApiStatus.LOADING) {
          return const _RecentPaymentsShimmer();
        }
        return _RecentPaymentsCard(
          items: state.receiptsItems,
          errorMessage: state.receiptsStatus == ApiStatus.FAILURE
              ? (state.receiptsMessage ?? 'Failed to load payments.')
              : null,
        );
      },
    );
  }
}

class _RecentPaymentsCard extends StatelessWidget {
  final List<PartyTopReceiptEntity> items;
  final String? errorMessage;

  const _RecentPaymentsCard({required this.items, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // ── Title ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Text(
              'Recent Payments',
              style: context.bodySmall.copyWith(
                fontWeight: .w700,
                fontSize: 13,
                color: context.textPrimary,
              ),
            ),
          ),
          // ── Header ────────────────────────────────────────────────
          Container(
            color: context.primary.withValues(alpha: 0.07),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                _HeaderCell('Receipt #', flex: 3, align: .start),
                _HeaderCell('Amount', flex: 3, align: .center),
                _HeaderCell('Mode', flex: 4, align: .start),
              ],
            ),
          ),
          // ── Rows / empty ──────────────────────────────────────────
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  errorMessage ?? 'No recent payments to display.',
                  style: context.bodySmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          else
            for (int i = 0; i < items.length; i++) ...[
              _PaymentRow(item: items[i]),
              if (i < items.length - 1)
                Divider(height: 1, thickness: 1, color: AppColors.grey100),
            ],
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  final TextAlign align;
  const _HeaderCell(this.text, {required this.flex, required this.align});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: context.labelSmall.copyWith(
          color: context.primary,
          fontWeight: .w600,
          fontSize: 11,
        ),
        textAlign: align,
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  final PartyTopReceiptEntity item;
  const _PaymentRow({required this.item});

  static String _formatDate(String raw) {
    if (raw.length < 10) return raw;
    try {
      final dt = DateTime.parse(raw);
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${dt.day.toString().padLeft(2, '0')} ${months[dt.month - 1]} ${dt.year.toString().substring(2)}';
    } catch (_) {
      return raw.substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          // Receipt # + date
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  item.docNbr,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    fontSize: 12,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatDate(item.docDate),
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          // Amount — centred
          Expanded(
            flex: 3,
            child: Text(
              item.amount.asPrice,
              style: context.bodySmall.copyWith(
                fontWeight: .w600,
                fontSize: 12,
                color: context.textPrimary,
              ),
              textAlign: .center,
            ),
          ),
          // Mode + account name
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  item.mode,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    fontSize: 12,
                    color: context.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                if (item.account != null && item.account!.name.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    item.account!.name,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentPaymentsShimmer extends StatelessWidget {
  const _RecentPaymentsShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: ShimmerBox(height: 13, width: 130, radius: 4),
          ),
          Container(
            color: context.primary.withValues(alpha: 0.07),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                _HeaderCell('Receipt #', flex: 3, align: .start),
                _HeaderCell('Amount', flex: 3, align: .center),
                _HeaderCell('Mode', flex: 4, align: .start),
              ],
            ),
          ),
          for (int i = 0; i < 3; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: const [
                        ShimmerBox(height: 12, radius: 4),
                        SizedBox(height: 4),
                        ShimmerBox(height: 10, width: 60, radius: 4),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(flex: 3, child: ShimmerBox(height: 12, radius: 4)),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: const [
                        ShimmerBox(height: 12, radius: 4),
                        SizedBox(height: 4),
                        ShimmerBox(height: 10, radius: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (i < 2) Divider(height: 1, thickness: 1, color: AppColors.grey100),
          ],
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
