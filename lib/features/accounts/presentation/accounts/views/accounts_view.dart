import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mantic_erp_app/features/dashboard/presentation/widgets/dashboard_widgets.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AccountsBloc>(),
      child: const _AccountsBody(),
    );
  }
}

// ─── Data ─────────────────────────────────────────────────────────────────────

enum _CustomerStatus { actionRequired, partial }

enum _TileAction { addReceipt, postponeInvoice }

class _CustomerRow {
  final String initials;
  final String name;
  final String city;
  final String invoiceNo;
  final String date;
  final String paid;
  final String total;
  final _CustomerStatus status;

  const _CustomerRow({
    required this.initials,
    required this.name,
    required this.city,
    required this.invoiceNo,
    required this.date,
    required this.paid,
    required this.total,
    required this.status,
  });
}

// ─── Body ─────────────────────────────────────────────────────────────────────

class _AccountsBody extends StatefulWidget {
  const _AccountsBody();

  @override
  State<_AccountsBody> createState() => _AccountsBodyState();
}

class _AccountsBodyState extends State<_AccountsBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entryCtrl;
  late final List<Animation<double>> _fades;
  late final List<Animation<Offset>> _slides;

  static const _offscreen = Offset(0, 0.06);

  static const _items = <OverviewItem>[
    OverviewItem(
      label: AppConstants.totalReceivedTodayLabel,
      icon: Icons.monetization_on_outlined,
      color: Color(0xFF4CAF50),
    ),
    OverviewItem(
      label: AppConstants.totalPostponeLabel,
      icon: Icons.attach_money_rounded,
      color: Color(0xFFE53935),
    ),
    OverviewItem(
      label: AppConstants.totalDueTodayLabel,
      icon: Icons.credit_card_outlined,
      color: Color(0xFFFF9800),
    ),
  ];

  static const _rows = <_CustomerRow>[
    _CustomerRow(
      initials: 'HT',
      name: 'HR Trader & Comission',
      city: 'Bahawalpur',
      invoiceNo: 'SI-0370',
      date: '01 Jul 2025',
      paid: '0.00',
      total: '98,750',
      status: _CustomerStatus.actionRequired,
    ),
    _CustomerRow(
      initials: 'PI',
      name: 'Pepsico Int',
      city: 'Lahore',
      invoiceNo: 'SI-0002',
      date: '02 Jul 2025',
      paid: '0.00',
      total: '1,683,588',
      status: _CustomerStatus.actionRequired,
    ),
    _CustomerRow(
      initials: 'NK',
      name: 'Nawab Khan',
      city: 'Peshawar',
      invoiceNo: 'SI-0004',
      date: '03 Jul 2025',
      paid: '0.00',
      total: '2,765,000',
      status: _CustomerStatus.actionRequired,
    ),
    _CustomerRow(
      initials: 'HR',
      name: 'Hilal Retail Brands Pvt Ltd',
      city: 'Lahore',
      invoiceNo: 'SI-0006',
      date: '04 Jul 2025',
      paid: '37,878',
      total: '120,000',
      status: _CustomerStatus.partial,
    ),
    _CustomerRow(
      initials: 'AM',
      name: 'Al-Madina Traders',
      city: 'Karachi',
      invoiceNo: 'SI-0010',
      date: '05 Jul 2025',
      paid: '0.00',
      total: '540,000',
      status: _CustomerStatus.actionRequired,
    ),
    _CustomerRow(
      initials: 'ZB',
      name: 'Zafar Brothers',
      city: 'Multan',
      invoiceNo: 'SI-0014',
      date: '06 Jul 2025',
      paid: '15,000',
      total: '75,000',
      status: _CustomerStatus.partial,
    ),
  ];

  Animation<double> _fade(double start, double end) => CurvedAnimation(
    parent: _entryCtrl,
    curve: Interval(start, end, curve: Curves.easeOut),
  );

  Animation<Offset> _slide(double start, double end) =>
      Tween<Offset>(begin: _offscreen, end: Offset.zero).animate(
        CurvedAnimation(
          parent: _entryCtrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void initState() {
    super.initState();
    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fades = [
      _fade(0.00, 0.45), // section header
      _fade(0.15, 0.55), // stat cards
      _fade(0.30, 0.65), // divider + list section
      _fade(0.50, 0.90), // quick actions
    ];
    _slides = [
      _slide(0.00, 0.45),
      _slide(0.15, 0.55),
      _slide(0.30, 0.65),
      _slide(0.50, 0.90),
    ];
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountsBloc, AccountsState>(
      listenWhen: (prev, curr) => prev.apiStatus != curr.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(
            context,
            AppConstants.successSuccessMsg,
          );
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: UnfocusWrapper(
        child: Scaffold(
          appBar: CustomAppBar(title: AppConstants.accountsLabel),
          body: SingleChildScrollView(
            padding: context.pagePadding,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                FadeTransition(
                  opacity: _fades[0],
                  child: SlideTransition(
                    position: _slides[0],
                    child: BlocBuilder<AccountsBloc, AccountsState>(
                      buildWhen: (prev, curr) =>
                          prev.todayOverviewExpanded !=
                          curr.todayOverviewExpanded,
                      builder: (context, state) => SectionHeader(
                        title: AppConstants.recoveryDueTodayTitle,
                        trailing: context.isPhone
                            ? GestureDetector(
                                onTap: () => context.read<AccountsBloc>().add(
                                  const TodayOverviewExpansionToggled(),
                                ),
                                child: Row(
                                  mainAxisSize: .min,
                                  children: [
                                    Text(
                                      state.todayOverviewExpanded
                                          ? AppConstants.hideDetails
                                          : AppConstants.showDetails,
                                      style: context.labelMedium.copyWith(
                                        color: context.primary,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    AnimatedRotation(
                                      turns: state.todayOverviewExpanded
                                          ? 0.5
                                          : 0,
                                      duration: const Duration(
                                        milliseconds: 380,
                                      ),
                                      curve: Curves.easeInOutCubic,
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: context.primary,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FadeTransition(
                  opacity: _fades[1],
                  child: SlideTransition(
                    position: _slides[1],
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OverviewStatCard(
                                label: _items[0].label,
                                value: 'Rs 318,073',
                                icon: _items[0].icon,
                                color: _items[0].color,
                              ),
                            ),
                            SizedBox(width: context.gridSpacing),
                            Expanded(
                              child: OverviewStatCard(
                                label: _items[1].label,
                                value: 'Rs 318,073',
                                icon: _items[1].icon,
                                color: _items[1].color,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: context.gridSpacing),
                        OverviewStatCard(
                          label: _items[2].label,
                          value: 'Rs 318,073,375.57',
                          icon: _items[2].icon,
                          color: _items[2].color,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                FadeTransition(
                  opacity: _fades[2],
                  child: SlideTransition(
                    position: _slides[2],
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFEDEDED),
                        ),
                        const SizedBox(height: 14),
                        BlocBuilder<AccountsBloc, AccountsState>(
                          buildWhen: (prev, curr) =>
                              prev.todayOverviewExpanded !=
                              curr.todayOverviewExpanded,
                          builder: (context, state) => AnimatedSize(
                            duration: const Duration(milliseconds: 420),
                            curve: Curves.easeInOutCubic,
                            alignment: .topCenter,
                            child: state.todayOverviewExpanded
                                ? _ExpandedListSection(rows: _rows)
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // [3] ── Quick actions ────────────────────────────────────────
                FadeTransition(
                  opacity: _fades[3],
                  child: SlideTransition(
                    position: _slides[3],
                    child: const _AccountsQuickActions(),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Expanded list section ────────────────────────────────────────────────────
// Extracted so AnimatedSize only recreates this subtree, not the whole body.
class _ExpandedListSection extends StatelessWidget {
  final List<_CustomerRow> rows;
  const _ExpandedListSection({required this.rows});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Recovery progress',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                      Text(
                        '0%',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: .circular(4),
                    child: LinearProgressIndicator(
                      value: 0,
                      minHeight: 5,
                      backgroundColor: const Color(0xFFEDEDED),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        context.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Filter tabs — rebuild only when selectedFilter changes
            BlocBuilder<AccountsBloc, AccountsState>(
              buildWhen: (prev, curr) =>
                  prev.selectedFilter != curr.selectedFilter,
              builder: (context, state) => Row(
                children: [
                  _FilterTab(
                    label: 'Today',
                    selected: state.selectedFilter == FilterType.today,
                    onTap: () => context.read<AccountsBloc>().add(
                      const RecoveryFilterChanged(FilterType.today),
                    ),
                  ),
                  const SizedBox(width: 6),
                  _FilterTab(
                    label: 'Oldest',
                    selected: state.selectedFilter == FilterType.oldest,
                    onTap: () => context.read<AccountsBloc>().add(
                      const RecoveryFilterChanged(FilterType.oldest),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: rows.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) => _CustomerTile(row: rows[index]),
          ),
        ),
      ],
    );
  }
}

// ─── Customer list tile ───────────────────────────────────────────────────────

class _CustomerTile extends StatelessWidget {
  final _CustomerRow row;
  const _CustomerTile({required this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: const Color(0xFFEDEDED)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: context.primary.withValues(alpha: 0.12),
                child: Text(
                  row.initials,
                  style: context.labelMedium.copyWith(
                    color: context.primary,
                    fontWeight: .w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      row.name,
                      style: context.bodySmall.copyWith(
                        fontWeight: .w700,
                        color: context.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      row.city,
                      style: context.labelSmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _StatusBadge(status: row.status),
              if (row.status == _CustomerStatus.actionRequired) ...[
                const SizedBox(width: 2),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: PopupMenuButton<_TileAction>(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: context.textSecondary,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                    onSelected: (action) {
                      // TODO: wire up actions
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: _TileAction.addReceipt,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.receipt_long_outlined,
                              size: 16,
                              color: context.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Add Receipt',
                              style: context.bodySmall.copyWith(
                                color: context.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(height: 1),
                      PopupMenuItem(
                        value: _TileAction.postponeInvoice,
                        height: 40,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.schedule_outlined,
                              size: 16,
                              color: Color(0xFFFF9800),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Postpone Invoice',
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
          const SizedBox(height: 5),
          Row(
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    row.invoiceNo,
                    style: context.labelSmall.copyWith(
                      color: context.primary,
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    row.date,
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: .end,
                children: [
                  Text(
                    'Rs ${row.paid}',
                    style: context.labelMedium.copyWith(
                      color: context.primary,
                      fontWeight: .w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'of Rs ${row.total}',
                    style: context.labelSmall.copyWith(
                      color: context.textSecondary,
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

// ─── Filter tab ───────────────────────────────────────────────────────────────

class _FilterTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: .symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? context.primary : Colors.transparent,
          borderRadius: .circular(20),
          border: Border.all(
            color: selected ? context.primary : const Color(0xFFDDDDDD),
          ),
        ),
        child: Text(
          label,
          style: context.labelSmall.copyWith(
            color: selected ? Colors.white : context.textSecondary,
            fontWeight: .w600,
          ),
        ),
      ),
    );
  }
}

// ─── Status badge ─────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final _CustomerStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final isAction = status == _CustomerStatus.actionRequired;
    final color = isAction ? const Color(0xFFFF9800) : const Color(0xFF4CAF50);
    final label = isAction ? 'Action req.' : 'Partial';
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

// ─── Accounts quick actions ───────────────────────────────────────────────────

class _AccountsQuickActions extends StatefulWidget {
  const _AccountsQuickActions();

  @override
  State<_AccountsQuickActions> createState() => _AccountsQuickActionsState();
}

class _AccountsQuickActionsState extends State<_AccountsQuickActions> {
  static const _items = <_QAItem>[
    _QAItem(
      label: AppConstants.accountStatementsLabel,
      icon: Iconsax.document_text,
      color: Color(0xFF1B84FF),
    ),
    _QAItem(
      label: AppConstants.partyStatementsLabel,
      icon: Iconsax.people,
      color: Color(0xFF9C27B0),
    ),
    _QAItem(
      label: AppConstants.bankCashPositionLabel,
      icon: Iconsax.bank,
      color: Color(0xFF00897B),
    ),
    _QAItem(
      label: AppConstants.cashbookLabel,
      icon: Iconsax.book,
      color: Color(0xFF4CAF50),
    ),
    _QAItem(
      label: AppConstants.creditManagementLabel,
      icon: Iconsax.card,
      color: Color(0xFFE53935),
    ),
    _QAItem(
      label: AppConstants.customerReceivableLabel,
      icon: Iconsax.receive_square,
      color: Color(0xFFFF9800),
    ),
    _QAItem(
      label: AppConstants.vendorPayableLabel,
      icon: Iconsax.send_square,
      color: Color(0xFF546E7A),
    ),
  ];

  static const _itemsPerPage = 6;
  final _pageController = PageController();
  int _currentPage = 0;

  int get _pageCount => (_items.length / _itemsPerPage).ceil();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.value<double>(
      context,
      phone: 100,
      tablet: 116,
      ipad: 130,
    );
    final spacing = context.gridSpacing;
    final pageHeight = 2 * cardHeight + spacing;

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SectionHeader(title: AppConstants.quickActionsTitle),
        const SizedBox(height: 10),
        SizedBox(
          height: pageHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _pageCount,
            onPageChanged: (p) => setState(() => _currentPage = p),
            itemBuilder: (context, pageIndex) {
              final start = pageIndex * _itemsPerPage;
              final end = (start + _itemsPerPage).clamp(0, _items.length);
              final pageItems = _items.sublist(start, end);
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pageItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: cardHeight,
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                ),
                itemBuilder: (_, i) => _QACard(item: pageItems[i]),
              );
            },
          ),
        ),
        if (_pageCount > 1) ...[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: .center,
            children: List.generate(
              _pageCount,
              (i) => _QADot(active: i == _currentPage),
            ),
          ),
        ],
      ],
    );
  }
}

class _QACard extends StatelessWidget {
  final _QAItem item;
  const _QACard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: .circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: 0.10),
          borderRadius: .circular(10),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: .circle,
                boxShadow: [
                  BoxShadow(
                    color: item.color.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(item.icon, color: item.color, size: 18),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: .symmetric(horizontal: 4),
              child: Text(
                item.label,
                style: context.labelSmall.copyWith(
                  color: item.color,
                  fontWeight: .w600,
                  fontSize: 10,
                ),
                textAlign: .center,
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QADot extends StatelessWidget {
  final bool active;
  const _QADot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: .symmetric(horizontal: 3),
      width: active ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? context.primary : context.grey300,
        borderRadius: .circular(3),
      ),
    );
  }
}

class _QAItem {
  final String label;
  final IconData icon;
  final Color color;
  const _QAItem({required this.label, required this.icon, required this.color});
}
