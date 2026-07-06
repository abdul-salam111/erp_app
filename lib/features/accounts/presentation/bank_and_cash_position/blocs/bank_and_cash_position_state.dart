import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/bank_and_cash_position/bank_cash_item_entity.dart';

class BankAndCashPositionState extends Equatable {
  final List<BankCashItemEntity> items;
  final String? message;
  final ApiStatus apiStatus;

  const BankAndCashPositionState({
    this.items = const [],
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  BankAndCashPositionState copyWith({
    List<BankCashItemEntity>? items,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return BankAndCashPositionState(
      items: items ?? this.items,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [items, message, apiStatus];
}
