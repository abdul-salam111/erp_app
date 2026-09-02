import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../routes/route_names.dart';
import '../../../domain/entities/cost_item_entity.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/entities/production_entry_entity.dart';
import '../controllers/partah_calculator.dart';
import 'steps/cost_step.dart';
import 'steps/purchase_step.dart';
import 'steps/sale_step.dart';
import 'steps/summary_step.dart';
import '../blocs/partah_bloc.dart';
import '../blocs/partah_event.dart';
import '../blocs/partah_state.dart';

class PartahView extends StatelessWidget {
  const PartahView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PartahBloc>()..add(PartahStarted()),
      child: const _PartahBody(),
    );
  }
}

class _PartahBody extends StatelessWidget {
  const _PartahBody();

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        backgroundColor: context.background,
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: 'Partah'),
        body: BlocBuilder<PartahBloc, PartahState>(
          builder: (context, state) {
            if (state.loadStatus == ApiStatus.LOADING || state.loadStatus == ApiStatus.INITIAL) {
              return const _PartahShimmer();
            }
            if (state.loadStatus == ApiStatus.FAILURE) {
              return ErrorStateWidget(
                message: state.errorMessage,
                onRetry: () => context.read<PartahBloc>().add(PartahStarted()),
              );
            }
            if (!state.isSetupComplete) {
              return _SetupRequiredState(
                onSetup: () async {
                  await context.pushNamed(RouteNames.manage_products);
                  if (context.mounted) context.read<PartahBloc>().add(PartahStarted());
                },
              );
            }
            return _PartahCalculatorScope(
              templates: state.productTemplates,
              lastVariableCosts: state.lastVariableCosts,
              lastFixedCosts: state.lastFixedCosts,
              lastEntries: state.lastProductionEntries,
            );
          },
        ),
      ),
    );
  }
}

// ─── Setup Required State ──────────────────────────────────────────────────
//
// Shown when the mill type hasn't been chosen and/or no product templates
// have been saved yet — the calculator can't compute anything without both.

class _SetupRequiredState extends StatelessWidget {
  final VoidCallback onSetup;
  const _SetupRequiredState({required this.onSetup});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.inventory_2_outlined,
      title: 'Set Up Your Mill First',
      subtitle: 'Select your mill type and add your product list before using Partah.',
      action: SizedBox(
        width: 220,
        child: CustomButton(
          text: 'Set Up Products',
          icon: Icons.arrow_forward_rounded,
          onPressed: onSetup,
        ),
      ),
    );
  }
}

// ─── Calculator Scope — owns the PartahCalculator across bloc rebuilds ───────

class _PartahCalculatorScope extends StatefulWidget {
  final List<ProductTemplateEntity> templates;
  final List<CostItemEntity> lastVariableCosts;
  final List<CostItemEntity> lastFixedCosts;
  final List<ProductionEntryEntity> lastEntries;

  const _PartahCalculatorScope({
    required this.templates,
    required this.lastVariableCosts,
    required this.lastFixedCosts,
    required this.lastEntries,
  });

  @override
  State<_PartahCalculatorScope> createState() => _PartahCalculatorScopeState();
}

class _PartahCalculatorScopeState extends State<_PartahCalculatorScope> {
  late final PartahCalculator calculator = PartahCalculator(
    templates: widget.templates,
    lastVariableCosts: widget.lastVariableCosts,
    lastFixedCosts: widget.lastFixedCosts,
    lastEntries: widget.lastEntries,
  );

  @override
  void didUpdateWidget(covariant _PartahCalculatorScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.templates, widget.templates)) {
      calculator.reloadRows(widget.templates);
    }
  }

  @override
  void dispose() {
    calculator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PartahBloc, PartahState>(
      listenWhen: (p, n) => p.saveStatus != n.saveStatus,
      listener: (context, state) {
        if (state.saveStatus == ApiStatus.SUCCESS) {
          calculator.clearSavedSession();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => _SaveSuccessDialog(calculator: calculator),
          );
        }
        if (state.saveStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.errorMessage ?? 'Could not save report');
        }
      },
      child: ListenableBuilder(
        listenable: calculator,
        builder: (context, _) {
          final step = calculator.currentStep;
          return Column(
            children: [
              _StepIndicator(
                currentStep: step,
                onStepTapped: (idx) {
                  final yieldReady = (calculator.totalSaleYield100kg - 100).abs() < 0.01;
                  if (idx > 0 && !yieldReady) return;
                  calculator.goToStep(idx);
                },
              ),
              IndexedStack(
                index: step,
                children: [
                  SaleStep(
                    calculator: calculator,
                    onEditProducts: () async {
                      await context.pushNamed(RouteNames.manage_products);
                      if (context.mounted) context.read<PartahBloc>().add(PartahStarted());
                    },
                  ),
                  PurchaseStep(calculator: calculator),
                  CostsStep(calculator: calculator),
                  SummaryStep(calculator: calculator),
                ],
              ).expanded(),
              if (step != 3) _FinancialFooter(calculator: calculator),
              if (step == 3) _StepNavigation(calculator: calculator),
            ],
          );
        },
      ),
    );
  }
}

