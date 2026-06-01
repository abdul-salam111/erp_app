// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_stats_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonthlyStatDetailModel _$MonthlyStatDetailModelFromJson(
  Map<String, dynamic> json,
) => _MonthlyStatDetailModel(
  date: json['Date'] as String,
  amount: (json['Amount'] as num).toDouble(),
);

Map<String, dynamic> _$MonthlyStatDetailModelToJson(
  _MonthlyStatDetailModel instance,
) => <String, dynamic>{'Date': instance.date, 'Amount': instance.amount};
