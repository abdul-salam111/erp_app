import 'package:freezed_annotation/freezed_annotation.dart';
part 'bank_cash_item_model.freezed.dart';
part 'bank_cash_item_model.g.dart';

@freezed
abstract class BankCashItemModel with _$BankCashItemModel {
  const factory BankCashItemModel({
    @JsonKey(name: 'AccountId') required int accountId,
    @JsonKey(name: 'AccountTitle', defaultValue: '') required String accountTitle,
    @JsonKey(name: 'AccountType', defaultValue: '') required String accountType,
    @JsonKey(name: 'AccountNbr', defaultValue: '') required String accountNbr,
    @JsonKey(name: 'Amount') required double amount,
  }) = _BankCashItemModel;

  factory BankCashItemModel.fromJson(Map<String, dynamic> json) =>
      _$BankCashItemModelFromJson(json);
}
