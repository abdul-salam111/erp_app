import 'package:equatable/equatable.dart';

class DueReceiptCountEntity extends Equatable {
  final double ttlRecoveryAmount;
  final double ttlReceivedAmount;
  final double ttlPostponeAmount;

  const DueReceiptCountEntity({
    required this.ttlRecoveryAmount,
    required this.ttlReceivedAmount,
    required this.ttlPostponeAmount,
  });

  @override
  List<Object> get props => [
        ttlRecoveryAmount,
        ttlReceivedAmount,
        ttlPostponeAmount,
      ];
}
