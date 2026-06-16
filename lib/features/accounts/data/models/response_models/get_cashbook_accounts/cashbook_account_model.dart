class CashbookAccountModel {
  final int? id;
  final String name;
  final String? group;
  final String? breadcrumb;
  final String? sysKey;

  const CashbookAccountModel({
    this.id,
    required this.name,
    this.group,
    this.breadcrumb,
    this.sysKey,
  });

  factory CashbookAccountModel.fromJson(Map<String, dynamic> json) {
    final accType = json['AccType'] as Map<String, dynamic>?;
    return CashbookAccountModel(
      id: json['Id'] as int?,
      name: (json['Name'] as String?) ?? '',
      group: (json['Group'] as Map<String, dynamic>?)?['Name'] as String?,
      breadcrumb: accType?['Breadcrumb'] as String?,
      sysKey: accType?['SysKey'] as String?,
    );
  }
}
