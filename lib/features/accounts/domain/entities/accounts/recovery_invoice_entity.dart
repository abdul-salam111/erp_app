import 'package:equatable/equatable.dart';

class RecoveryInvoicePartyEntity extends Equatable {
  final int id;
  final String fullName;
  final int partyTypeId;
  final int locationId;
  final String locationName;

  const RecoveryInvoicePartyEntity({
    required this.id,
    required this.fullName,
    required this.partyTypeId,
    required this.locationId,
    this.locationName = '',
  });

  @override
  List<Object> get props =>
      [id, fullName, partyTypeId, locationId, locationName];
}

class RecoveryInvoiceEntity extends Equatable {
  final int id;
  final String docNbr;
  final String docDate;
  final double docAmount;
  final double remainingAmount;
  final RecoveryInvoicePartyEntity party;
  final String status;
  final int overDueDays;
  final bool flgPostpone;

  const RecoveryInvoiceEntity({
    required this.id,
    required this.docNbr,
    required this.docDate,
    required this.docAmount,
    required this.remainingAmount,
    required this.party,
    required this.status,
    required this.overDueDays,
    required this.flgPostpone,
  });

  String get initials {
    final parts = party.fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return '?';
  }

  @override
  List<Object> get props => [
        id,
        docNbr,
        docDate,
        docAmount,
        remainingAmount,
        party,
        status,
        overDueDays,
        flgPostpone,
      ];
}
