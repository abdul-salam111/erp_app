import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class AnalyticsState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const AnalyticsState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  AnalyticsState copyWith({
    dynamic data,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
  }) {
    return AnalyticsState(
      data: data ?? this.data,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
