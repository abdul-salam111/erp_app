import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../core/constants/shared_pref_key.dart';
import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../../../core/local_storage/storage.dart';
import '../../../domain/entities/cost_item_entity.dart';
import '../../../domain/entities/partah_record_entity.dart';
import '../../../domain/entities/product_template_entity.dart';
import '../../../domain/entities/production_entry_entity.dart';

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
// PartahRow — one product row (e.g. Maida, Chokar, Suji)
// ─────────────────────────────────────────────────────────────────────────────

class PartahRow {
  final ProductTemplateEntity template;
  final TextEditingController rateController;
  final TextEditingController yieldController;

  PartahRow(this.template)
      : rateController = TextEditingController(),
        yieldController = TextEditingController();

  /// Rate entered by user — sale price per bag (e.g. Rs 2500 per 20kg bag)
  double get rate => double.tryParse(rateController.text.trim()) ?? 0;

  /// Yield % entered by user — how much % of wheat becomes this product (e.g. 70%)
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

  double saleAmount100kg(double totalInput) =>
      ((rate / template.bagSize) * (yieldPct / 100) * totalInput).roundToDouble();

  void dispose() {
    rateController.dispose();
    yieldController.dispose();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PartahCalculator — all P&L calculations for the Partah wizard.
//
// This mirrors the original GetX ParhtaViewModel one-to-one, translated to a
// plain ChangeNotifier since this app uses Bloc/GetIt rather than GetX.
// PartahBloc only handles the async edges (loading product templates,
// prefill data, saving); everything else — controllers, live formulas, step
// navigation — lives here exactly like it did in the GetX version, because a
// Bloc event per keystroke across ~20 text fields is not a sane design.
// ─────────────────────────────────────────────────────────────────────────────

class PartahCalculator extends ChangeNotifier {
  PartahCalculator({
    required List<ProductTemplateEntity> templates,
    List<CostItemEntity> lastVariableCosts = const [],
    List<CostItemEntity> lastFixedCosts = const [],
    List<ProductionEntryEntity> lastEntries = const [],
  }) {
    rows = templates.map((t) => PartahRow(t)).toList();
    for (final c in _allControllers) {
      c.addListener(_tick);
      c.addListener(_scheduleSave);
    }
    for (final row in rows) {
      row.rateController.addListener(_tick);
      row.rateController.addListener(_scheduleSave);
      row.yieldController.addListener(_tick);
      row.yieldController.addListener(_scheduleSave);
    }
    _init(lastVariableCosts, lastFixedCosts, lastEntries);
  }

  /// In-memory only — survives back-navigation but resets on app kill.
  static int _sessionStep = 0;

  // ── Base config ────────────────────────────────────────────────────────────
  // Set from MillConfigStore during _init(); defaults to 100kg (flour) until then.
  double baseWeightKg = 100;

  // ── State ──────────────────────────────────────────────────────────────────

  late List<PartahRow> rows;
  int currentStep = 0;
  bool isSaving = false;
  final List<CostItem> variableCosts = [];
  final List<CostItem> fixedCosts = [];

  // ── User input controllers ─────────────────────────────────────────────────

  /// Wheat purchase price per base bag weight
  final TextEditingController purchasePriceController = TextEditingController();

  /// Number of wheat bags ground (Pisai count)
  final TextEditingController grindingController = TextEditingController();

  /// Gain percentage (e.g. enter 2 for 2%)
  final TextEditingController gainPctController = TextEditingController();

  List<TextEditingController> get _allControllers => [
        purchasePriceController,
        grindingController,
        gainPctController,
      ];

  // ── Session persistence ────────────────────────────────────────────────────

  Timer? _saveDebounce;

  void _scheduleSave() {
    _saveDebounce?.cancel();
    _saveDebounce = Timer(const Duration(milliseconds: 800), _persistSession);
  }

  Future<void> _persistSession() async {
    _sessionStep = currentStep; // memory-only, resets on app kill
    final session = {
      'purchasePrice': purchasePriceController.text,
      'grinding': grindingController.text,
      'gainPct': gainPctController.text,
      'rows': rows
          .map((r) => {
                'name': r.template.name,
                'rate': r.rateController.text,
                'yield': r.yieldController.text,
              })
          .toList(),
      'variableCosts': variableCosts
          .map((c) => {
                'desc': c.descriptionController.text,
                'cost': c.costController.text,
              })
          .toList(),
      'fixedCosts': fixedCosts
          .map((c) => {
                'desc': c.descriptionController.text,
                'cost': c.costController.text,
              })
          .toList(),
    };
    await storage.setValues(StorageKeys.partahSession, jsonEncode(session));
  }

  Future<bool> _restoreSession() async {
    final raw = await storage.readValues(StorageKeys.partahSession);
    if (raw == null || raw.isEmpty) return false;
    try {
      final session = jsonDecode(raw) as Map<String, dynamic>;

      purchasePriceController.text = session['purchasePrice'] ?? '';
      grindingController.text = session['grinding'] ?? '';
      gainPctController.text = session['gainPct'] ?? '';

      final savedRows = (session['rows'] as List?) ?? [];
      for (final saved in savedRows) {
        final matches = rows.where((r) => r.template.name == saved['name']);
        if (matches.isEmpty) continue;
        final row = matches.first;
        row.rateController.text = saved['rate'] ?? '';
        row.yieldController.text = saved['yield'] ?? '';
      }

      _replaceCostItems(variableCosts, (session['variableCosts'] as List?) ?? []);
      _replaceCostItems(fixedCosts, (session['fixedCosts'] as List?) ?? []);

      currentStep = _sessionStep; // from memory: 0 if app was killed
      return true;
    } catch (_) {
      return false;
    }
  }

  void _replaceCostItems(List<CostItem> target, List saved) {
    for (final item in target) {
      item.costController.removeListener(_tick);
      item.dispose();
    }
    target.clear();
    for (final c in saved) {
      final item = CostItem();
      item.descriptionController.text = c['desc'] ?? '';
      item.costController.text = c['cost'] ?? '';
      item.costController.addListener(_tick);
      item.costController.addListener(_scheduleSave);
      item.descriptionController.addListener(_scheduleSave);
      target.add(item);
    }
  }

  Future<void> _init(
    List<CostItemEntity> lastVariableCosts,
    List<CostItemEntity> lastFixedCosts,
    List<ProductionEntryEntity> lastEntries,
  ) async {
    baseWeightKg = await MillConfigStore.getBaseWeightKg();
    final restored = await _restoreSession();
    if (!restored) {
      _prefillLastCosts(lastVariableCosts, lastFixedCosts);
      _prefillLastEntries(lastEntries);
    }
    _tick();
  }

  void _prefillLastCosts(List<CostItemEntity> varCosts, List<CostItemEntity> fixCosts) {
    for (final c in varCosts) {
      final item = CostItem();
      item.descriptionController.text = c.description;
      item.costController.text = c.amount == 0 ? '' : c.amount.toString();
      item.costController.addListener(_tick);
      item.costController.addListener(_scheduleSave);
      item.descriptionController.addListener(_scheduleSave);
      variableCosts.add(item);
    }
    for (final c in fixCosts) {
      final item = CostItem();
      item.descriptionController.text = c.description;
      item.costController.text = c.amount == 0 ? '' : c.amount.toString();
      item.costController.addListener(_tick);
      item.costController.addListener(_scheduleSave);
      item.descriptionController.addListener(_scheduleSave);
      fixedCosts.add(item);
    }
  }

  void _prefillLastEntries(List<ProductionEntryEntity> entries) {
    for (final entry in entries) {
      final matches = rows.where(
        (r) => r.template.name == entry.productName && r.template.bagSize == entry.bagSize,
      );
      if (matches.isEmpty) continue;
      final row = matches.first;
      if (entry.rate > 0) {
        row.rateController.text = entry.rate.toStringAsFixed(entry.rate % 1 == 0 ? 0 : 2);
      }
      if (entry.percentage > 0) {
        row.yieldController.text =
            entry.percentage.toStringAsFixed(entry.percentage % 1 == 0 ? 0 : 1);
      }
    }
  }

  // ── Product reload (after returning from Manage Products) ─────────────────

  /// Rebuilds [rows] from a fresh template list, preserving rate/yield values
  /// entered for products that still exist by name.
  void reloadRows(List<ProductTemplateEntity> templates) {
    final savedValues = {
      for (final row in rows) row.template.name: (rate: row.rateController.text, yieldPct: row.yieldController.text),
    };

    for (final row in rows) {
      row.rateController.removeListener(_tick);
      row.rateController.removeListener(_scheduleSave);
      row.yieldController.removeListener(_tick);
      row.yieldController.removeListener(_scheduleSave);
      row.dispose();
    }

    rows = templates.map((t) {
      final row = PartahRow(t);
      final saved = savedValues[t.name];
      if (saved != null) {
        row.rateController.text = saved.rate;
        row.yieldController.text = saved.yieldPct;
      }
      row.rateController.addListener(_tick);
      row.rateController.addListener(_scheduleSave);
      row.yieldController.addListener(_tick);
      row.yieldController.addListener(_scheduleSave);
      return row;
    }).toList();

    _tick();
  }

  // ── Step navigation ────────────────────────────────────────────────────────

  void stepForward() {
    if (currentStep < 3) {
      currentStep++;
      _persistSession();
      notifyListeners();
    }
  }

  void stepBack() {
    if (currentStep > 0) {
      currentStep--;
      _persistSession();
      notifyListeners();
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index <= 3) {
      currentStep = index;
      _persistSession();
      notifyListeners();
    }
  }

  // ── Dynamic cost management ────────────────────────────────────────────────

  void addVariableCost() {
    final item = CostItem();
    item.costController.addListener(_tick);
    item.costController.addListener(_scheduleSave);
    item.descriptionController.addListener(_scheduleSave);
    variableCosts.add(item);
    _tick();
  }

  void removeVariableCost(int index) {
    final item = variableCosts[index];
    item.costController.removeListener(_tick);
    item.costController.removeListener(_scheduleSave);
    item.descriptionController.removeListener(_scheduleSave);
    item.dispose();
    variableCosts.removeAt(index);
    _tick();
    _scheduleSave();
  }

  void addFixedCost() {
    final item = CostItem();
    item.costController.addListener(_tick);
    item.costController.addListener(_scheduleSave);
    item.descriptionController.addListener(_scheduleSave);
    fixedCosts.add(item);
    _tick();
  }

  void removeFixedCost(int index) {
    final item = fixedCosts[index];
    item.costController.removeListener(_tick);
    item.costController.removeListener(_scheduleSave);
    item.descriptionController.removeListener(_scheduleSave);
    item.dispose();
    fixedCosts.removeAt(index);
    _tick();
    _scheduleSave();
  }

  // ── Raw inputs ─────────────────────────────────────────────────────────────

  double _parseCtrl(TextEditingController c) => double.tryParse(c.text.trim()) ?? 0;

  /// Total wheat input in kg — one base bag
  double get totalInput => baseWeightKg;

  /// Wheat price per base bag weight (user entered)
  double get wheatPricePer100 => _parseCtrl(purchasePriceController);

  /// Number of wheat bags ground (user entered)
  double get grindingBags => _parseCtrl(grindingController);

  /// Gain % entered by user (e.g. 2 means 2%)
  double get gainPct => _parseCtrl(gainPctController);

  // ── FORMULA 2 — Total yield % across all products ─────────────────────────
  //
  //   totalSaleYield100kg = sum of yieldPct for all products
  //                       = 70 + 25 + 5  = 100%   (must always = 100)
  //
  // ──────────────────────────────────────────────────────────────────────────

  double get totalSaleYield100kg => rows.fold(0.0, (s, r) => s + r.yieldPct);

  // ── FORMULA 3 — Total sale amount for actual input ─────────────────────────
  //
  //   totalSaleAmount100kg = sum of saleAmount100kg for all products
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
  double get purchaseAmountPer100 => purchasePricePer100; // alias used by save
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

  // ── Save ───────────────────────────────────────────────────────────────────

  String? validateForSave() {
    if (totalInput <= 0) return 'Enter bag weight first';
    final hasProducts = rows.any((r) => r.rate > 0 || r.yieldPct > 0);
    if (!hasProducts) return 'Enter at least one product rate/yield';
    return null;
  }

  /// Builds the record to persist. Call [validateForSave] first.
  PartahRecordEntity buildRecord() {
    final now = DateTime.now();

    final entries = rows
        .where((r) => r.rate > 0 || r.yieldPct > 0)
        .map((r) => ProductionEntryEntity(
              productName: r.template.name,
              bagSize: r.template.bagSize,
              percentage: r.yieldPct,
              rate: r.rate,
            ))
        .toList();

    final vCosts = variableCosts
        .map((c) => CostItemEntity(
              description: c.descriptionController.text.trim(),
              amount: c.cost,
              type: CostType.variable,
            ))
        .toList();

    final fCosts = fixedCosts
        .map((c) => CostItemEntity(
              description: c.descriptionController.text.trim(),
              amount: c.cost,
              type: CostType.fixed,
            ))
        .toList();

    return PartahRecordEntity(
      purchasePrice: purchasePricePer100,
      totalGrindingKg: grindingBags > 0 ? grindingBags * baseWeightKg : totalInput,
      gainPercentage: gainPct,
      purchaseAmountPer100Kg: purchaseAmountPer100,
      baseWeightKg: baseWeightKg,
      productionEntries: entries,
      variableCosts: vCosts,
      fixedCosts: fCosts,
      createdAt: now,
      updatedAt: now,
    );
  }

  Future<void> clearSavedSession() async {
    _saveDebounce?.cancel();
    _sessionStep = 0;
    await storage.clearValues(StorageKeys.partahSession);
  }

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
      item.costController.removeListener(_scheduleSave);
      item.descriptionController.removeListener(_scheduleSave);
      item.dispose();
    }
    variableCosts.clear();
    for (final item in fixedCosts) {
      item.costController.removeListener(_tick);
      item.costController.removeListener(_scheduleSave);
      item.descriptionController.removeListener(_scheduleSave);
      item.dispose();
    }
    fixedCosts.clear();
    currentStep = 0;
    _sessionStep = 0;
    _saveDebounce?.cancel();
    storage.clearValues(StorageKeys.partahSession);
    _tick();
  }

  void _tick() => notifyListeners();

  @override
  void dispose() {
    _saveDebounce?.cancel();
    for (final c in _allControllers) {
      c.removeListener(_tick);
      c.removeListener(_scheduleSave);
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
