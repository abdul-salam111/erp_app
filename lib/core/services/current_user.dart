import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import 'session_manager.dart';

const currentUser = CurrentUser._();

class CurrentUser {
  const CurrentUser._();

  UserEntity? get _user => SessionController.instance.loggedInUser;

  // ── Role ──────────────────────────────────────────────
  bool get isAdmin => SessionController.instance.isAdmin;

  // ── User ──────────────────────────────────────────────
  String get fullName => _user?.fullName ?? '';
  String get firstName => _user?.firstName ?? '';
  String get lastName => _user?.lastName ?? '';
  String get email => _user?.email ?? '';
  int? get id => _user?.id;
  List<UserOrganizationEntity>? get organizations => _user?.organizations;

  // ── Organization ──────────────────────────────────────
  OrgAccessor get org => const OrgAccessor._();
}

class OrgAccessor {
  const OrgAccessor._();

  UserOrganizationEntity? get _org =>
      SessionController.instance.selectedOrganization;

  String get name => _org?.name ?? '';
  String get tenantName => _org?.tenantName ?? '';
  String get productName => _org?.productName ?? '';
  String get countryName => _org?.countryName ?? '';
  String get countryIso2 => _org?.countryIso2 ?? '';
  String get currencyCode => _org?.currencyCode ?? '';
  String get currencySymbol => _org?.currencySymbol ?? '';
  int get currencyDecimals => _org?.currencyDecimals ?? 2;
  String? get accessToken => _org?.activeAccessToken;
}
