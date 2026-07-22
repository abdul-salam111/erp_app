import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/leaves_repository.dart';

class ApplyLeaveParams {
  final String requestDate;
  final String fromDate;
  final String toDate;
  final String leaveType;
  final String detail;

  const ApplyLeaveParams({
    required this.requestDate,
    required this.fromDate,
    required this.toDate,
    required this.leaveType,
    required this.detail,
  });

  Map<String, dynamic> toJson() => {
        'requestDate': requestDate,
        'fromDate': fromDate,
        'toDate': toDate,
        'leaveType': leaveType,
        'detail': detail,
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
