import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../domain/entities/party_option.dart';
import '../../domain/entities/purchase_order_entity.dart';
import '../models/response_models/purchase_order_detail/purchase_order_detail.dart';
import '../models/response_models/purchase_orders_list/purchase_orders_list.dart';

abstract interface class IRemotePurchaseOrderDataSource {
  Future<List<PurchaseOrderEntity>> fetchOrders();
  Future<PurchaseOrderDetail> fetchOrderById(int id);
  Future<List<PartyOption>> fetchParties();
  Future<dynamic> createPurchaseOrder();
}

class RemotePurchaseOrderDataSourceImpl extends BaseRemoteDatasource
    implements IRemotePurchaseOrderDataSource {
  RemotePurchaseOrderDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<List<PurchaseOrderEntity>> fetchOrders() async {
    final result = await post<PurchaseOrdersList>(
      url: ApiEndPoints.purchase.getPurchaseOrdersList,
      body: const {},
      parser: (json) =>
          PurchaseOrdersList.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
    return (result.data ?? []).map(_toEntity).toList();
  }

  @override
  Future<PurchaseOrderDetail> fetchOrderById(int id) {
    return get<PurchaseOrderDetail>(
      url: ApiEndPoints.purchase.getPurchaseOrderById(id),
      parser: (json) =>
          PurchaseOrderDetail.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<List<PartyOption>> fetchParties() {
    return postList<PartyOption>(
      url: ApiEndPoints.accounts.partyList,
      body: const {},
      parser: (json) => PartyOption(
        id: (json['Id'] as num?)?.toInt() ?? 0,
        name: json['FullName'] as String? ?? '',
      ),
      authToken: _token,
    );
  }

  PurchaseOrderEntity _toEntity(Datum d) {
    return PurchaseOrderEntity(
      id: d.id ?? 0,
      docNumber: d.docNbr ?? '—',
      partyName: d.party?.fullName ?? '—',
      date: d.docDate?.format('dd/MM/yy') ?? '—',
      netAmount: d.ttlNetAmount ?? 0,
      refNo: d.refDocNbr,
      rowsCount: d.ttlRows ?? 0,
      remarks: d.firstRow?.itemName,
    );
  }

  @override
  Future<dynamic> createPurchaseOrder() async {
    // TODO: implement createPurchaseOrder API call
    throw UnimplementedError('createPurchaseOrder not implemented');
  }
}
