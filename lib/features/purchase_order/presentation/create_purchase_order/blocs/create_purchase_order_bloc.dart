import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/entities/purchase_order_detail_entity.dart';
import '../../../domain/usecases/create_purchase_order_usecase.dart';
import '../../../domain/usecases/get_parties_usecase.dart';
import '../../../domain/usecases/get_purchase_order_by_id_usecase.dart';
import '../widgets/purchase_order_items_table.dart';
import 'create_purchase_order_event.dart';
import 'create_purchase_order_state.dart';

class CreatePurchaseOrderBloc
    extends Bloc<CreatePurchaseOrderEvent, CreatePurchaseOrderState>
    with UsecaseExecuterMixin {
  final CreatePurchaseOrderUsecase createPurchaseOrderUsecase;
  final GetPurchaseOrderByIdUsecase getPurchaseOrderByIdUsecase;
  final GetPartiesUsecase getPartiesUsecase;

  CreatePurchaseOrderBloc({
    required this.createPurchaseOrderUsecase,
    required this.getPurchaseOrderByIdUsecase,
    required this.getPartiesUsecase,
  }) : super(_initialState()) {
    on<CreatePurchaseOrderSubmitted>(_onCreatePurchaseOrderSubmitted, transformer: droppable());
    on<PurchaseOrderDetailRequested>(_onDetailRequested, transformer: droppable());
    on<PurchaseOrderPartiesRequested>(_onPartiesRequested, transformer: droppable());
    on<PurchaseOrderSupplierSelected>(_onSupplierSelected);
    on<PurchaseOrderBrokerSelected>(_onBrokerSelected);
    on<PurchaseOrderDateChanged>(_onDateChanged);
    on<PurchaseOrderRowAdded>(_onRowAdded, transformer: sequential());
    on<PurchaseOrderRowRemoved>(_onRowRemoved, transformer: sequential());
    on<PurchaseOrderRowUpdated>(_onRowUpdated, transformer: sequential());
  }

  Future<void> _onCreatePurchaseOrderSubmitted(
    CreatePurchaseOrderSubmitted event,
    Emitter<CreatePurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => createPurchaseOrderUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }

  Future<void> _onDetailRequested(
    PurchaseOrderDetailRequested event,
    Emitter<CreatePurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getPurchaseOrderByIdUsecase(event.orderId),
      stateBuilder: (status, {data, error}) {
        if (status == ApiStatus.SUCCESS && data != null) {
          return _applyDetail(data, event.orderId);
        }
        return state.copyWith(detailStatus: status, message: error);
      },
    );
  }

  Future<void> _onPartiesRequested(
    PurchaseOrderPartiesRequested event,
    Emitter<CreatePurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getPartiesUsecase(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        partiesStatus: status,
        parties: data ?? state.parties,
        message: error,
      ),
    );
  }

  void _onSupplierSelected(
    PurchaseOrderSupplierSelected event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    final party = state.parties.where((p) => p.name == event.name).firstOrNull;
    emit(state.copyWith(
      selectedSupplierId: party?.id,
      supplierName: event.name,
    ));
  }

  void _onBrokerSelected(
    PurchaseOrderBrokerSelected event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    final party = state.parties.where((p) => p.name == event.name).firstOrNull;
    emit(state.copyWith(
      selectedBrokerId: party?.id,
      brokerName: event.name,
    ));
  }

  void _onDateChanged(
    PurchaseOrderDateChanged event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  void _onRowAdded(
    PurchaseOrderRowAdded event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    emit(state.copyWith(rows: [...state.rows, event.item]));
  }

  void _onRowRemoved(
    PurchaseOrderRowRemoved event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    final updated = [...state.rows]..removeAt(event.index);
    emit(state.copyWith(rows: updated));
  }

  void _onRowUpdated(
    PurchaseOrderRowUpdated event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    final updated = [...state.rows]..[event.index] = event.item;
    emit(state.copyWith(rows: updated));
  }

  CreatePurchaseOrderState _applyDetail(
    PurchaseOrderDetailEntity d,
    int orderId,
  ) {
    final rows = d.rows.map((r) {
      final qty = r.qtyPack ?? 0;
      final price = r.pricePack ?? 0;
      final disc = r.ttlDisc ?? 0;
      final tax = r.taxAmount ?? 0;
      final productValue = qty * price;
      final subTotal = r.subTotal ?? (productValue - disc);
      return PurchaseOrderRowItem(
        item: r.itemName ?? '—',
        mode: r.contractModeName ?? '—',
        contractQty: qty,
        price: price,
        rateUnit: (r.weightPriceUnit ?? 1).toStringAsFixed(2),
        discPercent: productValue > 0 ? disc / productValue * 100 : 0,
        discValue: disc,
        vatPercent: subTotal > 0 ? tax / subTotal * 100 : 0,
        vatAmount: tax,
        total: r.rowTotal ?? subTotal + tax,
      );
    }).toList();

    return state.copyWith(
      detailStatus: ApiStatus.SUCCESS,
      editingOrderId: orderId,
      docNbr: d.docNbr,
      date: d.docDate,
      refDocNumber: d.refDocNbr,
      selectedSupplierId: d.partyId,
      selectedBrokerId: d.brokerId,
      selectedCurrencyId: d.currencyId,
      currencyRate: d.currencyRate,
      rate: d.brokerageOptionValue,
      calculationsId: d.brokerageOptionId,
      selectedOrderSource: d.orderSourceId,
      paymentMode: d.paymentModeId,
      supplierName: d.partyName,
      brokerName: d.brokerName,
      paymentModeName: d.paymentModeName,
      orderSourceName: d.orderSourceName,
      calculationsName: d.brokerCommissionOptionName,
      rows: rows,
    );
  }

  static CreatePurchaseOrderState _initialState() {
    final now = DateTime.now();
    return CreatePurchaseOrderState(date: now);
  }
}
