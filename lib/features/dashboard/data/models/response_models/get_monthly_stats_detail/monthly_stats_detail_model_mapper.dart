import '../../../../domain/entities/monthly_stats_detail_entity.dart';
import 'monthly_stats_detail_model.dart';

extension MonthlyStatDetailModelMapper on MonthlyStatDetailModel {
  MonthlyStatDetailPoint toEntity() => MonthlyStatDetailPoint(
    date:   DateTime.parse(date),
    amount: amount,
  );
}