// ─── Step Indicator ───────────────────────────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  final void Function(int) onStepTapped;
  const _StepIndicator({required this.currentStep, required this.onStepTapped});

  static const _steps = [
    (icon: Icons.sell_outlined, label: 'Sale'),
    (icon: Icons.shopping_bag_outlined, label: 'Purchase'),
    (icon: Icons.tune_rounded, label: 'Costs'),
    (icon: Icons.bar_chart_rounded, label: 'Summary'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.surface,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Row(
        children: List.generate(_steps.length * 2 - 1, (i) {
          if (i.isOdd) {
            final done = i ~/ 2 < currentStep;
            return Container(
              height: 2,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: done ? context.primary : context.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ).expanded();
          }
          final idx = i ~/ 2;
          final s = _steps[idx];
          final isActive = idx == currentStep;
          final isDone = idx < currentStep;
          return _StepDot(
            icon: s.icon,
            label: s.label,
            isActive: isActive,
            isDone: isDone,
            onTap: () => onStepTapped(idx),
          );
        }),
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isDone;
  final VoidCallback onTap;

  const _StepDot({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.isDone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isDone
        ? context.success
        : isActive
            ? context.primary
            : context.border;
    final iconColor = isDone || isActive ? Colors.white : context.textSecondary;

    return Column(
      mainAxisSize: .min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: bg,
            shape: .circle,
            boxShadow: isActive
                ? [
                    BoxShadow(color: context.primary.withAlpha(60), blurRadius: 8, offset: const Offset(0, 3)),
                  ]
                : null,
          ),
          child: isDone
              ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
              : Icon(icon, size: 16, color: iconColor),
        ),
        heightBox(5),
        Text(
          label,
          style: context.labelSmall.copyWith(
            fontSize: 9,
            color: isActive ? context.primary : context.textSecondary,
            fontWeight: isActive ? .w700 : .w500,
          ),
        ),
      ],
    ).onTap(onTap);
  }
}

// ─── Financial Footer ─────────────────────────────────────────────────────────

class _FinancialFooter extends StatelessWidget {
  final PartahCalculator calculator;
  const _FinancialFooter({required this.calculator});

  @override
  Widget build(BuildContext context) {
    final profitPer100 = calculator.profitPer100;
    final netProfit = calculator.totalNetProfit;
    final bag = calculator.totalInput.asBagWeight;
    final yieldReady = (calculator.totalSaleYield100kg - 100).abs() < 0.01;

    String fmt(double v) => (!yieldReady || v == 0) ? '–' : v.abs().asAmount;

    final profitColor = !yieldReady
        ? context.textDisabled
        : profitPer100 >= 0
            ? context.success
            : context.error;

    final profitLabel = profitPer100 < 0 ? 'Loss / $bag Kg' : 'Profit / $bag Kg';
    final netLabel = netProfit < 0 ? 'Net Loss' : 'Net Profit';

    return Container(
      decoration: BoxDecoration(
        color: Color.alphaBlend(context.primary.withAlpha(12), context.surface),
        border: Border(top: BorderSide(color: context.primary.withAlpha(40), width: 1.5)),
        boxShadow: [
          BoxShadow(color: context.primary.withAlpha(14), blurRadius: 16, offset: const Offset(0, -3)),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 15),
      child: Row(
        children: [
          _FooterMetric(
            label: yieldReady ? profitLabel : 'Profit / $bag Kg',
            value: fmt(profitPer100),
            color: profitColor,
          ).expanded(),
          Container(width: 1, height: 42, color: context.border),
          _FooterMetric(
            label: yieldReady ? netLabel : 'Net Profit',
            value: fmt(netProfit),
            color: profitColor,
            highlight: true,
          ).expanded(),
        ],
      ),
    );
  }
}

class _FooterMetric extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final bool highlight;

  const _FooterMetric({required this.label, required this.value, required this.color, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Text(
          label,
          style: context.labelSmall.copyWith(fontSize: 10, color: context.textSecondary, fontWeight: .w600),
        ),
        heightBox(3),
        Text(
          value,
          style: context.titleSmall.copyWith(color: color, fontWeight: .w800, fontSize: highlight ? 22 : 19),
        ),
      ],
    );
  }
}

// ─── Step Navigation ──────────────────────────────────────────────────────────

