import 'package:equatable/equatable.dart';

abstract class DocUploadRequestEvent extends Equatable {
  const DocUploadRequestEvent();

  @override
  List<Object?> get props => [];
}

class DocUploadRequestsFetched extends DocUploadRequestEvent {
  final bool flgCompleted;
  final String? hostFeatureKey;
  final int? hostEntityId;

  const DocUploadRequestsFetched({
    required this.flgCompleted,
    this.hostFeatureKey,
    this.hostEntityId,
  });

  @override
  List<Object?> get props => [flgCompleted, hostFeatureKey, hostEntityId];
}
