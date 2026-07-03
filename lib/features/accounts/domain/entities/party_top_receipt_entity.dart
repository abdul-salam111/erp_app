import 'package:equatable/equatable.dart';

class PartyTopReceiptAccountEntity extends Equatable {
  final int id;
  final String name;

  const PartyTopReceiptAccountEntity({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}

class PartyTopReceiptEntity extends Equatable {
  final int id;
  final String docNbr;
  final String docDate;
  final double amount;
  final String mode;
  final PartyTopReceiptAccountEntity? account;

  const PartyTopReceiptEntity({
    required this.id,
    required this.docNbr,
    required this.docDate,
    required this.amount,
    required this.mode,
    this.account,
  });

  @override
  List<Object?> get props => [id, docNbr, docDate, amount, mode, account];
}
