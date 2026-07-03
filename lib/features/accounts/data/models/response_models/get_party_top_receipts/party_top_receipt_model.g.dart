// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_top_receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartyTopReceiptAccountModel _$PartyTopReceiptAccountModelFromJson(
  Map<String, dynamic> json,
) => _PartyTopReceiptAccountModel(
  id: (json['Id'] as num).toInt(),
  name: json['Name'] as String? ?? '',
  accTypeId: (json['AccTypeId'] as num?)?.toInt() ?? 0,
  groupId: (json['GroupId'] as num?)?.toInt() ?? 0,
  flgControlledAcc: json['FlgControlledAcc'] as bool? ?? false,
);

Map<String, dynamic> _$PartyTopReceiptAccountModelToJson(
  _PartyTopReceiptAccountModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'AccTypeId': instance.accTypeId,
  'GroupId': instance.groupId,
  'FlgControlledAcc': instance.flgControlledAcc,
};

_PartyTopReceiptModel _$PartyTopReceiptModelFromJson(
  Map<String, dynamic> json,
) => _PartyTopReceiptModel(
  id: (json['Id'] as num).toInt(),
  docNbr: json['DocNbr'] as String? ?? '',
  docDate: json['DocDate'] as String? ?? '',
  amount: (json['Amount'] as num?)?.toDouble() ?? 0.0,
  mode: json['Mode'] as String? ?? '',
  account: json['Account'] == null
      ? null
      : PartyTopReceiptAccountModel.fromJson(
          json['Account'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PartyTopReceiptModelToJson(
  _PartyTopReceiptModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'DocNbr': instance.docNbr,
  'DocDate': instance.docDate,
  'Amount': instance.amount,
  'Mode': instance.mode,
  'Account': instance.account,
};
