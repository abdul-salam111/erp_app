import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../domain/entities/purchase_order_entity.dart';
import '../models/response_models/purchase_orders_list/purchase_orders_list.dart';

abstract interface class IRemotePurchaseOrderDataSource {
  Future<List<PurchaseOrderEntity>> fetchOrders({String? search});
  Future<dynamic> createPurchaseOrder();
}

class RemotePurchaseOrderDataSourceImpl extends BaseRemoteDatasource
    implements IRemotePurchaseOrderDataSource {
  RemotePurchaseOrderDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<List<PurchaseOrderEntity>> fetchOrders({String? search}) async {
    final body = <String, dynamic>{
      if (search != null && search.isNotEmpty) 'Search': search,
    };
    final result = await post<PurchaseOrdersList>(
      url: ApiEndPoints.purchase.getPurchaseOrdersList,
      body: body,
      parser: (json) =>
          PurchaseOrdersList.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
    return (result.data ?? []).map(_toEntity).toList();
  }

  PurchaseOrderEntity _toEntity(Datum d) {
    return PurchaseOrderEntity(
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
