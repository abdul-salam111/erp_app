import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class AccountsState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const AccountsState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  AccountsState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return AccountsState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
