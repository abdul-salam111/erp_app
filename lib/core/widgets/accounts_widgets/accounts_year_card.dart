import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/const_exports.dart';
import '../../theme/theme_exports.dart';
import '../../utils/utils_exports.dart';
import '../../../features/accounts/domain/entities/shared/ledger_entry_base.dart';
import '../glass_surface.dart';

typedef AccountsLedgerGroup = ({String type, List<LedgerEntryBase> entries});

class AccountsYearCard extends StatefulWidget {
  final String finYearName;
  final double balance;
  final double ttlDebit;
  final double ttlCredit;
  final List<AccountsLedgerGroup> groups;
  final Widget Function(LedgerEntryBase) rowBuilder;
  final ScrollController? scrollController;

  const AccountsYearCard({
    super.key,
    required this.finYearName,
    required this.balance,
    required this.ttlDebit,
    required this.ttlCredit,
    required this.groups,
    required this.rowBuilder,
    this.scrollController,
  });

  @override
  State<AccountsYearCard> createState() => _AccountsYearCardState();
}

class _AccountsYearCardState extends State<AccountsYearCard> {
  int _visibleCount = _pageSize;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrollController = widget.scrollController;
    if (scrollController == null || !scrollController.hasClients) return;
    if (scrollController.position.extentAfter < 300) {
      final total = _flatEntries.length;
      if (_visibleCount < total) {
        setState(
          () => _visibleCount = (_visibleCount + _pageSize).clamp(0, total),
        );
      }
    }
  }

  List<_PagedEntry> get _flatEntries {
    final result = <_PagedEntry>[];
    for (final ledgerGroup in widget.groups) {
      for (final ledgerEntry in ledgerGroup.entries) {
        result.add(_PagedEntry(type: ledgerGroup.type, entry: ledgerEntry));
      }
    }
    return result;
  }

  List<Widget> _buildPagedRows(
    List<_PagedEntry> entries,
    BuildContext context,
  ) {
    final rows = <Widget>[];
    String? lastType;
    for (final pagedEntry in entries) {
      if (pagedEntry.type != lastType) {
        lastType = pagedEntry.type;
        if (pagedEntry.type.isNotEmpty) {
          rows.add(
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: context.isDark ? context.navyIconBg : context.surface,
                border: Border(
                  top: BorderSide(
                    color: context.isDark ? context.navyBorder : context.border,
                  ),
                ),
              ),
              child: Text(
                pagedEntry.type.toUpperCase(),
                style: context.labelSmall.copyWith(
                  fontWeight: .w600,
                  color: context.textSecondary,
                  fontSize: 10,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          );
        }
      }
      rows.add(widget.rowBuilder(pagedEntry.entry));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final allEntries = _flatEntries;
    final hasContent = allEntries.isNotEmpty;
    final visibleEntries = allEntries.take(_visibleCount).toList();

    return GlassSurface(
      radius: 10,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.isDark ? context.navyBorder : context.border,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                if (widget.finYearName.trim().isNotEmpty) ...[
                  Text(
                    widget.finYearName,
                    style: context.bodySmall.copyWith(
                      fontWeight: .w600,
                      color: context.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                _BalanceHero(
                  amount: widget.balance.abs().formatPrice(),
                  suffix: widget.balance >= 0
                      ? AppConstants.dr
                      : AppConstants.cr,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _TotalStatTile(
                        label: AppConstants.debit,
                        amount: widget.ttlDebit.formatPrice(),
                        accent: context.debitColor,
                        icon: Iconsax.arrow_up_3,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _TotalStatTile(
                        label: AppConstants.credit,
                        amount: widget.ttlCredit.formatPrice(),
                        accent: context.creditColor,
                        icon: Iconsax.arrow_down,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          hasContent
              ? Column(
                  crossAxisAlignment: .start,
                  children: _buildPagedRows(visibleEntries, context),
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    AppConstants.noLedgerDataAvailable,
                    style: context.bodySmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class _PagedEntry {
  final String type;
  final LedgerEntryBase entry;
  const _PagedEntry({required this.type, required this.entry});
}

class _BalanceHero extends StatelessWidget {
  final String amount;
  final String suffix;

  const _BalanceHero({required this.amount, required this.suffix});

  @override
  Widget build(BuildContext context) {
    final accent = context.primary;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: .circular(12),
        gradient: LinearGradient(
          begin: .centerLeft,
          end: .centerRight,
          colors: [
            accent.withValues(alpha: 0.14),
            accent.withValues(alpha: 0.04),
          ],
        ),
        border: .all(color: accent.withValues(alpha: 0.20), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: .circle,
              gradient: RadialGradient(
                colors: [
                  accent.withValues(alpha: 0.32),
                  accent.withValues(alpha: 0.08),
                ],
              ),
            ),
            child: Icon(Iconsax.wallet_3, color: accent, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  AppConstants.balanceLabel.toUpperCase(),
                  style: context.labelSmall.copyWith(
                    color: context.textSecondary,
                    fontWeight: .w700,
                    fontSize: 10,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  amount,
                  style: context.titleMedium.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w800,
                    fontSize: 20,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: .circular(999),
              color: accent.withValues(alpha: 0.16),
              border: .all(color: accent.withValues(alpha: 0.24)),
            ),
            child: Text(
              suffix,
              style: context.labelSmall.copyWith(
                color: accent,
                fontWeight: .w700,
                fontSize: 11,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalStatTile extends StatelessWidget {
  final String label;
  final String amount;
  final Color accent;
  final IconData icon;

  const _TotalStatTile({
    required this.label,
    required this.amount,
    required this.accent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(10),
          border: .all(color: accent.withValues(alpha: 0.12)),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(height: 2, color: accent.withValues(alpha: 0.55)),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: .circle,
                      gradient: RadialGradient(
                        colors: [
                          accent.withValues(alpha: 0.28),
                          accent.withValues(alpha: 0.06),
                        ],
                      ),
                    ),
                    child: Icon(icon, color: accent, size: 15),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text(
                          label.toUpperCase(),
                          style: context.labelSmall.copyWith(
                            color: context.textSecondary,
                            fontWeight: .w700,
                            fontSize: 9.5,
                            letterSpacing: 0.7,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          amount,
                          style: context.bodySmall.copyWith(
                            color: context.textPrimary,
                            fontWeight: .w800,
                            fontSize: 13.5,
                            height: 1,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
