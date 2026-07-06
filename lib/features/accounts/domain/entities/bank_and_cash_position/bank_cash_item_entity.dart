import 'package:equatable/equatable.dart';

class BankCashItemEntity extends Equatable {
 
  final String accountTitle;
  final String accountType;
  final String accountNbr;
  final double amount;

  const BankCashItemEntity({
  
    required this.accountTitle,
    required this.accountType,
    required this.accountNbr,
    required this.amount,
  });

  bool get isBank => accountType.contains('bank');
  bool get isCash => accountType.contains('cash');
  bool get isCredit => amount < 0;

  @override
  List<Object> get props => [ accountTitle, accountType, accountNbr, amount];
}
