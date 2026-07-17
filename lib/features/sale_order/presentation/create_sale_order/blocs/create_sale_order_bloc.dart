import 'package:bloc/bloc.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../data/models/response_models/sale_order_detail/sale_order_detail.dart';
import '../../../domain/usecases/create_sale_order_usecase.dart';
import '../../../domain/usecases/get_sale_order_by_id_usecase.dart';
import '../../../domain/usecases/get_sale_parties_usecase.dart';
import '../widgets/sale_order_items_table.dart';
import 'create_sale_order_event.dart';
import 'create_sale_order_state.dart';

class CreateSaleOrderBloc
    extends Bloc<CreateSaleOrderEvent, CreateSaleOrderState>
    with UsecaseExecuterMixin {
  final CreateSaleOrderUsecase createSaleOrderUsecase;
  final GetSaleOrderByIdUsecase getSaleOrderByIdUsecase;
  final GetSalePartiesUsecase getSalePartiesUsecase;

  CreateSaleOrderBloc({
    required this.createSaleOrderUsecase,
    required this.getSaleOrderByIdUsecase,
    required this.getSalePartiesUsecase,
  }) : super(_initialState()) {
    on<CreateSaleOrderSubmitted>(_onCreateSaleOrderSubmitted);
    on<SaleOrderDetailRequested>(_onDetailRequested);
    on<SaleOrderPartiesRequested>(_onPartiesRequested);
    on<SaleOrderCustomerSelected>(_onCustomerSelected);
    on<SaleOrderBrokerSelected>(_onBrokerSelected);
    on<SaleOrderDateChanged>(_onDateChanged);
    on<SaleOrderRowAdded>(_onRowAdded);
    on<SaleOrderRowRemoved>(_onRowRemoved);
    on<SaleOrderRowUpdated>(_onRowUpdated);
  }

  Future<void> _onCreateSaleOrderSubmitted(
    CreateSaleOrderSubmitted event,
    Emitter<CreateSaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => createSaleOrderUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }

  Future<void> _onDetailRequested(
    SaleOrderDetailRequested event,
    Emitter<CreateSaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getSaleOrderByIdUsecase(event.orderId),
      stateBuilder: (status, {data, error}) {
        if (status == ApiStatus.SUCCESS && data != null) {
          return _applyDetail(data, event.orderId);
        }
        return state.copyWith(detailStatus: status, message: error);
      },
    );
  }

  Future<void> _onPartiesRequested(
    SaleOrderPartiesRequested event,
    Emitter<CreateSaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getSalePartiesUsecase(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        partiesStatus: status,
        parties: data ?? state.parties,
        message: error,
      ),
    );
  }

  void _onCustomerSelected(
    SaleOrderCustomerSelected event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    final party = state.parties.where((p) => p.name == event.name).firstOrNull;
    emit(state.copyWith(
      selectedCustomerId: party?.id,
      customerName: event.name,
    ));
  }

  void _onBrokerSelected(
    SaleOrderBrokerSelected event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    final party = state.parties.where((p) => p.name == event.name).firstOrNull;
    emit(state.copyWith(
      selectedBrokerId: party?.id,
      brokerName: event.name,
    ));
  }

  void _onDateChanged(
    SaleOrderDateChanged event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  void _onRowAdded(
    SaleOrderRowAdded event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    emit(state.copyWith(rows: [...state.rows, event.item]));
  }

  void _onRowRemoved(
    SaleOrderRowRemoved event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    final updated = [...state.rows]..removeAt(event.index);
    emit(state.copyWith(rows: updated));
  }

  void _onRowUpdated(
    SaleOrderRowUpdated event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    final updated = [...state.rows]..[event.index] = event.item;
    emit(state.copyWith(rows: updated));
  }

  CreateSaleOrderState _applyDetail(SaleOrderDetail d, int orderId) {
    final rows = (d.rows ?? []).map((r) {
      final qty = r.qtyPack ?? 0;
      final price = r.pricePack ?? 0;
      final disc = r.ttlDisc ?? 0;
      final tax = r.taxAmount ?? 0;
      final productValue = qty * price;
      final subTotal = r.subTotal ?? (productValue - disc);
      return SaleOrderRowItem(
        item: r.item?.name ?? '—',
        mode: r.contractMode?.name ?? '—',
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
      selectedCustomerId: d.partyId,
      selectedBrokerId: d.brokerId,
      selectedCurrencyId: d.currencyId,
      currencyRate: d.currencyRate,
      rate: d.brokerageOptionValue,
      calculationsId: d.brokerageOptionId,
      selectedOrderSource: d.orderSourceId,
      paymentMode: d.paymentModeId,
      customerName: d.party?.fullName,
      brokerName: d.broker?.fullName,
      paymentModeName: d.modeOfPayment?.name,
      orderSourceName: d.orderSource?.name,
      calculationsName: d.brokerComissionOption?.name,
      rows: rows,
    );
  }

  static CreateSaleOrderState _initialState() {
    return CreateSaleOrderState(date: DateTime.now());
  }
}
