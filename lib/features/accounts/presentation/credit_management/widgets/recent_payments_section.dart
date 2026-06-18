import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import 'table_card.dart';

class RecentPaymentsSection extends StatelessWidget {
  const RecentPaymentsSection({super.key});

  static const _payments = <_PaymentData>[];

  @override
  Widget build(BuildContext context) {
    return TableCard(
      title: 'Recent Payments',
      header: Row(
        children: [
          TableHeaderCell('Receipt #', flex: 3),
          TableHeaderCell('Amount', flex: 2, align: .end),
          TableHeaderCell('Mode', flex: 2, align: .end),
        ],
      ),
      rows: _payments.map((p) => _PaymentRow(payment: p)).toList(),
      emptyMessage: 'No recent payments to display.',
    );
  }
}

class _PaymentData {
  final String receiptNo;
  final String amount;
  final String mode;
  const _PaymentData({
    required this.receiptNo,
    required this.amount,
    required this.mode,
  });
}

class _PaymentRow extends StatelessWidget {
  final _PaymentData payment;
  const _PaymentRow({required this.payment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              payment.receiptNo,
              style: context.bodySmall.copyWith(
                fontWeight: .w600,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              payment.amount,
              style: context.bodySmall.copyWith(
                fontWeight: .w600,
                fontSize: 12,
              ),
              textAlign: .end,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              payment.mode,
              style: context.bodySmall.copyWith(
                color: context.textSecondary,
                fontSize: 12,
              ),
              textAlign: .end,
            ),
          ),
        ],
      ),
    );
  }
}
