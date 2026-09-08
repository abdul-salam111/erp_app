import 'package:equatable/equatable.dart';

abstract class PartahEvent extends Equatable {
  const PartahEvent();

  @override
  List<Object?> get props => [];
}

/// Loads Parta Categories to drive the calculator's Revenue rows.
class PartahStarted extends PartahEvent {}
