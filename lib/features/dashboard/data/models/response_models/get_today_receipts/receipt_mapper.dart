import '../../../../domain/entities/receipt_entity.dart';
import 'receipt_model.dart';

extension ReceiptModelMapper on ReceiptModel {
  ReceiptEntity toEntity() => ReceiptEntity(
    id: id ?? 0,
    docNbr: docNbr ?? '',
    docDate: docDate ?? DateTime.now(),
    mode: mode ?? '',
    amount: ttlNetAmount ?? 0,
    partyName: party?.fullName ?? '',
    accountName: account?.name ?? '',
    currencySymbol: currency?.symbol ?? '',
  );
}
