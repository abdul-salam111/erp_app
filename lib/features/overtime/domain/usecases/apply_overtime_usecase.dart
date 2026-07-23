import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/overtime_repository.dart';

class ApplyOvertimeParams {
  final String date;
  final double hours;
  final String overtimeType;
  final String reason;

  const ApplyOvertimeParams({
    required this.date,
    required this.hours,
    required this.overtimeType,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        'date': date,
        'hours': hours,
        'overtimeType': overtimeType,
        'reason': reason,
      };
}

class ApplyOvertimeUsecase implements Usecase<dynamic, ApplyOvertimeParams> {
  final OvertimeRepository repository;
  const ApplyOvertimeUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(ApplyOvertimeParams params) {
    return repository.applyOvertime(params.toJson());
  }
}
