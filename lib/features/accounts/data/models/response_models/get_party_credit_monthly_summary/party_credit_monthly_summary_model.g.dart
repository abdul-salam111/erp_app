// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_credit_monthly_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartyCreditMonthlySummaryModel _$PartyCreditMonthlySummaryModelFromJson(
  Map<String, dynamic> json,
) => _PartyCreditMonthlySummaryModel(
  monthName: json['MonthName'] as String? ?? '',
  year: (json['Year'] as num?)?.toInt() ?? 0,
  totalAmount: (json['TotalAmount'] as num?)?.toDouble() ?? 0.0,
  month: (json['Month'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PartyCreditMonthlySummaryModelToJson(
  _PartyCreditMonthlySummaryModel instance,
) => <String, dynamic>{
  'MonthName': instance.monthName,
  'Year': instance.year,
  'TotalAmount': instance.totalAmount,
  'Month': instance.month,
};
