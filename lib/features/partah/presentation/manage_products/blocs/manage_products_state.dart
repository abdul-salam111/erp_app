import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/product_template_entity.dart';

class ManageProductsState extends Equatable {
  final ApiStatus loadStatus;
  final ApiStatus saveStatus;
  final List<ProductTemplateEntity> templates;
  final String? errorMessage;

  const ManageProductsState({
    this.loadStatus = ApiStatus.INITIAL,
    this.saveStatus = ApiStatus.INITIAL,
    this.templates = const [],
    this.errorMessage,
  });

  ManageProductsState copyWith({
    ApiStatus? loadStatus,
    ApiStatus? saveStatus,
    List<ProductTemplateEntity>? templates,
    String? errorMessage,
  }) {
    return ManageProductsState(
      loadStatus: loadStatus ?? this.loadStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      templates: templates ?? this.templates,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [loadStatus, saveStatus, templates, errorMessage];
}
