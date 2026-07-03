import 'package:freezed_annotation/freezed_annotation.dart';

part 'party_unpaid_debit_model.freezed.dart';
part 'party_unpaid_debit_model.g.dart';

@freezed
abstract class PartyUnpaidDebitModel with _$PartyUnpaidDebitModel {
  const factory PartyUnpaidDebitModel({
    @JsonKey(name: 'DebitId') required int debitId,
    @JsonKey(name: 'PartyId') required int partyId,
    @JsonKey(name: 'DocNbr', defaultValue: '') required String docNbr,
    @JsonKey(name: 'DocDate', defaultValue: '') required String docDate,
    @JsonKey(name: 'RefrenceDate', defaultValue: '') required String referenceDate,
    @JsonKey(name: 'TotalAmount') @Default(0.0) double totalAmount,
    @JsonKey(name: 'AllocatedAmount') @Default(0.0) double allocatedAmount,
    @JsonKey(name: 'RemainingAmount') @Default(0.0) double remainingAmount,
    @JsonKey(name: 'MarkupAmount') @Default(0.0) double markupAmount,
    @JsonKey(name: 'DaysOverdue') @Default(0) int daysOverdue,
    @JsonKey(name: 'Status', defaultValue: '') required String status,
  }) = _PartyUnpaidDebitModel;

  factory PartyUnpaidDebitModel.fromJson(Map<String, dynamic> json) =>
      _$PartyUnpaidDebitModelFromJson(json);
}
