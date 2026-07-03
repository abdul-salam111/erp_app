import 'package:freezed_annotation/freezed_annotation.dart';

part 'party_balance_detail_model.freezed.dart';
part 'party_balance_detail_model.g.dart';

@freezed
abstract class PartyDetailModel with _$PartyDetailModel {
  const factory PartyDetailModel({
    @JsonKey(name: 'Id') @Default(0) int id,
    @JsonKey(name: 'FullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'PartyTypeId') @Default(0) int partyTypeId,
    @JsonKey(name: 'LocationId') @Default(0) int locationId,
    @JsonKey(name: 'LocationName') @Default('') String locationName,
    @JsonKey(name: 'PartyTypeName') @Default('') String partyTypeName,
  }) = _PartyDetailModel;

  factory PartyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PartyDetailModelFromJson(json);
}

@freezed
abstract class PartyBalanceDetailModel with _$PartyBalanceDetailModel {
  const factory PartyBalanceDetailModel({
    @JsonKey(name: 'PartyId') @Default(0) int partyId,
    @JsonKey(name: 'Party') PartyDetailModel? party,
    @JsonKey(name: 'FinYearId') @Default(0) int finYearId,
    @JsonKey(name: 'OpeningAmount') @Default(0.0) double openingAmount,
    @JsonKey(name: 'DrAmount') @Default(0.0) double drAmount,
    @JsonKey(name: 'CrAmount') @Default(0.0) double crAmount,
    @JsonKey(name: 'Balance') @Default(0.0) double balance,
  }) = _PartyBalanceDetailModel;

  factory PartyBalanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PartyBalanceDetailModelFromJson(json);
}
