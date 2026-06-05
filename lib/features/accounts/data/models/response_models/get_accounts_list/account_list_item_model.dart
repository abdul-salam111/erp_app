import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_list_item_model.freezed.dart';
part 'account_list_item_model.g.dart';

String _groupName(dynamic json) =>
    (json as Map<String, dynamic>?)?['Name'] as String? ?? '';

String _breadcrumb(dynamic json) =>
    (json as Map<String, dynamic>?)?['Breadcrumb'] as String? ?? '';

@freezed
abstract class AccountListItemModel with _$AccountListItemModel {
  const factory AccountListItemModel({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Name', defaultValue: '') required String name,
    @JsonKey(name: 'Group', fromJson: _groupName) required String group,
    @JsonKey(name: 'AccType', fromJson: _breadcrumb) required String breadcrumb,
  }) = _AccountListItemModel;

  factory AccountListItemModel.fromJson(Map<String, dynamic> json) =>
      _$AccountListItemModelFromJson(json);
}
