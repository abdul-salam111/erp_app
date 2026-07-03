import 'package:freezed_annotation/freezed_annotation.dart';

part 'party_revenue_and_recovery_model.freezed.dart';
part 'party_revenue_and_recovery_model.g.dart';

@freezed
abstract class RevenueAndRecoverySummaryModel
    with _$RevenueAndRecoverySummaryModel {
  const factory RevenueAndRecoverySummaryModel({
    @JsonKey(name: 'MonthName', defaultValue: '') required String monthName,
    @JsonKey(name: 'Year') @Default(0) int year,
    @JsonKey(name: 'Month') @Default(0) int month,
    @JsonKey(name: 'TotalRevenueAmount') @Default(0.0) double totalRevenueAmount,
    @JsonKey(name: 'TotalRecoveryAmount') @Default(0.0) double totalRecoveryAmount,
  }) = _RevenueAndRecoverySummaryModel;

  factory RevenueAndRecoverySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueAndRecoverySummaryModelFromJson(json);
}

@freezed
abstract class PartyRevenueAndRecoveryModel
    with _$PartyRevenueAndRecoveryModel {
  const factory PartyRevenueAndRecoveryModel({
    @JsonKey(name: 'TotalRevenueAmount') @Default(0.0) double totalRevenueAmount,
    @JsonKey(name: 'AverageRecoveryAmount') @Default(0.0) double averageRecoveryAmount,
    @JsonKey(name: 'AverageRevenueAmount') @Default(0.0) double averageRevenueAmount,
    @JsonKey(name: 'RevenueAndRecoverySummaries')
    @Default([])
    List<RevenueAndRecoverySummaryModel> summaries,
  }) = _PartyRevenueAndRecoveryModel;

  factory PartyRevenueAndRecoveryModel.fromJson(Map<String, dynamic> json) =>
      _$PartyRevenueAndRecoveryModelFromJson(json);
}
