// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_receivable_aging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerReceivableAgingModel _$CustomerReceivableAgingModelFromJson(
  Map<String, dynamic> json,
) => _CustomerReceivableAgingModel(
  firstSegmentAmount: (json['FirstSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  secondSegmentAmount: (json['SecondSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  thirdSegmentAmount: (json['ThirdSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  fourthSegmentAmount: (json['FourthSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  totalAmount: (json['TotalAmount'] as num?)?.toDouble() ?? 0.0,
  partyCredits:
      (json['PartyCredits'] as List<dynamic>?)
          ?.map((e) => PartyCreditModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CustomerReceivableAgingModelToJson(
  _CustomerReceivableAgingModel instance,
) => <String, dynamic>{
  'FirstSegmentAmount': instance.firstSegmentAmount,
  'SecondSegmentAmount': instance.secondSegmentAmount,
  'ThirdSegmentAmount': instance.thirdSegmentAmount,
  'FourthSegmentAmount': instance.fourthSegmentAmount,
  'TotalAmount': instance.totalAmount,
  'PartyCredits': instance.partyCredits,
};

_PartyCreditModel _$PartyCreditModelFromJson(
  Map<String, dynamic> json,
) => _PartyCreditModel(
  partyId: (json['PartyId'] as num?)?.toInt(),
  party: json['Party'] == null
      ? null
      : PartyCreditPartyModel.fromJson(json['Party'] as Map<String, dynamic>),
  creditRating: json['CreditRating'] as String? ?? '',
  firstSegmentAmount: (json['FirstSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  secondSegmentAmount: (json['SecondSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  thirdSegmentAmount: (json['ThirdSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  fourthSegmentAmount: (json['FourthSegmentAmount'] as num?)?.toDouble() ?? 0.0,
  totalAmount: (json['TotalAmount'] as num?)?.toDouble() ?? 0.0,
  avgDays: (json['AvgDays'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PartyCreditModelToJson(_PartyCreditModel instance) =>
    <String, dynamic>{
      'PartyId': instance.partyId,
      'Party': instance.party,
      'CreditRating': instance.creditRating,
      'FirstSegmentAmount': instance.firstSegmentAmount,
      'SecondSegmentAmount': instance.secondSegmentAmount,
      'ThirdSegmentAmount': instance.thirdSegmentAmount,
      'FourthSegmentAmount': instance.fourthSegmentAmount,
      'TotalAmount': instance.totalAmount,
      'AvgDays': instance.avgDays,
    };

_PartyCreditPartyModel _$PartyCreditPartyModelFromJson(
  Map<String, dynamic> json,
) => _PartyCreditPartyModel(
  id: (json['Id'] as num?)?.toInt(),
  fullName: json['FullName'] as String?,
  partyTypeId: (json['PartyTypeId'] as num?)?.toInt(),
  locationId: (json['LocationId'] as num?)?.toInt(),
  locationName: json['LocationName'] as String?,
  partyTypeName: json['PartyTypeName'] as String?,
);

Map<String, dynamic> _$PartyCreditPartyModelToJson(
  _PartyCreditPartyModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'FullName': instance.fullName,
  'PartyTypeId': instance.partyTypeId,
  'LocationId': instance.locationId,
  'LocationName': instance.locationName,
  'PartyTypeName': instance.partyTypeName,
};
