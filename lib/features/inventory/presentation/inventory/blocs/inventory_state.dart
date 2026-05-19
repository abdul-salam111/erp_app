import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class InventoryState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const InventoryState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  InventoryState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return InventoryState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
