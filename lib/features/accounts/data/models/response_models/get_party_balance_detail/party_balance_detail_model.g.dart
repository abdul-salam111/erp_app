// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_balance_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartyDetailModel _$PartyDetailModelFromJson(Map<String, dynamic> json) =>
    _PartyDetailModel(
      id: (json['Id'] as num?)?.toInt() ?? 0,
      fullName: json['FullName'] as String? ?? '',
      partyTypeId: (json['PartyTypeId'] as num?)?.toInt() ?? 0,
      locationId: (json['LocationId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PartyDetailModelToJson(_PartyDetailModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FullName': instance.fullName,
      'PartyTypeId': instance.partyTypeId,
      'LocationId': instance.locationId,
    };

_PartyBalanceDetailModel _$PartyBalanceDetailModelFromJson(
  Map<String, dynamic> json,
) => _PartyBalanceDetailModel(
  partyId: (json['PartyId'] as num?)?.toInt() ?? 0,
  party: json['Party'] == null
      ? null
      : PartyDetailModel.fromJson(json['Party'] as Map<String, dynamic>),
  finYearId: (json['FinYearId'] as num?)?.toInt() ?? 0,
  openingAmount: (json['OpeningAmount'] as num?)?.toDouble() ?? 0.0,
  drAmount: (json['DrAmount'] as num?)?.toDouble() ?? 0.0,
  crAmount: (json['CrAmount'] as num?)?.toDouble() ?? 0.0,
  balance: (json['Balance'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PartyBalanceDetailModelToJson(
  _PartyBalanceDetailModel instance,
) => <String, dynamic>{
  'PartyId': instance.partyId,
  'Party': instance.party,
  'FinYearId': instance.finYearId,
  'OpeningAmount': instance.openingAmount,
  'DrAmount': instance.drAmount,
  'CrAmount': instance.crAmount,
  'Balance': instance.balance,
};
