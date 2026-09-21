import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/accounts/recovery_invoice_entity.dart';
import '../blocs/accounts_bloc.dart';
import '../blocs/accounts_event.dart';
import '../blocs/accounts_state.dart';
import 'accounts_models.dart';


// ─── Search bar (stays fixed while the list below scrolls) ─────────────────────

class RecoverySearchBar extends StatefulWidget {
  const RecoverySearchBar({super.key});

  @override
  State<RecoverySearchBar> createState() => _RecoverySearchBarState();
}

class _RecoverySearchBarState extends State<RecoverySearchBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountsBloc, AccountsState>(
      listenWhen: (p, c) => p.selectedFilter != c.selectedFilter,
      listener: (_, __) {
        _searchController.clear();
        context.read<AccountsBloc>().add(const RecoverySearchChanged(''));
      },
      child: BlocBuilder<AccountsBloc, AccountsState>(
        buildWhen: (p, c) => p.recoveryDueStatus != c.recoveryDueStatus,
        builder: (context, state) {
          final isLoading =
              state.recoveryDueStatus == ApiStatus.INITIAL ||
              state.recoveryDueStatus == ApiStatus.LOADING;
          if (isLoading) {
            return ShimmerBox(
              height: 46,
              radius: 10,
              baseColor: context.isDark ? context.navyIconBg : null,
              highlightColor: context.isDark ? context.navyCard : null,
            );
          }

          return StatefulBuilder(
            builder: (context, setLocal) => Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: context.isDark ? context.navyIconBg : context.surface,
                borderRadius: .circular(10),
                border: Border.all(
                  color: context.isDark ? context.navyBorder : context.border,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(
                    Icons.search_rounded,
                    size: 20,
                    color: context.textSecondary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (val) {
                        setLocal(() {});
                        context
                            .read<AccountsBloc>()
                            .add(RecoverySearchChanged(val));
                      },
                      style: context.bodySmall.copyWith(
                        color: context.textPrimary,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: false,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search by name or invoice…',
                        hintStyle: context.bodySmall.copyWith(
                          color: context.textSecondary,
                        ),
                        contentPadding: const EdgeInsets.only(bottom: 2),
                      ),
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        setLocal(() {});
                        context
                            .read<AccountsBloc>()
                            .add(const RecoverySearchChanged(''));
                      },
                      child: Padding(
                        padding: .symmetric(horizontal: 8),
                        child: Icon(
                          Icons.close_rounded,
                          size: 16,
                          color: context.textSecondary,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Invoice list (paged) — the scrollable part ─────────────────────────────────

class RecoveryInvoiceList extends StatelessWidget {
  const RecoveryInvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsBloc, AccountsState>(
      buildWhen: (p, c) =>
          p.recoveryDueStatus != c.recoveryDueStatus ||
          p.recoveryDue != c.recoveryDue ||
          p.currentPage != c.currentPage ||
          p.searchQuery != c.searchQuery,
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
                child: ShimmerBox(
                  height: 82,
                  radius: 10,
                  baseColor: context.isDark ? context.navyIconBg : null,
                  highlightColor: context.isDark ? context.navyCard : null,
                ),
              ),
            ),
          );
        }

        final allInvoices = state.recoveryDue?.invoices ?? const [];

        if (allInvoices.isEmpty) {
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

        final filtered = state.filteredInvoices;

        if (filtered.isEmpty) {
          return Center(
            child: Padding(
              padding: .symmetric(vertical: 24),
              child: Text(
                'No results for "${state.searchQuery}"',
                style: context.bodySmall.copyWith(
                  color: context.textSecondary,
                ),
              ),
            ),
          );
        }

        final paged = state.pagedInvoices;
        final total = filtered.length;
        final start = state.currentPage * AccountsState.pageSize + 1;
        final end   = (start + paged.length - 1).clamp(1, total);

        return Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: context.isDark
                      ? AppColors.white.withValues(alpha: 0.05)
                      : context.accentBlue.withValues(alpha: 0.06),
                  borderRadius: .circular(20),
                  border: Border.all(
                    color: context.isDark
                        ? AppColors.white.withValues(alpha: 0.08)
                        : context.accentBlue.withValues(alpha: 0.15),
                  ),
                ),
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    Icon(
                      Icons.list_alt_rounded,
                      size: 12,
                      color: context.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$start–$end of $total',
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                        fontWeight: .w600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paged.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  _CustomerTile(invoice: paged[index]),
            ),
            const _PaginationBar(),
          ],
        );
      },
    );
  }
}

// ─── Pagination bar ───────────────────────────────────────────────────────────

