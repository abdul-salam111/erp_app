class SelectBranchRequestModel {
  final String accessToken;
  final String misBranchId;
  final String refreshToken;

  const SelectBranchRequestModel({
    required this.accessToken,
    required this.misBranchId,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'misBranchId': misBranchId,
        'refreshToken': refreshToken,
      };
}
