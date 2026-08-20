import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/leaves_repository.dart';

class ApplyLeaveParams {
  final String fromDate;
  final String toDate;
  // TODO: Replace with a real policy id once GetPolicies is wired.
  final int? leavePolicyId;
  final String reason;
  final List<int> attachmentFileIds;

  const ApplyLeaveParams({
    required this.fromDate,
    required this.toDate,
    required this.leavePolicyId,
    required this.reason,
    this.attachmentFileIds = const [],
  });

  Map<String, dynamic> toJson() => {
        'FromDate': fromDate,
        'ToDate': toDate,
        'LeavePolicyId': leavePolicyId,
        'Reason': reason,
        'AttachmentFileIds': attachmentFileIds,
      };
}

class ApplyLeaveUsecase implements Usecase<dynamic, ApplyLeaveParams> {
  final LeavesRepository repository;
  ApplyLeaveUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(ApplyLeaveParams params) {
    return repository.applyLeave(params.toJson());
  }
}
