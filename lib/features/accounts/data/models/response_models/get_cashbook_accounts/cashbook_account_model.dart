class CashbookAccountModel {
  final int? id;
  final String name;
  final String? group;
  final String? breadcrumb;

  const CashbookAccountModel({
    this.id,
    required this.name,
    this.group,
    this.breadcrumb,
  });

  factory CashbookAccountModel.fromJson(Map<String, dynamic> json) =>
      CashbookAccountModel(
        id: json['Id'] as int?,
        name: (json['Name'] as String?) ?? '',
        group: json['Group'] as String?,
        breadcrumb: json['Breadcrumb'] as String?,
      );
}
