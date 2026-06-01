import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_stats_detail_model.freezed.dart';
part 'monthly_stats_detail_model.g.dart';

@freezed
abstract class MonthlyStatDetailModel with _$MonthlyStatDetailModel {
  const factory MonthlyStatDetailModel({
    @JsonKey(name: 'Date')   required String date,
    @JsonKey(name: 'Amount') required double amount,
  }) = _MonthlyStatDetailModel;

  factory MonthlyStatDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatDetailModelFromJson(json);
}
