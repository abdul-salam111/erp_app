import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/credit_managment/party_unpaid_debit_entity.dart';
import '../blocs/credit_management_details_cubit.dart';
import 'table_card.dart';

class UnpaidInvoicesSection extends StatelessWidget {
  const UnpaidInvoicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditManagementDetailsCubit,
        CreditManagementDetailsState>(
      buildWhen: (p, c) =>
          p.unpaidStatus != c.unpaidStatus ||
          p.unpaidItems != c.unpaidItems ||
          p.unpaidMessage != c.unpaidMessage,
      builder: (context, state) {
        if (state.unpaidStatus == ApiStatus.LOADING) {
          return const ShimmerBox(width: double.infinity, height: 160, radius: 8);
        }

        if (state.unpaidStatus == ApiStatus.FAILURE) {
          return _ErrorCard(
            message: state.unpaidMessage ?? 'Failed to load invoices',
          );
        }

        return TableCard(
          title: 'Unpaid Invoices',
          titleTrailing: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: context.primary.withValues(alpha: 0.10),
                borderRadius: .circular(6),
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(Iconsax.sms, size: 13, color: context.primary),
                  const SizedBox(width: 4),
                  Text(
                    'Send Unpaid Invoice',
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontSize: 11,
                      fontWeight: .w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          header: const Row(
            children: [
              TableHeaderCell('Inv No', flex: 2),
              TableHeaderCell('Receivable', flex: 2, align: TextAlign.center),
              TableHeaderCell('Age', flex: 2, align: TextAlign.center),
              SizedBox(width: 20),
            ],
          ),
          rows: state.unpaidItems.map((item) => _InvoiceRow(item: item)).toList(),
          emptyMessage: 'No unpaid invoices.',
        );
      },
    );
  }
}

// ── Table row ─────────────────────────────────────────────────────────────────

class _InvoiceRow extends StatefulWidget {
  final PartyUnpaidDebitEntity item;
  const _InvoiceRow({required this.item});

  @override
  State<_InvoiceRow> createState() => _InvoiceRowState();
}

class _InvoiceRowState extends State<_InvoiceRow> {
  bool _expanded = false;

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
    final item = widget.item;
    return Column(
      crossAxisAlignment: .start,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        item.docNbr,
                        style: context.bodySmall.copyWith(
                          fontWeight: .w600,
                          fontSize: 12,
                        ),
                      ),
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
                Expanded(
                  flex: 2,
                  child: Text(
                    item.remainingAmount.asPrice,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w600,
                      fontSize: 12,
                    ),
                    textAlign: .center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${item.daysOverdue}',
                    style: context.bodySmall.copyWith(
                      color: context.textPrimary,
                      fontSize: 12,
                      fontWeight: .w600,
                    ),
                    textAlign: .center,
                  ),
                ),
                SizedBox(
                  width: 20,
                  child: AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: context.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          alignment: .topCenter,
          child: _expanded
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Markup',
                            style: context.labelSmall.copyWith(
                              color: context.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.markupAmount.roundToDouble().asPrice,
                            style: context.bodySmall.copyWith(
                              fontWeight: .w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      _StatusBadge(status: item.status),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ── Status badge ──────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final s = status.toLowerCase();
    final color = s == 'unpaid'
        ? AppColors.errorBright
        : s.startsWith('partial')
            ? AppColors.orangeDark
            : AppColors.greenDark;
    final label = status.split(' ').first;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: .circular(20),
      ),
      child: Text(
        label,
        style: context.labelSmall.copyWith(
          color: color,
          fontSize: 10,
          fontWeight: .w600,
        ),
      ),
    );
  }
}

// ── Error card ────────────────────────────────────────────────────────────────

class _ErrorCard extends StatelessWidget {
  final String message;
  const _ErrorCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(8),
        border: .all(color: AppColors.grey200),
      ),
      child: Text(
        message,
        style: context.bodySmall.copyWith(
          color: context.textSecondary,
          fontSize: 12,
        ),
        textAlign: .center,
      ),
    );
  }
}
