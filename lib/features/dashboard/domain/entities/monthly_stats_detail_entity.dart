import 'package:equatable/equatable.dart';

class MonthlyStatDetailPoint extends Equatable {
  final DateTime date;
  final double   amount;

  const MonthlyStatDetailPoint({required this.date, required this.amount});

  @override
  List<Object?> get props => [date, amount];
}
