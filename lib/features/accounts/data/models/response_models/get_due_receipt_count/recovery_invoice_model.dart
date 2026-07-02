class RecoveryInvoicePartyModel {
  final int id;
  final String fullName;
  final int partyTypeId;
  final int locationId;

  const RecoveryInvoicePartyModel({
    required this.id,
    required this.fullName,
    required this.partyTypeId,
    required this.locationId,
  });

  factory RecoveryInvoicePartyModel.fromJson(Map<String, dynamic> json) =>
      RecoveryInvoicePartyModel(
        id: (json['Id'] as num).toInt(),
        fullName: json['FullName'] as String,
        partyTypeId: (json['PartyTypeId'] as num).toInt(),
        locationId: (json['LocationId'] as num).toInt(),
      );
}

class RecoveryInvoiceModel {
  final int id;
  final String docNbr;
  final String docDate;
  final double docAmount;
  final double remainingAmount;
  final RecoveryInvoicePartyModel party;
  final String status;
  final int overDueDays;
  final bool flgPostpone;

  const RecoveryInvoiceModel({
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

  factory RecoveryInvoiceModel.fromJson(Map<String, dynamic> json) =>
      RecoveryInvoiceModel(
        id: (json['Id'] as num).toInt(),
        docNbr: json['DocNbr'] as String,
        docDate: json['DocDate'] as String,
        docAmount: (json['DocAmount'] as num).toDouble(),
        remainingAmount: (json['RemainingAmount'] as num).toDouble(),
        party: RecoveryInvoicePartyModel.fromJson(
          json['Party'] as Map<String, dynamic>,
        ),
        status: json['Status'] as String,
        overDueDays: (json['OverDueDays'] as num).toInt(),
        flgPostpone: json['FlgPostpone'] as bool,
      );
}
