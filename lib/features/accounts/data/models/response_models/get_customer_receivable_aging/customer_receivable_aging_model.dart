import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_receivable_aging_model.freezed.dart';
part 'customer_receivable_aging_model.g.dart';

@freezed
abstract class CustomerReceivableAgingModel
    with _$CustomerReceivableAgingModel {
  const factory CustomerReceivableAgingModel({
    @JsonKey(name: 'FirstSegmentAmount') @Default(0.0) double firstSegmentAmount,
    @JsonKey(name: 'SecondSegmentAmount')
    @Default(0.0)
    double secondSegmentAmount,
    @JsonKey(name: 'ThirdSegmentAmount') @Default(0.0) double thirdSegmentAmount,
    @JsonKey(name: 'FourthSegmentAmount')
    @Default(0.0)
    double fourthSegmentAmount,
    @JsonKey(name: 'TotalAmount') @Default(0.0) double totalAmount,
    @JsonKey(name: 'PartyCredits') @Default([]) List<PartyCreditModel> partyCredits,
  }) = _CustomerReceivableAgingModel;

  factory CustomerReceivableAgingModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReceivableAgingModelFromJson(json);
}

@freezed
abstract class PartyCreditModel with _$PartyCreditModel {
  const factory PartyCreditModel({
    @JsonKey(name: 'PartyId') int? partyId,
    @JsonKey(name: 'Party') PartyCreditPartyModel? party,
    @JsonKey(name: 'CreditRating') @Default('') String creditRating,
    @JsonKey(name: 'FirstSegmentAmount') @Default(0.0) double firstSegmentAmount,
    @JsonKey(name: 'SecondSegmentAmount')
    @Default(0.0)
    double secondSegmentAmount,
    @JsonKey(name: 'ThirdSegmentAmount') @Default(0.0) double thirdSegmentAmount,
    @JsonKey(name: 'FourthSegmentAmount')
    @Default(0.0)
    double fourthSegmentAmount,
    @JsonKey(name: 'TotalAmount') @Default(0.0) double totalAmount,
    @JsonKey(name: 'AvgDays') @Default(0.0) double avgDays,
  }) = _PartyCreditModel;

  factory PartyCreditModel.fromJson(Map<String, dynamic> json) =>
      _$PartyCreditModelFromJson(json);
}

@freezed
abstract class PartyCreditPartyModel with _$PartyCreditPartyModel {
  const factory PartyCreditPartyModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'PartyTypeId') int? partyTypeId,
    @JsonKey(name: 'LocationId') int? locationId,
    @JsonKey(name: 'LocationName') String? locationName,
    @JsonKey(name: 'PartyTypeName') String? partyTypeName,
  }) = _PartyCreditPartyModel;

  factory PartyCreditPartyModel.fromJson(Map<String, dynamic> json) =>
      _$PartyCreditPartyModelFromJson(json);
}
