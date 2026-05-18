import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class ScanDocumentState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const ScanDocumentState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  ScanDocumentState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return ScanDocumentState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
