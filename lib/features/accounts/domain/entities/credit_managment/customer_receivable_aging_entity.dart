import 'package:equatable/equatable.dart';

class CustomerReceivableAgingEntity extends Equatable {
  final double firstSegmentAmount;
  final double secondSegmentAmount;
  final double thirdSegmentAmount;
  final double fourthSegmentAmount;
  final double totalAmount;
  final List<PartyCreditEntity> partyCredits;

  const CustomerReceivableAgingEntity({
    required this.firstSegmentAmount,
    required this.secondSegmentAmount,
    required this.thirdSegmentAmount,
    required this.fourthSegmentAmount,
    required this.totalAmount,
    required this.partyCredits,
  });

  @override
  List<Object> get props => [
        firstSegmentAmount,
        secondSegmentAmount,
        thirdSegmentAmount,
        fourthSegmentAmount,
        totalAmount,
        partyCredits,
      ];
}

class PartyCreditEntity extends Equatable {
  final int partyId;
  final String partyName;
  final String? location;
  final String creditRating;
  final double firstSegmentAmount;
  final double secondSegmentAmount;
  final double thirdSegmentAmount;
  final double fourthSegmentAmount;
  final double totalAmount;
  final double avgDays;

  const PartyCreditEntity({
    required this.partyId,
    required this.partyName,
    this.location,
    required this.creditRating,
    required this.firstSegmentAmount,
    required this.secondSegmentAmount,
    required this.thirdSegmentAmount,
    required this.fourthSegmentAmount,
    required this.totalAmount,
    required this.avgDays,
  });

  @override
  List<Object?> get props => [
        partyId,
        partyName,
        location,
        creditRating,
        firstSegmentAmount,
        secondSegmentAmount,
        thirdSegmentAmount,
        fourthSegmentAmount,
        totalAmount,
        avgDays,
      ];
}
