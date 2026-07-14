import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../widgets/purchase_order_items_table.dart';

class CreatePurchaseOrderState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final DateTime date;
  final String? refDocNumber;
  final double? rate;
  final int? selectedOrderSource;
  final int? paymentMode;
  final int? selectedSupplierId;
  final int? selectedCurrencyId;
  final int? selectedBrokerId;
  final int? selectedWeightSource;
  final int? calculationsId;
  final double? currencyRate;
  final List<PurchaseOrderRowItem> rows;

  const CreatePurchaseOrderState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    required this.date,
    this.refDocNumber,
    this.rate,
    this.selectedOrderSource,
    this.paymentMode,
    this.selectedSupplierId,
    this.selectedCurrencyId,
    this.selectedBrokerId,
    this.selectedWeightSource,
    this.calculationsId,
    this.currencyRate,
    this.rows = const [],
  });

  CreatePurchaseOrderState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    DateTime? date,
    String? refDocNumber,
    double? rate,
    double? currencyRate,
    int? selectedOrderSource,
    int? paymentMode,
    int? selectedSupplierId,
    int? selectedCurrencyId,
    int? selectedBrokerId,
    int? selectedWeightSource,
    int? calculationsId,
    List<PurchaseOrderRowItem>? rows,
  }) {
    return CreatePurchaseOrderState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      date: date ?? this.date,
      refDocNumber: refDocNumber ?? this.refDocNumber,
      rate: rate ?? this.rate,
      selectedOrderSource: selectedOrderSource ?? this.selectedOrderSource,
      paymentMode: paymentMode ?? this.paymentMode,
      selectedSupplierId: selectedSupplierId ?? this.selectedSupplierId,
      selectedCurrencyId: selectedCurrencyId ?? this.selectedCurrencyId,
      selectedBrokerId: selectedBrokerId ?? this.selectedBrokerId,
      selectedWeightSource: selectedWeightSource ?? this.selectedWeightSource,
      calculationsId: calculationsId ?? this.calculationsId,
      currencyRate: currencyRate ?? this.currencyRate,
      rows: rows ?? this.rows,
    );
  }

  @override
  List<Object?> get props => [
    data,
    message,
    apiStatus,
    date,
    refDocNumber,
    rate,
    selectedOrderSource,
    paymentMode,
    selectedSupplierId,
    selectedCurrencyId,
    selectedBrokerId,
    selectedWeightSource,
    calculationsId,
    currencyRate,
    rows,
  ];
}