import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../alert_panel_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class AlertPanelView extends StatelessWidget {
  const AlertPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AlertPanelBloc>(),
      child: const _AlertPanelBody(),
    );
  }
}

class _AlertPanelBody extends StatelessWidget {
  const _AlertPanelBody();

  static const _alerts = <_AlertItem>[
    _AlertItem(
      title:    AppConstants.pendingQCTitle,
      subtitle: AppConstants.itemsReceivedButNotYetTitle,
      count:    5,
      color:    AppColors.amber,
    ),
    _AlertItem(
      title:    AppConstants.lowStockTitle,
      subtitle: AppConstants.itemsBelowMinimumThresholdTitle,
      count:    3,
      color:    AppColors.orange,
    ),
    _AlertItem(
      title:    AppConstants.overdueMaintenanceTitle,
      subtitle: AppConstants.scheduledMaintenanceIsPastDueTitle,
      count:    6,
      color:    AppColors.errorBright,
    ),
    _AlertItem(
      title:    AppConstants.pendingAssetRegistrationTitle,
      subtitle: AppConstants.gRNItemsAwaitingTitle,
      count:    3,
      color:    AppColors.cyan,
    ),
    _AlertItem(
      title:    AppConstants.delayedRepairTitle,
      subtitle: AppConstants.twoAssetsOverdueFromRepairTitle,
      count:    2,
      color:    AppColors.errorBright,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertPanelBloc, AlertPanelState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, AppConstants.resolvedSuccessfullySuccessMsg);
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.white,
          appBar: const CustomAppBar(title: AppConstants.alertsTitle),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            children: [
              // ── Summary header card ──
              _SummaryCard(
                totalCount: _alerts.fold(0, (sum, a) => sum + a.count),
                onResolve: () => context.read<AlertPanelBloc>().add(AlertPanelSubmitted()),
                isLoading: state.apiStatus == ApiStatus.LOADING,
              ),
              const SizedBox(height: 16),

              // ── Alert cards ──
              Container(
                decoration: BoxDecoration(
                  color:        context.white,
                  borderRadius: BorderRadius.circular(14),
                  border:       Border.all(color: context.border),
                  boxShadow: [
                    BoxShadow(
                      color:     AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset:    const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap:  true,
                  padding:     EdgeInsets.zero,
                  physics:     const NeverScrollableScrollPhysics(),
                  itemCount:   _alerts.length,
                  separatorBuilder: (_, __) =>
                      Divider(height: 1, thickness: 1, color: context.border),
                  itemBuilder: (context, index) =>
                      _AlertTile(item: _alerts[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Summary header card ──────────────────────────────────────────────────────

class _SummaryCard extends StatelessWidget {
  final int          totalCount;
  final VoidCallback onResolve;
  final bool         isLoading;

  const _SummaryCard({
    required this.totalCount,
    required this.onResolve,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color:        context.white,
        borderRadius: BorderRadius.circular(14),
        border:       Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color:     AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset:    const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bell with badge
          Stack(
            clipBehavior: .none,
            children: [
              Container(
                width:  42,
                height: 42,
                decoration: BoxDecoration(
                  color:        AppColors.errorBright.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Iconsax.notification,
                  color: AppColors.errorBright,
                  size:  20,
                ),
              ),
              Positioned(
                top:   -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color:        AppColors.errorBright,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$totalCount',
                    style: const TextStyle(
                      color:      AppColors.white,
                      fontSize:   10,
                      fontWeight: FontWeight.w700,
                      height:     1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppConstants.alert,
                  style: context.titleSmall.copyWith(
                    fontWeight: .w700,
                    color:      context.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppConstants.anomaliesThatCanBlockWork,
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Resolve button
          OutlinedButton(
            onPressed: isLoading ? null : onResolve,
            style: OutlinedButton.styleFrom(
              foregroundColor:  context.primary,
              side:             BorderSide(color: context.primary.withValues(alpha: 0.6)),
              shape:            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding:          const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              minimumSize:      .zero,
              tapTargetSize:    MaterialTapTargetSize.shrinkWrap,
            ),
            child: isLoading
                ? SizedBox(
                    width:  14,
                    height: 14,
                    child:  CircularProgressIndicator(
                      strokeWidth: 2,
                      color:       context.primary,
                    ),
                  )
                : Text(
                    AppConstants.resolve,
                    style: context.labelSmall.copyWith(
                      color:      context.primary,
                      fontWeight: .w600,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ─── Alert tile ───────────────────────────────────────────────────────────────

class _AlertTile extends StatelessWidget {
  final _AlertItem item;

  const _AlertTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  item.title,
                  style: context.bodySmall.copyWith(
                    fontWeight: .w700,
                    color:      context.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: context.labelSmall.copyWith(
                    color:  context.textSecondary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Count badge
          Container(
            width:  32,
            height: 32,
            decoration: BoxDecoration(
              color:  item.color.withValues(alpha: 0.14),
              shape:  .circle,
            ),
            alignment: .center,
            child: Text(
              '${item.count}',
              style: TextStyle(
                color:      item.color,
                fontSize:   13,
                fontWeight: FontWeight.w700,
                height:     1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Data model ───────────────────────────────────────────────────────────────

class _AlertItem {
  final String title;
  final String subtitle;
  final int    count;
  final Color  color;

  const _AlertItem({
    required this.title,
    required this.subtitle,
    required this.count,
    required this.color,
  });
}
