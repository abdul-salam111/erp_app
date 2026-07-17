import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/party_option.dart';
import '../widgets/purchase_order_items_table.dart';

class CreatePurchaseOrderState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  // Edit / view mode — set when opened from the list's eye icon.
  final int? editingOrderId;
  final String? docNbr;
  final ApiStatus detailStatus;

  // Parties (suppliers / brokers) dropdown data.
  final List<PartyOption> parties;
  final ApiStatus partiesStatus;

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

  // Display names loaded from detail, used to prefill the form controllers.
  final String? supplierName;
  final String? brokerName;
  final String? paymentModeName;
  final String? orderSourceName;
  final String? calculationsName;

  const CreatePurchaseOrderState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.editingOrderId,
    this.docNbr,
    this.detailStatus = ApiStatus.INITIAL,
    this.parties = const [],
    this.partiesStatus = ApiStatus.INITIAL,
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
    this.supplierName,
    this.brokerName,
    this.paymentModeName,
    this.orderSourceName,
    this.calculationsName,
  });

  bool get isEditMode => editingOrderId != null;

  CreatePurchaseOrderState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    int? editingOrderId,
    String? docNbr,
    ApiStatus? detailStatus,
    List<PartyOption>? parties,
    ApiStatus? partiesStatus,
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
    String? supplierName,
    String? brokerName,
    String? paymentModeName,
    String? orderSourceName,
    String? calculationsName,
  }) {
    return CreatePurchaseOrderState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      editingOrderId: editingOrderId ?? this.editingOrderId,
      docNbr: docNbr ?? this.docNbr,
      detailStatus: detailStatus ?? this.detailStatus,
      parties: parties ?? this.parties,
      partiesStatus: partiesStatus ?? this.partiesStatus,
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
      supplierName: supplierName ?? this.supplierName,
      brokerName: brokerName ?? this.brokerName,
      paymentModeName: paymentModeName ?? this.paymentModeName,
      orderSourceName: orderSourceName ?? this.orderSourceName,
      calculationsName: calculationsName ?? this.calculationsName,
    );
  }

  @override
  List<Object?> get props => [
    data,
    message,
    apiStatus,
    editingOrderId,
    docNbr,
    detailStatus,
    parties,
    partiesStatus,
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
    supplierName,
    brokerName,
    paymentModeName,
    orderSourceName,
    calculationsName,
  ];
}
