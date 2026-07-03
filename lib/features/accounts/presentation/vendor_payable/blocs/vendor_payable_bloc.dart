import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class VendorPayableBloc extends Bloc<VendorPayableEvent, VendorPayableState>
    with UsecaseExecuterMixin {
  final VendorPayableUsecase vendorPayableUsecase;

  VendorPayableBloc({required this.vendorPayableUsecase})
      : super(const VendorPayableState()) {
    on<VendorPayableSubmitted>(_onVendorPayableSubmitted);
  }

  Future<void> _onVendorPayableSubmitted(
    VendorPayableSubmitted event,
    Emitter<VendorPayableState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => vendorPayableUsecase(
        VendorPayableParams(fromDate: event.fromDate, toDate: event.toDate),
      ),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        items: data ,
        message: error,
      ),
    );
  }
}
