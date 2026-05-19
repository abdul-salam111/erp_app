import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class SecurityState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const SecurityState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  SecurityState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return SecurityState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
