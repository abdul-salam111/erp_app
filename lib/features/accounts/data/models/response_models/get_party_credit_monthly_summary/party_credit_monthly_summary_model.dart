import 'package:freezed_annotation/freezed_annotation.dart';

part 'party_credit_monthly_summary_model.freezed.dart';
part 'party_credit_monthly_summary_model.g.dart';

@freezed
abstract class PartyCreditMonthlySummaryModel
    with _$PartyCreditMonthlySummaryModel {
  const factory PartyCreditMonthlySummaryModel({
    @JsonKey(name: 'MonthName', defaultValue: '') required String monthName,
    @JsonKey(name: 'Year', defaultValue: 0) required int year,
    @JsonKey(name: 'TotalAmount') @Default(0.0) double totalAmount,
    @JsonKey(name: 'Month', defaultValue: 0) required int month,
  }) = _PartyCreditMonthlySummaryModel;

  factory PartyCreditMonthlySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PartyCreditMonthlySummaryModelFromJson(json);
}
