import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/doc_upload_request_entity.dart';

class DocUploadRequestState extends Equatable {
  final List<DocUploadRequestEntity> requests;
  final ApiStatus apiStatus;
  final String? message;

  const DocUploadRequestState({
    this.requests = const [],
    this.apiStatus = ApiStatus.INITIAL,
    this.message,
  });

  DocUploadRequestState copyWith({
    List<DocUploadRequestEntity>? requests,
    ApiStatus? apiStatus,
    String? message,
  }) {
    return DocUploadRequestState(
      requests: requests ?? this.requests,
      apiStatus: apiStatus ?? this.apiStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [requests, apiStatus, message];
}
