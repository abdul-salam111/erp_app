import 'package:equatable/equatable.dart';
import '../../../domain/entities/partah_record_entity.dart';

abstract class PartahEvent extends Equatable {
  const PartahEvent();

  @override
  List<Object?> get props => [];
}

/// Loads product templates + prefill data (last costs, last production entries).
class PartahStarted extends PartahEvent {}

class PartahRecordSaveRequested extends PartahEvent {
  final PartahRecordEntity record;
  const PartahRecordSaveRequested(this.record);

  @override
  List<Object?> get props => [record];
}
