import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../routes/route_names.dart';
import '../../../domain/entities/partah_record_entity.dart';
import '../blocs/reports_bloc.dart';
import '../blocs/reports_event.dart';
import '../blocs/reports_state.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ReportsBloc>()..add(ReportsStarted()),
      child: const _ReportsBody(),
    );
  }
}

class _ReportsBody extends StatelessWidget {
  const _ReportsBody();

  void _confirmDelete(BuildContext context, PartahRecordEntity record) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: context.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Delete Report?', style: context.titleMedium.copyWith(fontWeight: .w700)),
        content: Text(
          'This report from ${record.createdAt.displayDate} will be permanently deleted.',
          style: context.bodyMedium.copyWith(color: context.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Cancel', style: context.labelMedium.copyWith(color: context.textSecondary)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<ReportsBloc>().add(ReportDeleteRequested(record.id!));
            },
            child: Text(
              'Delete',
              style: context.labelMedium.copyWith(color: context.error, fontWeight: .w700),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: const CustomAppBar(title: 'Reports'),
      body: BlocConsumer<ReportsBloc, ReportsState>(
        listenWhen: (p, n) => p.deleteStatus != n.deleteStatus,
        listener: (context, state) {
          if (state.deleteStatus == ApiStatus.SUCCESS) {
            AppToastsUtils.showSuccessTop(context, 'Report deleted');
          }
          if (state.deleteStatus == ApiStatus.FAILURE) {
            AppToastsUtils.showErrorTop(context, state.errorMessage ?? 'Could not delete report');
          }
        },
        builder: (context, state) {
          if (state.loadStatus == ApiStatus.LOADING || state.loadStatus == ApiStatus.INITIAL) {
            return const _ReportsShimmer();
          }
          if (state.loadStatus == ApiStatus.FAILURE) {
            return ErrorStateWidget(
              message: state.errorMessage,
              onRetry: () => context.read<ReportsBloc>().add(ReportsStarted()),
            );
          }
          if (state.records.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.bar_chart_rounded,
              title: 'No Reports Yet',
              subtitle: 'Saved Partah reports will appear here.',
            ).center();
          }
          return PullToRefreshWrapper(
            onRefresh: () async => context.read<ReportsBloc>().add(ReportsStarted()),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
              itemCount: state.records.length,
              separatorBuilder: (_, __) => heightBox(5),
              itemBuilder: (context, i) {
                final record = state.records[i];
                return _ReportCard(
                  record: record,
                  onDelete: () => _confirmDelete(context, record),
                  onTap: () => context.pushNamed(RouteNames.report_detail, extra: record),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ─── Report Card ──────────────────────────────────────────────────────────────

class _ReportCard extends StatelessWidget {
  final PartahRecordEntity record;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const _ReportCard({required this.record, required this.onDelete, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final net = record.netProfit;
    final isProfit = net >= 0;
    final profitColor = isProfit ? context.success : context.error;

    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(color: context.textPrimary.withAlpha(6), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: context.primary.withAlpha(14), borderRadius: BorderRadius.circular(9)),
            child: Icon(Icons.receipt_long_rounded, size: 18, color: context.primary),
          ),
          widthBox(10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                record.createdAt.displayDate,
                style: context.labelMedium.copyWith(fontWeight: .w700, color: context.textPrimary),
              ),
              Text(
                record.createdAt.time12Hour,
                style: context.labelSmall.copyWith(color: context.textSecondary, fontSize: 10),
              ),
            ],
          ).expanded(),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text(
                'Rs ${net.abs().withCommas}',
                style: context.titleMedium.copyWith(color: profitColor, fontWeight: .w800),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(color: profitColor.withAlpha(22), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  isProfit ? 'PROFIT' : 'LOSS',
                  style: context.labelSmall.copyWith(
                    color: profitColor,
                    fontWeight: .w800,
                    fontSize: 9,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          widthBox(4),
          IconButton(
            onPressed: onDelete,
            icon: Icon(Iconsax.trash, size: 18, color: context.textSecondary),
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
          ),
        ],
      ).withPadding(const EdgeInsets.fromLTRB(14, 12, 10, 10)),
    ).onTap(onTap);
  }
}

// ─── Shimmer Skeleton ─────────────────────────────────────────────────────────

Widget _rBox({double? w, double? h, double r = 8}) => Container(
      width: w ?? double.infinity,
      height: h,
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(r)),
    );

class _ReportsShimmer extends StatelessWidget {
  const _ReportsShimmer();

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
        itemCount: 6,
        separatorBuilder: (_, __) => heightBox(10),
        itemBuilder: (_, __) => _shimmerCard(),
      ),
    );
  }

  Widget _shimmerCard() => Container(
        decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 10, 10),
          child: Row(
            children: [
              _rBox(w: 36, h: 36, r: 9),
              widthBox(10),
              Column(
                crossAxisAlignment: .start,
                children: [
                  _rBox(w: 110, h: 12, r: 6),
                  heightBox(6),
                  _rBox(w: 70, h: 10, r: 5),
                ],
              ).expanded(),
              widthBox(12),
              Column(
                crossAxisAlignment: .end,
                children: [
                  _rBox(w: 80, h: 14, r: 6),
                  heightBox(6),
                  _rBox(w: 50, h: 16, r: 4),
                ],
              ),
              widthBox(8),
              _rBox(w: 18, h: 18, r: 4),
            ],
          ),
        ),
      );
}
