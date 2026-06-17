import 'package:equatable/equatable.dart';

class CashbookAccountItemEntity extends Equatable {
  final int? id;
  final String name;
  final String? group;
  final String? sysKey;

  const CashbookAccountItemEntity({
    this.id,
    required this.name,
    this.group,

    this.sysKey,
  });

  @override
  List<Object?> get props => [id, name, group, sysKey];
}
