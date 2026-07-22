import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../salary_mgmt_exports.dart';

class SalaryDetailView extends StatelessWidget {
  final SalaryRecord record;
  const SalaryDetailView({super.key, required this.record});

  static final _monthFmt = DateFormat('MMMM yyyy');
  static final _dateFmt = DateFormat('dd MMM yyyy');
  static final _refFmt = DateFormat('yyyyMM');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.grey50,
      appBar: const CustomAppBar(title: 'Payslip'),
      body: SingleChildScrollView(
        padding: context.pagePadding.copyWith(top: 20, bottom: 32),
        child: Column(
          children: [
            _ReceiptCard(record: record, monthFmt: _monthFmt, dateFmt: _dateFmt, refFmt: _refFmt),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Download Payslip',
              icon: Iconsax.document_download,
              isOutlined: true,
              onPressed: () {},
              radius: 10,
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

// --- Receipt card -------------------------------------------------------------

class _ReceiptCard extends StatelessWidget {
  final SalaryRecord record;
  final DateFormat monthFmt;
  final DateFormat dateFmt;
  final DateFormat refFmt;

  const _ReceiptCard({
    required this.record,
    required this.monthFmt,
    required this.dateFmt,
    required this.refFmt,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            _TornEdge(bgColor: context.grey50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  const SizedBox(height: 6),
                  const _CompanyHeader(),
                  const SizedBox(height: 16),
                  const _DashDivider(),
                  const SizedBox(height: 14),
                  Text(
                    'SALARY PAYSLIP',
                    style: context.bodySmall.copyWith(
                      fontWeight: .w700,
                      letterSpacing: 1.8,
                      color: context.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    monthFmt.format(record.month),
                    style: context.labelMedium.copyWith(color: context.textSecondary),
                  ),
                  const SizedBox(height: 14),
                  const _DashDivider(),
                  const SizedBox(height: 12),
                  const _EmployeeBlock(),
                  const SizedBox(height: 12),
                  const _DashDivider(),
                  const SizedBox(height: 14),
                  _SectionLabel('EARNINGS', AppColors.creditGreen),
                  const SizedBox(height: 8),
                  ...record.earnings.map(
                    (e) => _ReceiptRow(label: e.label, amount: e.amount.withCommas),
                  ),
                  const _DashDivider(),
                  const SizedBox(height: 6),
                  _TotalRow(
                    label: 'Gross Pay',
                    amount: record.grossPay.asPKR,
                    color: AppColors.creditGreen,
                  ),
                  const SizedBox(height: 14),
                  const _DashDivider(),
                  const SizedBox(height: 14),
                  _SectionLabel('DEDUCTIONS', AppColors.debitRed),
                  const SizedBox(height: 8),
                  ...record.deductions.map(
                    (d) => _ReceiptRow(label: d.label, amount: d.amount.withCommas),
                  ),
                  const _DashDivider(),
                  const SizedBox(height: 6),
                  _TotalRow(
                    label: 'Total Deductions',
                    amount: record.totalDeductions.asPKR,
                    color: AppColors.debitRed,
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
            const _DoubleRule(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    'NET PAY',
                    style: context.labelMedium.copyWith(
                      letterSpacing: 2.5,
                      color: context.textSecondary,
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    record.netPay.asPKR,
                    style: context.headlineMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: .w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            const _DoubleRule(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  _ReceiptRow(
                    label: 'Disbursed On',
                    amount: dateFmt.format(record.disbursed),
                  ),
                  _ReceiptRow(
                    label: 'Status',
                    amount: 'PAID',
                    amountColor: AppColors.creditGreen,
                    amountBold: true,
                  ),
                  const SizedBox(height: 12),
                  const _DashDivider(),
                  const SizedBox(height: 12),
                  Text(
                    'REF: PAY-${refFmt.format(record.month)}-0231',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Generated: ${DateFormat('dd MMM yyyy').format(DateTime.now())}',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
            _TornEdge(bgColor: context.grey50, flipVertical: true),
          ],
        ),
      ),
    );
  }
}

// --- Company header -----------------------------------------------------------

class _CompanyHeader extends StatelessWidget {
  const _CompanyHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentUser.org.name.toUpperCase(),
          style: context.titleSmall.copyWith(
            fontWeight: .w800,
            letterSpacing: 2.5,
            color: context.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Human Resources Department',
          style: context.labelSmall.copyWith(color: context.textSecondary, fontSize: 11),
        ),
      ],
    );
  }
}

// --- Employee block -----------------------------------------------------------

class _EmployeeBlock extends StatelessWidget {
  const _EmployeeBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        _ReceiptRow(label: 'Employee', amount: currentUser.fullName),
        const _ReceiptRow(label: 'Designation', amount: 'Software Engineer'),
        const _ReceiptRow(label: 'Employee ID', amount: 'EMP-0231'),
      ],
    );
  }
}

// --- Section label -----------------------------------------------------------

class _SectionLabel extends StatelessWidget {
  final String text;
  final Color color;

  const _SectionLabel(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerLeft,
      child: Text(
        text,
        style: context.labelSmall.copyWith(
          color: color,
          fontWeight: .w700,
          letterSpacing: 1.5,
          fontSize: 11,
        ),
      ),
    );
  }
}

// --- Receipt row -------------------------------------------------------------

class _ReceiptRow extends StatelessWidget {
  final String label;
  final String amount;
  final Color? amountColor;
  final bool amountBold;

