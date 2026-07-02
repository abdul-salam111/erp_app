// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashbook_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashbookAccountModel _$CashbookAccountModelFromJson(
  Map<String, dynamic> json,
) => _CashbookAccountModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String,
  accType: json['AccType'] == null
      ? null
      : CashbookAccTypeModel.fromJson(json['AccType'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CashbookAccountModelToJson(
  _CashbookAccountModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'AccType': instance.accType,
};

_CashbookAccTypeModel _$CashbookAccTypeModelFromJson(
  Map<String, dynamic> json,
) => _CashbookAccTypeModel(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
);

Map<String, dynamic> _$CashbookAccTypeModelToJson(
  _CashbookAccTypeModel instance,
) => <String, dynamic>{'Name': instance.name, 'SysKey': instance.sysKey};
