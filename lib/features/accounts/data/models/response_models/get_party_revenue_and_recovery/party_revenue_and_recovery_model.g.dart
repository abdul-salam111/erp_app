// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_revenue_and_recovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevenueAndRecoverySummaryModel _$RevenueAndRecoverySummaryModelFromJson(
  Map<String, dynamic> json,
) => _RevenueAndRecoverySummaryModel(
  monthName: json['MonthName'] as String? ?? '',
  year: (json['Year'] as num?)?.toInt() ?? 0,
  month: (json['Month'] as num?)?.toInt() ?? 0,
  totalRevenueAmount: (json['TotalRevenueAmount'] as num?)?.toDouble() ?? 0.0,
  totalRecoveryAmount: (json['TotalRecoveryAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$RevenueAndRecoverySummaryModelToJson(
  _RevenueAndRecoverySummaryModel instance,
) => <String, dynamic>{
  'MonthName': instance.monthName,
  'Year': instance.year,
  'Month': instance.month,
  'TotalRevenueAmount': instance.totalRevenueAmount,
  'TotalRecoveryAmount': instance.totalRecoveryAmount,
};

_PartyRevenueAndRecoveryModel _$PartyRevenueAndRecoveryModelFromJson(
  Map<String, dynamic> json,
) => _PartyRevenueAndRecoveryModel(
  totalRevenueAmount: (json['TotalRevenueAmount'] as num?)?.toDouble() ?? 0.0,
  averageRecoveryAmount:
      (json['AverageRecoveryAmount'] as num?)?.toDouble() ?? 0.0,
  averageRevenueAmount:
      (json['AverageRevenueAmount'] as num?)?.toDouble() ?? 0.0,
  summaries:
      (json['RevenueAndRecoverySummaries'] as List<dynamic>?)
          ?.map(
            (e) => RevenueAndRecoverySummaryModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$PartyRevenueAndRecoveryModelToJson(
  _PartyRevenueAndRecoveryModel instance,
) => <String, dynamic>{
  'TotalRevenueAmount': instance.totalRevenueAmount,
  'AverageRecoveryAmount': instance.averageRecoveryAmount,
  'AverageRevenueAmount': instance.averageRevenueAmount,
  'RevenueAndRecoverySummaries': instance.summaries,
};
