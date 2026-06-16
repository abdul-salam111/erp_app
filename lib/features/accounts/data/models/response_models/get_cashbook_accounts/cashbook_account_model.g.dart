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
  group: json['Group'] == null
      ? null
      : CashbookAccountGroupModel.fromJson(
          json['Group'] as Map<String, dynamic>,
        ),
  accType: json['AccType'] == null
      ? null
      : CashbookAccTypeModel.fromJson(json['AccType'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CashbookAccountModelToJson(
  _CashbookAccountModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'Group': instance.group,
  'AccType': instance.accType,
};

_CashbookAccountGroupModel _$CashbookAccountGroupModelFromJson(
  Map<String, dynamic> json,
) => _CashbookAccountGroupModel(name: json['Name'] as String?);

Map<String, dynamic> _$CashbookAccountGroupModelToJson(
  _CashbookAccountGroupModel instance,
) => <String, dynamic>{'Name': instance.name};

_CashbookAccTypeModel _$CashbookAccTypeModelFromJson(
  Map<String, dynamic> json,
) => _CashbookAccTypeModel(
  breadcrumb: json['Breadcrumb'] as String?,
  sysKey: json['SysKey'] as String?,
);

Map<String, dynamic> _$CashbookAccTypeModelToJson(
  _CashbookAccTypeModel instance,
) => <String, dynamic>{
  'Breadcrumb': instance.breadcrumb,
  'SysKey': instance.sysKey,
};
