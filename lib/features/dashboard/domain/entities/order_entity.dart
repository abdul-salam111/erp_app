import 'package:equatable/equatable.dart';

class NewOrdersEntity extends Equatable {
  final int      id;
  final DateTime docDate;
  final String   docNbr;
  final String   partyName;
  final String   locationName;
  final double   ttlNetAmount;

  const NewOrdersEntity({
    required this.id,
    required this.docDate,
    required this.docNbr,
    required this.partyName,
    required this.locationName,
    required this.ttlNetAmount,
  });

  @override
  List<Object?> get props => [id, docDate, docNbr, partyName, locationName, ttlNetAmount];
}
