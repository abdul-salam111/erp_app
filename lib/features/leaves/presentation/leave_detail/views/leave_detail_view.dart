import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';

// ─── Args ────────────────────────────────────────────────────────────────────

class LeaveDetailArgs {
  final String requestedBy;
  final String requestedAt;
  final String leaveDates;
  final String leaveType;
  final String status;
  final Color statusColor;
  final String detail;
  final List<String> fileNames;

  const LeaveDetailArgs({
    required this.requestedBy,
    required this.requestedAt,
    required this.leaveDates,
    required this.leaveType,
    required this.status,
    required this.statusColor,
    this.detail = '',
    this.fileNames = const [],
  });
}

// ─── View ────────────────────────────────────────────────────────────────────

class LeaveDetailView extends StatelessWidget {
  final LeaveDetailArgs args;
  const LeaveDetailView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      appBar: CustomAppBar(title: 'Leave Details'),
      body: SingleChildScrollView(
        padding: context.pagePadding.copyWith(top: 20, bottom: 32),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // ── Info card ──
            Container(
              decoration: BoxDecoration(
                color: context.white,
                borderRadius: .circular(12),
                border: Border.all(color: context.border),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _InfoRow(
                    icon: Iconsax.user,
                    label: 'Requested by',
                    value: args.requestedBy,
                  ),
                  _RowDivider(),
                  _InfoRow(
                    icon: Iconsax.calendar_1,
                    label: 'Requested at',
                    value: args.requestedAt,
                  ),
                  _RowDivider(),
                  _InfoRow(
                    icon: Iconsax.calendar_2,
                    label: 'Leave Dates',
                    value: args.leaveDates,
                  ),
                  _RowDivider(),
                  _InfoRow(
                    icon: Iconsax.health,
                    label: 'Leave Type',
                    value: args.leaveType,
                  ),
                  _RowDivider(),
                  _InfoRow(
                    icon: Iconsax.clock,
                    label: 'Status',
                    value: args.status,
                    valueColor: args.statusColor,
                    iconColor: args.statusColor,
                  ),
                ],
              ),
            ),

            // ── Detail text ──
            if (args.detail.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: context.white,
                  borderRadius: .circular(12),
                  border: Border.all(color: context.border),
                ),
                child: Text(
                  args.detail,
                  style: context.labelMedium.copyWith(
                    color: context.textPrimary,
                    height: 1.6,
                  ),
                ),
              ),
            ],

            // ── Attachments ──
            if (args.fileNames.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                'Attachments',
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 13,
                  fontWeight: .w600,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: args.fileNames
                    .map((name) => _FileCard(name: name))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Info row ────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final Color? iconColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          Icon(
            icon,
            size: 16,
            color: iconColor ?? context.textSecondary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: context.labelMedium.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w600,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: context.labelMedium.copyWith(
                      color: valueColor ?? context.textPrimary,
                      fontWeight: valueColor != null ? .w600 : .w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) =>
      Divider(height: 1, thickness: 1, color: context.border);
}

// ─── File card ───────────────────────────────────────────────────────────────

class _FileCard extends StatelessWidget {
  final String name;
  const _FileCard({required this.name});

  String get _ext {
    final dot = name.lastIndexOf('.');
    return dot >= 0 ? name.substring(dot + 1).toUpperCase() : 'FILE';
  }

  Color _extColor(BuildContext context) => switch (_ext) {
        'PDF'                    => AppColors.errorBright,
        'PNG' || 'JPG' || 'JPEG' => AppColors.info,
        'DOC' || 'DOCX'          => AppColors.primaryDark,
        _                        => context.textSecondary,
      };

  @override
  Widget build(BuildContext context) {
    final color = _extColor(context);
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: .circular(8),
              border: Border.all(color: color.withValues(alpha: 0.25)),
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Icon(Iconsax.document, size: 20, color: color),
                const SizedBox(height: 2),
                Text(
                  _ext,
                  style: context.labelSmall.copyWith(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: color,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: context.labelSmall.copyWith(
              color: context.textSecondary,
              fontSize: 10,
            ),
            overflow: .ellipsis,
            maxLines: 1,
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