  const _ReceiptRow({
    required this.label,
    required this.amount,
    this.amountColor,
    this.amountBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: context.labelMedium.copyWith(color: context.textSecondary),
            ),
          ),
          Text(
            amount,
            style: context.bodySmall.copyWith(
              fontSize: 14,
              color: amountColor ?? context.textPrimary,
              fontWeight: .w700,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Total row ---------------------------------------------------------------

class _TotalRow extends StatelessWidget {
  final String label;
  final String amount;
  final Color color;

  const _TotalRow({required this.label, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(label, style: context.bodySmall.copyWith(color: color, fontWeight: .w700, fontSize: 14)),
          Text(amount, style: context.bodySmall.copyWith(color: color, fontWeight: .w700, fontSize: 14)),
        ],
      ),
    );
  }
}

// --- Double rule -------------------------------------------------------------

class _DoubleRule extends StatelessWidget {
  const _DoubleRule();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 1.5, color: AppColors.grey200),
        const SizedBox(height: 3),
        Container(height: 1.5, color: AppColors.grey200),
      ],
    );
  }
}

// --- Dash divider ------------------------------------------------------------

class _DashDivider extends StatelessWidget {
  const _DashDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: double.infinity,
      child: CustomPaint(painter: _DashPainter(color: AppColors.grey200)),
    );
  }
}

class _DashPainter extends CustomPainter {
  final Color color;
  const _DashPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const dashWidth = 5.0;
    const gap = 4.0;
    double x = 0;

    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + gap;
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// --- Torn edge ---------------------------------------------------------------

class _TornEdge extends StatelessWidget {
  final Color bgColor;
  final bool flipVertical;

  const _TornEdge({required this.bgColor, this.flipVertical = false});

  @override
  Widget build(BuildContext context) {
    final edge = SizedBox(
      height: 10,
      width: double.infinity,
      child: CustomPaint(painter: _TornEdgePainter(bgColor: bgColor)),
    );

    return flipVertical ? RotatedBox(quarterTurns: 2, child: edge) : edge;
  }
}

class _TornEdgePainter extends CustomPainter {
  final Color bgColor;
  const _TornEdgePainter({required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final paint = Paint()..color = bgColor;
    const r = 7.0;
    double x = r;
    while (x < size.width) {
      canvas.drawCircle(Offset(x, size.height), r, paint);
      x += r * 2.2;
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
