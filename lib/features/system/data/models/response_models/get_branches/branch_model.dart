import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

@freezed
abstract class BranchModel with _$BranchModel {
  const factory BranchModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'MisOrganizationId') int? misOrganizationId,
    @JsonKey(name: 'LocationId') int? locationId,
    @JsonKey(name: 'Archived') bool? archived,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
