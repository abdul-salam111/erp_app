import 'package:equatable/equatable.dart';

class SelectBranchParams extends Equatable {
  final String accessToken;
  final String misBranchId;
  final String refreshToken;

  const SelectBranchParams({
    required this.accessToken,
    required this.misBranchId,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, misBranchId, refreshToken];
}
