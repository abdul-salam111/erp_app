import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class PurchaseOrderState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const PurchaseOrderState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  PurchaseOrderState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return PurchaseOrderState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
