import 'package:flutter/material.dart';

import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../domain/entities/partah_category_entity.dart';

// ─────────────────────────────────────────────────────────────────────────────
// CostItem — one row in the variable/fixed cost list
// ─────────────────────────────────────────────────────────────────────────────

class CostItem {
  final TextEditingController descriptionController;
  final TextEditingController costController;

  CostItem()
      : descriptionController = TextEditingController(),
        costController = TextEditingController();

  double get cost => double.tryParse(costController.text.trim()) ?? 0;

  void dispose() {
    descriptionController.dispose();
    costController.dispose();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PartahRow — one output category row (e.g. Rice, atta)
// ─────────────────────────────────────────────────────────────────────────────

class PartahRow {
  final PartahCategoryEntity category;
  final TextEditingController rateController;
  final TextEditingController yieldController;

  PartahRow(this.category)
      : rateController = TextEditingController(),
        yieldController = TextEditingController();

  /// Rate entered by user — sale price per bag (e.g. Rs 2500 per 20kg bag)
  double get rate => double.tryParse(rateController.text.trim()) ?? 0;

  /// Yield % entered by user — how much % of input becomes this category (e.g. 70%)
  double get yieldPct => double.tryParse(yieldController.text.trim()) ?? 0;

  // ── FORMULA 1 ──────────────────────────────────────────────────────────────
  //
  //   ratePerKg        = rate / bagSize
  //                    = 2500 / 20  = Rs 125 per kg
  //
  //   producedKg       = (yieldPct / 100) × totalInput
  //                    = (70 / 100) × 100  = 70 kg
  //
  //   saleAmount100kg  = ROUND(ratePerKg × producedKg, 0)
  //                    = ROUND(125 × 70, 0)  = Rs 8,750
  //
  // ──────────────────────────────────────────────────────────────────────────

  double saleAmount100kg(double totalInput) {
    final bagSize = category.standardBagKg;
    if (bagSize <= 0) return 0;
    return ((rate / bagSize) * (yieldPct / 100) * totalInput).roundToDouble();
  }

  void dispose() {
    rateController.dispose();
    yieldController.dispose();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PartahCalculator — all P&L calculations for the Partah wizard.
//
// Categories replace the old flat product-template list — rows are the
// non-raw-material categories (outputs, e.g. Rice/atta), the wheat side is
// whichever category is flagged as raw material. No local persistence:
// nothing here is written to disk, session survives only in memory for the
// lifetime of this screen.
// ─────────────────────────────────────────────────────────────────────────────

class PartahCalculator extends ChangeNotifier {
  PartahCalculator({required List<PartahCategoryEntity> categories}) {
    rows = categories.map((c) => PartahRow(c)).toList();
    for (final c in _allControllers) {
      c.addListener(_tick);
    }
    for (final row in rows) {
      row.rateController.addListener(_tick);
      row.yieldController.addListener(_tick);
    }
    _init();
  }

  // ── Base config ────────────────────────────────────────────────────────────
  // Set from MillConfigStore during _init(); defaults to 100kg (flour) until then.
  double baseWeightKg = 100;

  // ── State ──────────────────────────────────────────────────────────────────

  late List<PartahRow> rows;
  int currentStep = 0;
  final List<CostItem> variableCosts = [];
  final List<CostItem> fixedCosts = [];

  // ── User input controllers ─────────────────────────────────────────────────

  /// Raw-material purchase price per base bag weight
  final TextEditingController purchasePriceController = TextEditingController();

  /// Number of raw-material bags ground (Pisai count)
  final TextEditingController grindingController = TextEditingController();

  /// Gain percentage (e.g. enter 2 for 2%)
  final TextEditingController gainPctController = TextEditingController();

  List<TextEditingController> get _allControllers => [
        purchasePriceController,
        grindingController,
        gainPctController,
      ];

  Future<void> _init() async {
    baseWeightKg = await MillConfigStore.getBaseWeightKg();
    _tick();
  }

  // ── Category reload (after returning from Parta Categories) ───────────────

  /// Rebuilds [rows] from a fresh category list, preserving rate/yield values
  /// entered for categories that still exist by key.
  void reloadRows(List<PartahCategoryEntity> categories) {
    final savedValues = {
      for (final row in rows)
        row.category.categoryKey: (rate: row.rateController.text, yieldPct: row.yieldController.text),
    };

    for (final row in rows) {
      row.rateController.removeListener(_tick);
      row.yieldController.removeListener(_tick);
      row.dispose();
    }

    rows = categories.map((c) {
      final row = PartahRow(c);
      final saved = savedValues[c.categoryKey];
      if (saved != null) {
        row.rateController.text = saved.rate;
        row.yieldController.text = saved.yieldPct;
      }
      row.rateController.addListener(_tick);
      row.yieldController.addListener(_tick);
      return row;
    }).toList();

    _tick();
  }

  // ── Step navigation ────────────────────────────────────────────────────────

  void stepForward() {
    if (currentStep < 3) {
      currentStep++;
      notifyListeners();
    }
  }

  void stepBack() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index <= 3) {
      currentStep = index;
      notifyListeners();
    }
  }

  // ── Dynamic cost management ────────────────────────────────────────────────

  void addVariableCost() {
    final item = CostItem();
    item.costController.addListener(_tick);
    variableCosts.add(item);
    _tick();
  }

  void removeVariableCost(int index) {
    final item = variableCosts[index];
    item.costController.removeListener(_tick);
    item.dispose();
    variableCosts.removeAt(index);
    _tick();
  }

  void addFixedCost() {
    final item = CostItem();
    item.costController.addListener(_tick);
    fixedCosts.add(item);
    _tick();
  }

  void removeFixedCost(int index) {
    final item = fixedCosts[index];
    item.costController.removeListener(_tick);
    item.dispose();
    fixedCosts.removeAt(index);
    _tick();
  }

  // ── Raw inputs ─────────────────────────────────────────────────────────────

  double _parseCtrl(TextEditingController c) => double.tryParse(c.text.trim()) ?? 0;

  /// Total raw-material input in kg — one base bag
  double get totalInput => baseWeightKg;

  /// Raw-material price per base bag weight (user entered)
  double get wheatPricePer100 => _parseCtrl(purchasePriceController);

  /// Number of raw-material bags ground (user entered)
  double get grindingBags => _parseCtrl(grindingController);

  /// Gain % entered by user (e.g. 2 means 2%)
  double get gainPct => _parseCtrl(gainPctController);

  // ── FORMULA 2 — Total yield % across all categories ────────────────────────
  //
  //   totalSaleYield100kg = sum of yieldPct for all categories
  //                       = 70 + 25 + 5  = 100%   (must always = 100)
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get totalSaleYield100kg => rows.fold(0.0, (s, r) => s + r.yieldPct);

  // ── FORMULA 3 — Total sale amount for actual input ─────────────────────────
  //
  //   totalSaleAmount100kg = sum of saleAmount100kg for all categories
  //                        = 8,750 + 1,000 + 375  = Rs 10,125
  //   (this is for actual totalInput kg, not just 100kg)
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get totalSaleAmount100kg => rows.fold(0.0, (s, r) => s + r.saleAmount100kg(totalInput));

  // ── FORMULA 4 — Sale amount per 100 kg (for summary display) ──────────────
  //
  //   saleAmountPer100 = totalSaleAmount100kg / (totalInput / 100)
  //                    = 10,125 / (100/100)  = Rs 10,125 per 100 kg
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get saleAmountPer100 =>
      totalInput > 0 ? totalSaleAmount100kg / (totalInput / baseWeightKg) : 0;

  // ── FORMULA 5 — Gain amount per 100 kg ────────────────────────────────────
  //
  //   gainAmount = (gainPct / 100) × wheatPrice
  //              = (2 / 100) × 4000  = Rs 80 per 100 kg
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get gainAmount => wheatPricePer100 * gainPct / 100;

  // ── FORMULA 6 — Purchase (Partah) cost per 100 kg ─────────────────────────
  //
  //   purchasePricePer100 = wheatPrice
  //                       = Rs 4,000 per 100 kg
  //
  //   totalPurchaseCost   = purchasePricePer100 × (totalInput / 100)
  //                       = 4,000 × 1  = Rs 4,000  (for 100 kg input)
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get purchasePricePer100 => wheatPricePer100;
  double get purchaseAmountPer100 => purchasePricePer100;
  double get totalPurchaseCost => purchasePricePer100 * (totalInput / baseWeightKg);

  // ── FORMULA 7 — Operating costs per 100 kg ────────────────────────────────
  //
  //   variableCostPer100 = sum of all variable cost rows
  //                      = 300 + 100  = Rs 400 per 100 kg
  //
  //   fixedCostPer100    = sum of all fixed cost rows
  //                      = 150 + 200  = Rs 350 per 100 kg
  //
  //   totalCostPer100    = variableCostPer100 + fixedCostPer100
  //                      = 400 + 350  = Rs 750 per 100 kg
  //
  //   (scaled to actual input for total figures)
  //   totalVariableCosts = variableCostPer100 × (totalInput / 100)
  //   totalFixedCosts    = fixedCostPer100    × (totalInput / 100)
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get variableCostPer100 => variableCosts.fold(0.0, (s, item) => s + item.cost);
  double get fixedCostPer100 => fixedCosts.fold(0.0, (s, item) => s + item.cost);
  double get totalCostPer100 => variableCostPer100 + fixedCostPer100;

  double get totalVariableCosts => variableCostPer100 * (totalInput / baseWeightKg);
  double get totalFixedCosts => fixedCostPer100 * (totalInput / baseWeightKg);
  double get totalCosts => totalVariableCosts + totalFixedCosts;

  // ── FORMULA 8 — Total Revenue (for actual input) ──────────────────────────
  //
  //   TotalRevenue = totalSaleAmount100kg + gainAmount × (totalInput / 100)
  //               = 10,125 + 80 × 1  = Rs 10,205
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get totalRevenue => totalSaleAmount100kg + gainAmount * (totalInput / baseWeightKg);

  // ── FORMULA 9 — Gross Profit (before operating costs) ────────────────────
  //
  //   grossProfit = TotalRevenue - totalPurchaseCost
  //              = 10,205 - 4,000  = Rs 6,205
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get grossProfit => totalRevenue - totalPurchaseCost;

  // ── FORMULA 10 — Net Profit (after ALL costs) ─────────────────────────────
  //
  //   netProfit = grossProfit - totalCosts (variable + fixed)
  //             = 6,205 - 750  = Rs 5,455
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get netProfit => grossProfit - totalCosts;

  // ── FORMULA 11 — Net Profit per 100 kg (for summary display) ─────────────
  //
  //   profitPer100 = netProfit / (totalInput / 100)
  //               = 5,455 / 1  = Rs 5,455 per 100 kg
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get profitPer100 => totalInput > 0 ? netProfit / (totalInput / baseWeightKg) : 0;

  double get perKgProfit => totalInput > 0 ? netProfit / totalInput : 0;

  /// Total net profit scaled by actual bags ground (for footer display)
  double get totalNetProfit => grindingBags > 0 ? netProfit * grindingBags : netProfit;

  void clearAll() {
    for (final c in _allControllers) {
      c.clear();
    }
    for (final row in rows) {
      row.rateController.clear();
      row.yieldController.clear();
    }
    for (final item in variableCosts) {
      item.costController.removeListener(_tick);
      item.dispose();
    }
    variableCosts.clear();
    for (final item in fixedCosts) {
      item.costController.removeListener(_tick);
      item.dispose();
    }
    fixedCosts.clear();
    currentStep = 0;
    _tick();
  }

  void _tick() => notifyListeners();

  @override
  void dispose() {
    for (final c in _allControllers) {
      c.removeListener(_tick);
      c.dispose();
    }
    for (final row in rows) {
      row.dispose();
    }
    for (final item in variableCosts) {
      item.dispose();
    }
    for (final item in fixedCosts) {
      item.dispose();
    }
    super.dispose();
  }
}
