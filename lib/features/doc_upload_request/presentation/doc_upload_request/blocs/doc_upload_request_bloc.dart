import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
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
    emit(state.copyWith(
      apiStatus: ApiStatus.LOADING,
      flgCompleted: event.flgCompleted,
    ));

    final result = await getDocUploadRequestsUsecase(
      GetDocUploadRequestsParams(
        flgCompleted: event.flgCompleted,
        hostFeatureKey: event.hostFeatureKey,
        hostEntityId: event.hostEntityId,
      ),
    );

    result.when(
      failure: (failure) {
        debugPrint('[DocUploadRequest] _onFetched FAILURE: ${failure.message}');
        emit(state.copyWith(
          apiStatus: ApiStatus.FAILURE,
          message: failure.message,
        ));
      },
      success: (requests) {
        debugPrint('[DocUploadRequest] _onFetched SUCCESS: ${requests.length} request(s)');
        emit(state.copyWith(
          apiStatus: ApiStatus.SUCCESS,
          requests: requests,
        ));
      },
    );
  }
}
