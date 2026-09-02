import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/partah_record_entity.dart';

class ReportsState extends Equatable {
  final ApiStatus loadStatus;
  final ApiStatus deleteStatus;
  final List<PartahRecordEntity> records;
  final String? errorMessage;
  final String? deletedId;

  const ReportsState({
    this.loadStatus = ApiStatus.INITIAL,
    this.deleteStatus = ApiStatus.INITIAL,
    this.records = const [],
    this.errorMessage,
    this.deletedId,
  });

  ReportsState copyWith({
    ApiStatus? loadStatus,
    ApiStatus? deleteStatus,
    List<PartahRecordEntity>? records,
    String? errorMessage,
    String? deletedId,
  }) {
    return ReportsState(
      loadStatus: loadStatus ?? this.loadStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      records: records ?? this.records,
      errorMessage: errorMessage,
      deletedId: deletedId,
    );
  }

  @override
  List<Object?> get props => [loadStatus, deleteStatus, records, errorMessage, deletedId];
}
