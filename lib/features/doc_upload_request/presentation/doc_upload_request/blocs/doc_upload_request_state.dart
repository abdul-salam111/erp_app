import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/doc_upload_request_entity.dart';

class DocUploadRequestState extends Equatable {
  final List<DocUploadRequestEntity> requests;
  final ApiStatus apiStatus;
  final String? message;

  /// The `flgCompleted` filter the current [requests] (or an in-flight
  /// fetch) corresponds to — lets callers tell whether cached data already
  /// matches what they'd otherwise fetch, so they can skip a refetch.
  final bool flgCompleted;

  const DocUploadRequestState({
    this.requests = const [],
    this.apiStatus = ApiStatus.INITIAL,
    this.message,
    this.flgCompleted = false,
  });

  DocUploadRequestState copyWith({
    List<DocUploadRequestEntity>? requests,
    ApiStatus? apiStatus,
    String? message,
    bool? flgCompleted,
  }) {
    return DocUploadRequestState(
      requests: requests ?? this.requests,
      apiStatus: apiStatus ?? this.apiStatus,
      message: message ?? this.message,
      flgCompleted: flgCompleted ?? this.flgCompleted,
    );
  }

  @override
  List<Object?> get props => [requests, apiStatus, message, flgCompleted];
}
