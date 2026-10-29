import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/usecases/upload_document_usecase.dart';
import 'document_upload_event.dart';
import 'document_upload_state.dart';

class DocumentUploadBloc
    extends Bloc<DocumentUploadEvent, DocumentUploadState> {
  final UploadDocumentUsecase uploadDocumentUsecase;

  DocumentUploadBloc({required this.uploadDocumentUsecase})
      : super(const DocumentUploadState()) {
    on<DocumentUploadSubmitted>(_onSubmitted, transformer: droppable());
    on<DocumentUploadReset>(
      (event, emit) => emit(const DocumentUploadState()),
    );
  }

  Future<void> _onSubmitted(
    DocumentUploadSubmitted event,
    Emitter<DocumentUploadState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING));

    final result = await uploadDocumentUsecase(
      UploadDocumentParams(id: event.id, filePath: event.filePath),
    );

    result.when(
      failure: (failure) => emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      success: (uploadedRequest) => emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        uploadedRequest: uploadedRequest,
      )),
    );
  }
}
