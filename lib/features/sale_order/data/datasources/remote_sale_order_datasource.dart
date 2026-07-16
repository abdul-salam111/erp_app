import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/sale_order_entity.dart';

abstract interface class IRemoteSaleOrderDataSource {
  Future<List<SaleOrderEntity>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  });
  Future<dynamic> createSaleOrder();
}

class RemoteSaleOrderDataSourceImpl
    extends BaseRemoteDatasource
    implements IRemoteSaleOrderDataSource {
  RemoteSaleOrderDataSourceImpl({required super.dioHelper});

  @override
  Future<List<SaleOrderEntity>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockOrders;
  }

  static const _mockOrders = [
    SaleOrderEntity(docNumber: 'SO-0011', partyName: 'Ahmad Brothers Traders', date: '02/06/26', netAmount: 350000, refNo: '2211', rowsCount: 3, remarks: 'Basmati Rice Export'),
    SaleOrderEntity(docNumber: 'SO-0010', partyName: 'Punjab Wholesale Market', date: '11/05/26', netAmount: 75000, refNo: null, rowsCount: 1, remarks: '100% Broken Rice'),
    SaleOrderEntity(docNumber: 'SO-0009', partyName: 'Ahmad Brothers Traders', date: '11/05/26', netAmount: 220000, refNo: null, rowsCount: 2, remarks: 'Corn Meal Medium'),
    SaleOrderEntity(docNumber: 'SO-0008', partyName: 'Karachi Rice Exports', date: '08/05/26', netAmount: 1500000, refNo: null, rowsCount: 1, remarks: 'RM Yellow Corn'),
    SaleOrderEntity(docNumber: 'SO-0007', partyName: 'Ahmad Brothers Traders', date: '08/05/26', netAmount: 400000, refNo: null, rowsCount: 2, remarks: 'Basmati Rice Export'),
    SaleOrderEntity(docNumber: 'SO-0006', partyName: 'Lahore Grain House', date: '08/05/26', netAmount: 900000, refNo: null, rowsCount: 1, remarks: 'B3 Corn Grits'),
    SaleOrderEntity(docNumber: 'SO-0005', partyName: 'Punjab Wholesale Market', date: '20/02/26', netAmount: 180000, refNo: null, rowsCount: 2, remarks: 'Raw Maize'),
    SaleOrderEntity(docNumber: 'SO-0004', partyName: 'Ahmad Brothers Traders', date: '20/02/26', netAmount: 95000, refNo: null, rowsCount: 1, remarks: 'Corn Meal Medium'),
    SaleOrderEntity(docNumber: 'SO-0003', partyName: 'Karachi Rice Exports', date: '28/01/26', netAmount: 275000, refNo: null, rowsCount: 3, remarks: 'Basmati Rice Export'),
    SaleOrderEntity(docNumber: 'SO-0002', partyName: 'Faisal Commission Agent', date: '01/07/25', netAmount: 120000, refNo: '5', rowsCount: 1, remarks: 'RM Yellow Corn'),
    SaleOrderEntity(docNumber: 'SO-0001', partyName: 'Lahore Grain House', date: '01/07/25', netAmount: 850000, refNo: '1', rowsCount: 2, remarks: '100% Broken Rice'),
  ];

  @override
  Future<dynamic> createSaleOrder() async {
    throw UnimplementedError('createSaleOrder not implemented');
  }
}
