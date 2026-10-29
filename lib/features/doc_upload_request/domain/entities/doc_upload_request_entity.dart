import 'package:equatable/equatable.dart';

class DocUploadRequestEntity extends Equatable {
  final int id;
  final String purpose;
  final int hostFeatureId;
  final int hostEntityId;
  final bool flgCompleted;
  final String hostFeatureName;
  final String hostFeatureKey;
  final DateTime? completedOn;

  const DocUploadRequestEntity({
    required this.id,
    required this.purpose,
    required this.hostFeatureId,
    required this.hostEntityId,
    required this.flgCompleted,
    required this.hostFeatureName,
    required this.hostFeatureKey,
    this.completedOn,
  });

  @override
  List<Object?> get props => [
    id,
    purpose,
    hostFeatureId,
    hostEntityId,
    flgCompleted,
    hostFeatureName,
    hostFeatureKey,
    completedOn,
  ];
}
