import 'package:equatable/equatable.dart';

class CashbookAccountItemEntity extends Equatable {
  final int? id;
  final String name;
  final String? group;
  final String? breadcrumb;

  const CashbookAccountItemEntity({
    this.id,
    required this.name,
    this.group,
    this.breadcrumb,
  });

  @override
  List<Object?> get props => [id, name, group, breadcrumb];
}
