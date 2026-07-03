import 'package:freezed_annotation/freezed_annotation.dart';

part 'party_top_receipt_model.freezed.dart';
part 'party_top_receipt_model.g.dart';

@freezed
abstract class PartyTopReceiptAccountModel with _$PartyTopReceiptAccountModel {
  const factory PartyTopReceiptAccountModel({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Name', defaultValue: '') required String name,
    @JsonKey(name: 'AccTypeId') @Default(0) int accTypeId,
    @JsonKey(name: 'GroupId') @Default(0) int groupId,
    @JsonKey(name: 'FlgControlledAcc') @Default(false) bool flgControlledAcc,
  }) = _PartyTopReceiptAccountModel;

  factory PartyTopReceiptAccountModel.fromJson(Map<String, dynamic> json) =>
      _$PartyTopReceiptAccountModelFromJson(json);
}

@freezed
abstract class PartyTopReceiptModel with _$PartyTopReceiptModel {
  const factory PartyTopReceiptModel({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'DocNbr', defaultValue: '') required String docNbr,
    @JsonKey(name: 'DocDate', defaultValue: '') required String docDate,
    @JsonKey(name: 'Amount') @Default(0.0) double amount,
    @JsonKey(name: 'Mode', defaultValue: '') required String mode,
    @JsonKey(name: 'Account') PartyTopReceiptAccountModel? account,
  }) = _PartyTopReceiptModel;

  factory PartyTopReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$PartyTopReceiptModelFromJson(json);
}
