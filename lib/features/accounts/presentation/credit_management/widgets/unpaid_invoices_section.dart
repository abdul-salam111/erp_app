import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import 'table_card.dart';

class UnpaidInvoicesSection extends StatelessWidget {
  const UnpaidInvoicesSection({super.key});

  static const _invoices = [
    _UnpaidInvoice(
      invNo: 'CP-0791',
      date: '01 Jan',
      receivable: 'Rs 4,200',
      age: 18,
      creditMarkup: 'Rs 8',
      unpaid: true,
    ),
    _UnpaidInvoice(
      invNo: 'CP-0792',
      date: '01 Feb',
      receivable: 'Rs 3,800',
      age: 29,
      creditMarkup: 'Rs 10',
      unpaid: true,
    ),
    _UnpaidInvoice(
      invNo: 'CP-0794',
      date: '01 Mar',
      receivable: 'Rs 1,000',
      age: 41,
      creditMarkup: 'Rs 12',
      unpaid: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TableCard(
      title: 'Unpaid Invoices',
      header: Row(
        children: [
          TableHeaderCell('Inv No', flex: 2),
          TableHeaderCell('Receivable', flex: 2, align: .end),
          TableHeaderCell('Age', flex: 1, align: .center),
          TableHeaderCell('Markup', flex: 2, align: .end),
          TableHeaderCell('Status', flex: 2, align: .center),
        ],
      ),
      rows: _invoices.map((inv) => _InvoiceRow(inv: inv)).toList(),
      emptyMessage: 'No unpaid invoices.',
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────

class _UnpaidInvoice {
  final String invNo;
  final String date;
  final String receivable;
  final int age;
  final String creditMarkup;
  final bool unpaid;

  const _UnpaidInvoice({
    required this.invNo,
    required this.date,
    required this.receivable,
    required this.age,
    required this.creditMarkup,
    required this.unpaid,
  });
}

// ── Table row ─────────────────────────────────────────────────────────────────

class _InvoiceRow extends StatelessWidget {
  final _UnpaidInvoice inv;
  const _InvoiceRow({required this.inv});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  inv.invNo,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w600,
                    fontSize: 12,
                  ),
                ),
                Text(
                  inv.date,
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
              inv.receivable,
              style: context.bodySmall.copyWith(
                fontWeight: .w600,
                fontSize: 12,
              ),
              textAlign: .end,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${inv.age}',
              style: context.bodySmall.copyWith(
                color: context.textSecondary,
                fontSize: 12,
              ),
              textAlign: .center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              inv.creditMarkup,
              style: context.bodySmall.copyWith(fontSize: 12),
              textAlign: .end,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(child: _StatusBadge(unpaid: inv.unpaid)),
          ),
        ],
      ),
    );
  }
}

// ── Status badge ──────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final bool unpaid;
  const _StatusBadge({required this.unpaid});

  @override
  Widget build(BuildContext context) {
    final color = unpaid ? const Color(0xFFE53935) : AppColors.greenDark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: .circular(20),
      ),
      child: Text(
        unpaid ? 'Unpaid' : 'Paid',
        style: context.labelSmall.copyWith(
          color: color,
          fontSize: 10,
          fontWeight: .w600,
        ),
      ),
    );
  }
}
