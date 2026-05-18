import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/scan_document_usecase.dart';
import 'scan_document_event.dart';
import 'scan_document_state.dart';

class ScanDocumentBloc extends Bloc<ScanDocumentEvent, ScanDocumentState>
    with UsecaseExecuterMixin {
  final ScanDocumentUsecase scandocumentUsecase;

  ScanDocumentBloc({required this.scandocumentUsecase})
      : super(const ScanDocumentState()) {
    on<ScanDocumentSubmitted>(_onScanDocumentSubmitted);
  }

  Future<void> _onScanDocumentSubmitted(
    ScanDocumentSubmitted event,
    Emitter<ScanDocumentState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => scandocumentUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
