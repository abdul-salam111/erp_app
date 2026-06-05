import 'package:freezed_annotation/freezed_annotation.dart';
part 'party_list_item_model.freezed.dart';
part 'party_list_item_model.g.dart';

String _partyTypeName(dynamic json) =>
    (json as Map<String, dynamic>?)?['L1TypeName'] as String? ?? '';

@freezed
abstract class PartyListItemModel with _$PartyListItemModel {
  const factory PartyListItemModel({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'FullName', defaultValue: '') required String name,
    @JsonKey(name: 'PartyType', fromJson: _partyTypeName) required String partyType,
  }) = _PartyListItemModel;

  factory PartyListItemModel.fromJson(Map<String, dynamic> json) =>
      _$PartyListItemModelFromJson(json);
}
