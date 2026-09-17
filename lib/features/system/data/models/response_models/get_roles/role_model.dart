import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
abstract class RoleModel with _$RoleModel {
  const factory RoleModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SysKey') String? sysKey,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'FlgSystem') bool? flgSystem,
    @JsonKey(name: 'MisOrganizationId') int? misOrganizationId,
    @JsonKey(name: 'TTLUsers') int? totalUsers,
    @JsonKey(name: 'Archived') bool? archived,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}
