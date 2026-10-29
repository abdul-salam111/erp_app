// DocUploadRequest feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
//
// The list/badge UI lives on the Documents screen
// (scan_document/widgets/pending_doc_requests_section.dart); the upload
// action's bottom sheet + preview page live under presentation/document_upload.

// Domain
export 'domain/entities/doc_upload_request_entity.dart';
export 'domain/repositories/doc_upload_request_repository.dart';
export 'domain/usecases/get_doc_upload_requests_usecase.dart';
export 'domain/usecases/upload_document_usecase.dart';

// Data
export 'data/datasources/remote_doc_upload_request_datasource.dart';
export 'data/models/response_models/doc_upload_request_model.dart';
export 'data/mappers/doc_upload_request_mappers.dart';
export 'data/repositories_impl/doc_upload_request_repository_impl.dart';

// Presentation — doc_upload_request (list) bloc
export 'presentation/doc_upload_request/blocs/doc_upload_request_bloc.dart';
export 'presentation/doc_upload_request/blocs/doc_upload_request_event.dart';
export 'presentation/doc_upload_request/blocs/doc_upload_request_state.dart';

// Presentation — document_upload (upload action) bloc
export 'presentation/document_upload/blocs/document_upload_bloc.dart';
export 'presentation/document_upload/blocs/document_upload_event.dart';
export 'presentation/document_upload/blocs/document_upload_state.dart';

// Presentation — document_upload (upload action) UI
export 'presentation/document_upload/utils/pdf_merge.dart';
export 'presentation/document_upload/views/upload_preview_page.dart';
export 'presentation/document_upload/widgets/upload_source_sheet.dart';