class _PaginationBar extends StatelessWidget {
  const _PaginationBar();

  /// Returns a list where `int` = page index (0-based) and `null` = ellipsis.
  /// Window is ±1 around current so max visible chips = 5 (first, …, prev, cur, next, …, last).
  static List<int?> _buildItems(int current, int total) {
    if (total <= 5) return List.generate(total, (i) => i);

    final show = <int>{0, total - 1};
    for (var i = (current - 1).clamp(0, total - 1);
        i <= (current + 1).clamp(0, total - 1);
        i++) {
      show.add(i);
    }

    final sorted = show.toList()..sort();
    final result = <int?>[];
    int prev = -1;
    for (final p in sorted) {
      if (prev != -1 && p - prev > 1) result.add(null);
      result.add(p);
      prev = p;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsBloc, AccountsState>(
      buildWhen: (p, c) =>
          p.currentPage != c.currentPage || p.recoveryDue != c.recoveryDue,
      builder: (context, state) {
        final total   = state.totalPages;
        final current = state.currentPage;
        if (total <= 1) return const SizedBox.shrink();

        final items = _buildItems(current, total);

        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: .center,
              mainAxisSize: .min,
              children: [
                _NavButton(
                  icon: Icons.chevron_left_rounded,
                  enabled: current > 0,
                  onTap: () => context
                      .read<AccountsBloc>()
                      .add(RecoveryPageChanged(current - 1)),
                ),
                const SizedBox(width: 4),
                ...items.map(
                  (item) => item == null
                      ? const _EllipsisChip()
                      : _PageChip(
                          page: item,
                          isSelected: item == current,
                          onTap: () => context
                              .read<AccountsBloc>()
                              .add(RecoveryPageChanged(item)),
                        ),
                ),
                const SizedBox(width: 4),
                _NavButton(
                  icon: Icons.chevron_right_rounded,
                  enabled: current < total - 1,
                  onTap: () => context
                      .read<AccountsBloc>()
                      .add(RecoveryPageChanged(current + 1)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PageChip extends StatelessWidget {
  const _PageChip({
    required this.page,
    required this.isSelected,
    required this.onTap,
  });

  final int page;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? context.accentBlue : AppColors.transparent,
          borderRadius: .circular(8),
          border: Border.all(
            color: isSelected ? context.accentBlue : context.border,
            width: isSelected ? 0 : 1,
          ),
        ),
        child: Center(
          child: Text(
            '${page + 1}',
            style: context.labelSmall.copyWith(
              color: isSelected ? context.whiteText : context.textSecondary,
              fontWeight: isSelected ? .w700 : .w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _EllipsisChip extends StatelessWidget {
  const _EllipsisChip();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 32,
      child: Center(
        child: Text(
          '…',
          style: context.labelSmall.copyWith(color: context.textSecondary),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool     enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = enabled ? context.primary : context.textDisabled;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: .circular(8),
          border: Border.all(color: enabled ? context.primary : context.border),
          color: enabled
              ? context.primary.withValues(alpha: 0.06)
              : AppColors.transparent,
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}

// ─── Customer tile ────────────────────────────────────────────────────────────

class _CustomerTile extends StatelessWidget {
  final RecoveryInvoiceEntity invoice;
  const _CustomerTile({required this.invoice});

  CustomerStatus get _status {
    return invoice.status.trim().toLowerCase().contains('partial')
        ? CustomerStatus.partial
        : CustomerStatus.actionRequired;
  }

  @override
  Widget build(BuildContext context) {
    final remaining = invoice.remainingAmount;
    final total = invoice.docAmount;

    return GlassSurface(
      radius: 12,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: .circle,
                  gradient: RadialGradient(
                    colors: [
                      context.accentBlue.withValues(alpha: 0.32),
                      context.accentBlue.withValues(alpha: 0.08),
                    ],
                  ),
                ),
                alignment: .center,
                child: Text(
                  invoice.initials,
                  style: context.labelMedium.copyWith(
                    color: context.accentBlue,
                    fontWeight: .w700,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      invoice.party.fullName,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    if (invoice.party.locationName.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 11,
                            color: context.textSecondary,
                          ),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              invoice.party.locationName,
                              style: context.labelSmall.copyWith(
                                color: context.textSecondary,
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
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
                              color: context.accentBlue,
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
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: .end,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    invoice.docNbr,
                    style: context.labelSmall.copyWith(
                      color: context.accentBlue,
                      fontWeight: .w600,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    invoice.docDate,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10.5,
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
                      color: context.accentBlue,
                      fontWeight: .w700,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'of Rs ${total.formatPrice()}',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                      fontSize: 10.5,
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
