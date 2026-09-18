import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_model.freezed.dart';
part 'receipt_model.g.dart';

@freezed
abstract class ReceiptModel with _$ReceiptModel {
  const factory ReceiptModel({
    @JsonKey(name: "Id") int? id,
    @JsonKey(name: "DocNbr") String? docNbr,
    @JsonKey(name: "DocDate") DateTime? docDate,
    @JsonKey(name: "Mode") String? mode,
    @JsonKey(name: "TTLNetAmount") double? ttlNetAmount,
    @JsonKey(name: "Account") ReceiptAccount? account,
    @JsonKey(name: "Party") ReceiptParty? party,
    @JsonKey(name: "Currency") ReceiptCurrency? currency,
  }) = _ReceiptModel;

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
}

@freezed
abstract class ReceiptAccount with _$ReceiptAccount {
  const factory ReceiptAccount({
    @JsonKey(name: "Name") String? name,
  }) = _ReceiptAccount;

  factory ReceiptAccount.fromJson(Map<String, dynamic> json) =>
      _$ReceiptAccountFromJson(json);
}

@freezed
abstract class ReceiptParty with _$ReceiptParty {
  const factory ReceiptParty({
    @JsonKey(name: "FullName") String? fullName,
  }) = _ReceiptParty;

  factory ReceiptParty.fromJson(Map<String, dynamic> json) =>
      _$ReceiptPartyFromJson(json);
}

@freezed
abstract class ReceiptCurrency with _$ReceiptCurrency {
  const factory ReceiptCurrency({
    @JsonKey(name: "Symbol") String? symbol,
  }) = _ReceiptCurrency;

  factory ReceiptCurrency.fromJson(Map<String, dynamic> json) =>
      _$ReceiptCurrencyFromJson(json);
}
