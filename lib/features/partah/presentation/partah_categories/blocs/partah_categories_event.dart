import 'package:equatable/equatable.dart';

abstract class PartahCategoriesEvent extends Equatable {
  const PartahCategoriesEvent();

  @override
  List<Object?> get props => [];
}

class PartahCategoriesStarted extends PartahCategoriesEvent {
  const PartahCategoriesStarted();
}
