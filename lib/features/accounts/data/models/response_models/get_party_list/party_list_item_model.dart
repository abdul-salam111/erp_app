import 'package:freezed_annotation/freezed_annotation.dart';
part 'party_list_item_model.freezed.dart';
part 'party_list_item_model.g.dart';

@freezed
abstract class PartyListItemModel with _$PartyListItemModel {
  const factory PartyListItemModel({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'FullName', defaultValue: '') required String name,
  }) = _PartyListItemModel;

  factory PartyListItemModel.fromJson(Map<String, dynamic> json) =>
      _$PartyListItemModelFromJson(json);
}
