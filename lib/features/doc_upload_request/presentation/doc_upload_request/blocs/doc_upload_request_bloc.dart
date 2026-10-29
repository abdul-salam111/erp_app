import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/usecases/get_doc_upload_requests_usecase.dart';
import 'doc_upload_request_event.dart';
import 'doc_upload_request_state.dart';

class DocUploadRequestBloc
    extends Bloc<DocUploadRequestEvent, DocUploadRequestState> {
  final GetDocUploadRequestsUsecase getDocUploadRequestsUsecase;

  DocUploadRequestBloc({required this.getDocUploadRequestsUsecase})
      : super(const DocUploadRequestState()) {
    on<DocUploadRequestsFetched>(_onFetched, transformer: restartable());
  }

  Future<void> _onFetched(
    DocUploadRequestsFetched event,
    Emitter<DocUploadRequestState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING));

    final result = await getDocUploadRequestsUsecase(
      GetDocUploadRequestsParams(
        flgCompleted: event.flgCompleted,
        hostFeatureKey: event.hostFeatureKey,
        hostEntityId: event.hostEntityId,
      ),
    );

    result.when(
      failure: (failure) => emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      success: (requests) => emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        requests: requests,
      )),
    );
  }
}
