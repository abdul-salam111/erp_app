import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashbook_account_model.freezed.dart';
part 'cashbook_account_model.g.dart';

@freezed
abstract class CashbookAccountModel with _$CashbookAccountModel {
  const factory CashbookAccountModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Group') CashbookAccountGroupModel? group,
    @JsonKey(name: 'AccType') CashbookAccTypeModel? accType,
  }) = _CashbookAccountModel;

  factory CashbookAccountModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookAccountModelFromJson(json);
}

@freezed
abstract class CashbookAccountGroupModel with _$CashbookAccountGroupModel {
  const factory CashbookAccountGroupModel({
    @JsonKey(name: 'Name') String? name,
  }) = _CashbookAccountGroupModel;

  factory CashbookAccountGroupModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookAccountGroupModelFromJson(json);
}

@freezed
abstract class CashbookAccTypeModel with _$CashbookAccTypeModel {
  const factory CashbookAccTypeModel({
    @JsonKey(name: 'Breadcrumb') String? breadcrumb,
    @JsonKey(name: 'SysKey') String? sysKey,
  }) = _CashbookAccTypeModel;

  factory CashbookAccTypeModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookAccTypeModelFromJson(json);
}
