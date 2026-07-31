import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class BranchSelectionState extends Equatable {
  final ApiStatus status;
  final String? message;
  final int? loadingOrgIndex;

  const BranchSelectionState({
    this.status = ApiStatus.INITIAL,
    this.message,
    this.loadingOrgIndex,
  });

  BranchSelectionState copyWith({
    ApiStatus? status,
    String? message,
    int? loadingOrgIndex,
    bool clearLoadingIndex = false,
    bool clearMessage = false,
  }) {
    return BranchSelectionState(
      status: status ?? this.status,
      message: clearMessage ? null : (message ?? this.message),
      loadingOrgIndex: clearLoadingIndex ? null : (loadingOrgIndex ?? this.loadingOrgIndex),
    );
  }

  @override
  List<Object?> get props => [status, message, loadingOrgIndex];
}