class _StepNavigation extends StatelessWidget {
  final PartahCalculator calculator;
  const _StepNavigation({required this.calculator});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartahBloc, PartahState>(
      buildWhen: (p, n) => p.saveStatus != n.saveStatus,
      builder: (context, state) {
        final saving = state.saveStatus == ApiStatus.LOADING;
        return Container(
          color: Color.alphaBlend(context.primary.withAlpha(12), context.surface),
          padding: EdgeInsets.fromLTRB(16, 10, 16, 14 + MediaQuery.of(context).viewPadding.bottom),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: _NavBtn(
                  label: 'Back',
                  icon: Icons.arrow_back_rounded,
                  onTap: calculator.stepBack,
                  primary: false,
                  stretch: true,
                ),
              ),
              widthBox(10),
              Expanded(
                flex: 2,
                child: _NavBtn(
                  label: 'Home',
                  icon: Icons.home_rounded,
                  onTap: () async {
                    await calculator.clearSavedSession();
                    if (context.mounted) context.goNamed(RouteNames.partah_home);
                  },
                  primary: false,
                  stretch: true,
                ),
              ),
              widthBox(10),
              Expanded(
                flex: 3,
                child: _NavBtn(
                  label: saving ? 'Saving…' : 'Save',
                  icon: Icons.check_rounded,
                  onTap: saving
                      ? null
                      : () {
                          final error = calculator.validateForSave();
                          if (error != null) {
                            AppToastsUtils.showErrorTop(context, error);
                            return;
                          }
                          context.read<PartahBloc>().add(PartahRecordSaveRequested(calculator.buildRecord()));
                        },
                  primary: true,
                  iconOnRight: true,
                  stretch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Shimmer Skeleton ─────────────────────────────────────────────────────────

Widget _sBox({double? w, double? h, double r = 8}) => Container(
      width: w ?? double.infinity,
      height: h,
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(r)),
    );

class _PartahShimmer extends StatelessWidget {
  const _PartahShimmer();

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Column(
        children: [
          Container(
            color: context.surface,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              children: List.generate(7, (i) {
                if (i.isOdd) {
                  return _sBox(h: 2, r: 2).withMargin(const EdgeInsets.only(bottom: 20)).expanded();
                }
                return Column(
                  mainAxisSize: .min,
                  children: [_sBox(w: 34, h: 34, r: 17), heightBox(5), _sBox(w: 28, h: 8)],
                );
              }),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              children: [
                _sBox(w: 120, h: 14),
                heightBox(8),
                _sBox(h: 52, r: 12),
                heightBox(24),
                Row(
                  children: [
                    _sBox(w: 100, h: 12).expanded(),
                    _sBox(w: 60, h: 12),
                    widthBox(12),
                    _sBox(w: 60, h: 12),
                    widthBox(12),
                    _sBox(w: 60, h: 12),
                  ],
                ),
                heightBox(14),
                ...List.generate(5, (_) => _shimmerRow()),
              ],
            ),
          ),
          Container(
            color: context.surface,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Column(
              mainAxisSize: .min,
              children: [
                Row(children: [_footerMetric().expanded(), widthBox(12), _footerMetric().expanded()]),
                heightBox(8),
                Row(children: [_footerMetric().expanded(), widthBox(12), _footerMetric().expanded()]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerRow() => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            _sBox(h: 44, r: 10).expanded(),
            widthBox(8),
            _sBox(w: 72, h: 44, r: 10),
            widthBox(8),
            _sBox(w: 72, h: 44, r: 10),
            widthBox(8),
            _sBox(w: 64, h: 14),
          ],
        ),
      );

  Widget _footerMetric() => Column(
        mainAxisSize: .min,
        children: [_sBox(w: 70, h: 10), heightBox(5), _sBox(w: 90, h: 16)],
      );
}

// ─── Nav Button ───────────────────────────────────────────────────────────────

class _NavBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final bool primary;
  final bool iconOnRight;
  final bool stretch;

  const _NavBtn({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.primary,
    this.iconOnRight = false,
    this.stretch = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = primary ? context.primary : context.surface;
    final labelColor = primary ? Colors.white : context.textSecondary;
    final borderColor = primary ? context.primary : context.border;

    final iconWidget = Icon(icon, size: 14, color: labelColor);
    final labelWidget = Text(
      label,
      style: context.labelMedium.copyWith(color: labelColor, fontWeight: .w700),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: stretch ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
          boxShadow: primary
              ? [BoxShadow(color: context.primary.withAlpha(50), blurRadius: 8, offset: const Offset(0, 3))]
              : null,
        ),
        child: Row(
          mainAxisSize: stretch ? .max : .min,
          mainAxisAlignment: stretch ? .center : .start,
          children: iconOnRight ? [labelWidget, widthBox(6), iconWidget] : [iconWidget, widthBox(6), labelWidget],
        ),
      ),
    );
  }
}

// ─── Save Success Dialog ──────────────────────────────────────────────────────
//
// Simplified from the original: no share-as-image / branded customer rate
// card yet — those depend on infrastructure (screenshot capture, org
// branding) this app doesn't have. Just confirms the save and returns Home.

class _SaveSuccessDialog extends StatelessWidget {
  final PartahCalculator calculator;
  const _SaveSuccessDialog({required this.calculator});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: context.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(color: context.success.withAlpha(20), shape: .circle),
              child: Icon(Icons.check_rounded, size: 38, color: context.success),
            ),
            heightBox(16),
            Text(
              'Report Saved!',
              style: context.titleLarge.copyWith(fontWeight: .w800, color: context.textPrimary),
            ),
            heightBox(6),
            Text(
              'Your Partah report has been saved successfully.',
              textAlign: .center,
              style: context.bodySmall.copyWith(color: context.textSecondary),
            ),
            heightBox(24),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                calculator.clearAll();
              },
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Done',
                    style: context.labelLarge.copyWith(color: Colors.white, fontWeight: .w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
