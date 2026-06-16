import 'package:freezed_annotation/freezed_annotation.dart';

part 'due_receipt_count_model.freezed.dart';
part 'due_receipt_count_model.g.dart';

@freezed
abstract class DueReceiptCountModel with _$DueReceiptCountModel {
  const factory DueReceiptCountModel({
    @JsonKey(name: 'TTLRecoveryAmount') @Default(0) double ttlRecoveryAmount,
    @JsonKey(name: 'TTLReceivedAmount') @Default(0) double ttlReceivedAmount,
    @JsonKey(name: 'TTLPostponeAmount') @Default(0) double ttlPostponeAmount,
  }) = _DueReceiptCountModel;

  factory DueReceiptCountModel.fromJson(Map<String, dynamic> json) =>
      _$DueReceiptCountModelFromJson(json);
}
