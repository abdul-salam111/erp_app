import 'package:equatable/equatable.dart';

class CustomerReceivableItemEntity extends Equatable {
  final String partyName;
  final String? location;
  final double opening;
  final bool openingIsDr;
  final double debit;
  final double credit;
  final double balance;
  final bool balanceIsDr;

  const CustomerReceivableItemEntity({
    required this.partyName,
    this.location,
    required this.opening,
    required this.openingIsDr,
    required this.debit,
    required this.credit,
    required this.balance,
    required this.balanceIsDr,
  });

  @override
  List<Object?> get props => [
        partyName,
        location,
        opening,
        openingIsDr,
        debit,
        credit,
        balance,
        balanceIsDr,
      ];
}
