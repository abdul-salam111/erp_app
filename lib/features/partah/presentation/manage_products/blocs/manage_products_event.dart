import 'package:equatable/equatable.dart';
import '../../../domain/entities/product_template_entity.dart';

abstract class ManageProductsEvent extends Equatable {
  const ManageProductsEvent();

  @override
  List<Object?> get props => [];
}

class ManageProductsStarted extends ManageProductsEvent {}

class ManageProductsSaveRequested extends ManageProductsEvent {
  final List<ProductTemplateEntity> templates;
  const ManageProductsSaveRequested(this.templates);

  @override
  List<Object?> get props => [templates];
}
