import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/party_option.dart';
import '../widgets/sale_order_items_table.dart';

class CreateSaleOrderState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  // Edit / view mode — set when opened from the list's eye icon.
  final int? editingOrderId;
  final String? docNbr;
  final ApiStatus detailStatus;

  // Parties (customers / brokers) dropdown data.
  final List<PartyOption> parties;
  final ApiStatus partiesStatus;

  final DateTime date;
  final String? refDocNumber;
  final double? rate;
  final int? selectedOrderSource;
  final int? paymentMode;
  final int? selectedCustomerId;
  final int? selectedCurrencyId;
  final int? selectedBrokerId;
  final int? selectedWeightSource;
  final int? calculationsId;
  final double? currencyRate;
  final List<SaleOrderRowItem> rows;

  // Display names loaded from detail, used to prefill the form controllers.
  final String? customerName;
  final String? brokerName;
  final String? paymentModeName;
  final String? orderSourceName;
  final String? calculationsName;

  const CreateSaleOrderState({
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
    this.selectedCustomerId,
    this.selectedCurrencyId,
    this.selectedBrokerId,
    this.selectedWeightSource,
    this.calculationsId,
    this.currencyRate,
    this.rows = const [],
    this.customerName,
    this.brokerName,
    this.paymentModeName,
    this.orderSourceName,
    this.calculationsName,
  });

  bool get isEditMode => editingOrderId != null;

  CreateSaleOrderState copyWith({
    dynamic data,
    String? message,
    bool clearMessage = false,
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
    int? selectedCustomerId,
    int? selectedCurrencyId,
    int? selectedBrokerId,
    int? selectedWeightSource,
    int? calculationsId,
    List<SaleOrderRowItem>? rows,
    String? customerName,
    String? brokerName,
    String? paymentModeName,
    String? orderSourceName,
    String? calculationsName,
  }) {
    return CreateSaleOrderState(
      data: data ?? this.data,
      message: clearMessage ? null : (message ?? this.message),
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
      selectedCustomerId: selectedCustomerId ?? this.selectedCustomerId,
      selectedCurrencyId: selectedCurrencyId ?? this.selectedCurrencyId,
      selectedBrokerId: selectedBrokerId ?? this.selectedBrokerId,
      selectedWeightSource: selectedWeightSource ?? this.selectedWeightSource,
      calculationsId: calculationsId ?? this.calculationsId,
      currencyRate: currencyRate ?? this.currencyRate,
      rows: rows ?? this.rows,
      customerName: customerName ?? this.customerName,
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
    selectedCustomerId,
    selectedCurrencyId,
    selectedBrokerId,
    selectedWeightSource,
    calculationsId,
    currencyRate,
    rows,
    customerName,
    brokerName,
    paymentModeName,
    orderSourceName,
    calculationsName,
  ];
}
