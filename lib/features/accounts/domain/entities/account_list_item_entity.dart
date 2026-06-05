import 'package:equatable/equatable.dart';

class AccountListItemEntity extends Equatable {
  final int id;
  final String name;
  final String group;
  final String breadcrumb;

  const AccountListItemEntity({
    required this.id,
    required this.name,
    required this.group,
    required this.breadcrumb,
  });

  @override
  List<Object> get props => [id, name, group, breadcrumb];
}
