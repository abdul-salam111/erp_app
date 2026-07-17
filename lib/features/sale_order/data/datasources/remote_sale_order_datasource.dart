import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../domain/entities/party_option.dart';
import '../../domain/entities/sale_order_entity.dart';
import '../models/response_models/sale_order_detail/sale_order_detail.dart';
import '../models/response_models/sale_orders_list/sale_orders_list.dart';

abstract interface class IRemoteSaleOrderDataSource {
  Future<List<SaleOrderEntity>> fetchOrders();
  Future<SaleOrderDetail> fetchOrderById(int id);
  Future<List<PartyOption>> fetchParties();
  Future<dynamic> createSaleOrder();
}

class RemoteSaleOrderDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteSaleOrderDataSource {
  RemoteSaleOrderDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<List<SaleOrderEntity>> fetchOrders() async {
    final result = await post<SaleOrdersList>(
      url: ApiEndPoints.sale.getSaleOrdersList,
      body: const {},
      parser: (json) => SaleOrdersList.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
    return (result.data ?? []).map(_toEntity).toList();
  }

  @override
  Future<SaleOrderDetail> fetchOrderById(int id) {
    return get<SaleOrderDetail>(
      url: ApiEndPoints.sale.getSaleOrderById(id),
      parser: (json) => SaleOrderDetail.fromJson(json as Map<String, dynamic>),
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

  SaleOrderEntity _toEntity(SaleOrderDatum d) {
    return SaleOrderEntity(
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
  Future<dynamic> createSaleOrder() async {
    // TODO: implement createSaleOrder API call
    throw UnimplementedError('createSaleOrder not implemented');
  }
}
