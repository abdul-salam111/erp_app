import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/doc_upload_request_entity.dart';

class DocumentUploadState extends Equatable {
  final ApiStatus apiStatus;
  final DocUploadRequestEntity? uploadedRequest;
  final String? message;

  const DocumentUploadState({
    this.apiStatus = ApiStatus.INITIAL,
    this.uploadedRequest,
    this.message,
  });

  DocumentUploadState copyWith({
    ApiStatus? apiStatus,
    DocUploadRequestEntity? uploadedRequest,
    String? message,
  }) {
    return DocumentUploadState(
      apiStatus: apiStatus ?? this.apiStatus,
      uploadedRequest: uploadedRequest ?? this.uploadedRequest,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [apiStatus, uploadedRequest, message];
}
