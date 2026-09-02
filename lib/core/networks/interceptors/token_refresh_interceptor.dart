import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../../debug/api_debug_interceptor.dart';
import '../../debug/cubit/api_debug_cubit.dart';
import '../../services/session_manager.dart';
import '../network_manager/dio_helper.dart';

/// Proactively refreshes the session token before it expires.
///
/// There is no dedicated refresh-token endpoint — refreshing means silently
/// re-running the login flow (Login -> SelectBranch) with the credentials
/// saved at sign-in, for the same organization/branch the user already had
/// selected. Only requests carrying an Authorization header are affected;
/// unauthenticated calls (login itself, etc.) pass straight through.
///
/// The login/select-branch calls themselves go through the real
/// [AuthRepository] (the same [SignInUsecase]/[SelectBranchUsecase] the
/// sign-in screen uses) instead of hand-building requests here — there is a
/// single implementation of "how login works", not two that can drift.
/// It's driven off a bare, interceptor-free [Dio] rather than the app's
/// shared `sl<Dio>()` — reusing the shared client would mean this
/// interceptor triggers itself while trying to refresh its own token.
///
/// Uses [QueuedInterceptor] so concurrent requests block on a single
/// in-flight refresh instead of each triggering their own.
class TokenRefreshInterceptor extends QueuedInterceptor {
  late final AuthRepository _authRepository = AuthRepositoryImpl(
    dataSource: IAuthRemoteDatasourceImpl(dioHelper: _authDioHelper),
  );
  late final SignInUsecase _signInUsecase =
      SignInUsecase(repository: _authRepository);
  late final SelectBranchUsecase _selectBranchUsecase =
      SelectBranchUsecase(repository: _authRepository);

  DioHelper get _authDioHelper => DioHelper(
        dio: Dio(
          BaseOptions(
            contentType: 'application/json',
            responseType: ResponseType.json,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        )..interceptors.addAll([
            if (ApiDebugCubit.instance != null)
              ApiDebugInterceptor(ApiDebugCubit.instance!),
          ]),
      );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasAuthHeader = options.headers.containsKey('Authorization');
    final shouldRefresh = SessionController.instance.isTokenExpiringSoon ||
        ApiDebugCubit.simulateExpiredToken;

    if (hasAuthHeader && shouldRefresh) {
      final refreshedToken = await _silentRelogin();
      if (refreshedToken != null) {
        options.headers['Authorization'] = 'Bearer $refreshedToken';
      }
      // One-shot: don't keep forcing a refresh on every subsequent request.
      ApiDebugCubit.consumeSimulatedExpiry();
    }

    handler.next(options);
  }

  /// Re-runs Login + SelectBranch with the saved credentials for the
  /// currently selected organization/branch. Returns the fresh access token
  /// on success, or null if the refresh could not be completed (in which
  /// case the original — possibly stale — token is left untouched and the
  /// request proceeds as-is).
  Future<String?> _silentRelogin() async {
    final email = SessionController.instance.savedEmail;
    final password = SessionController.instance.savedPassword;
    final org = SessionController.instance.selectedOrganization;
    if (email == null || password == null || org == null) {
      debugPrint(
        '[TokenRefresh] skipped — missing saved credentials or organization '
        '(email: ${email != null}, password: ${password != null}, '
        'org: ${org != null}). Log out and log back in so credentials are '
        'saved, then retry.',
      );
      return null;
    }

    final loginResult = await _signInUsecase(
      LoginParams(email: email, password: password),
    );

    return loginResult.when(
      failure: (f) async {
        debugPrint('[TokenRefresh] silent refresh failed: ${f.message}');
        return null;
      },
      success: (freshUser) async {
        final freshOrg =
            freshUser.organizations.where((o) => o.id == org.id).firstOrNull;
        final freshBranch = freshOrg?.activeBranch;

        if (freshOrg == null ||
            freshBranch?.accessToken == null ||
            freshBranch?.refreshToken == null) {
          // Access to the previously selected organization/branch is gone —
          // keep current roles/session but refresh the org list, then let
          // the app route the user to pick a valid organization.
          final current = SessionController.instance.loggedInUser;
          await SessionController.instance.saveUserInStorage(
            UserEntity(
              id: freshUser.id,
              firstName: freshUser.firstName,
              lastName: freshUser.lastName,
              email: freshUser.email,
              languageName: freshUser.languageName,
              organizations: freshUser.organizations,
              isAdmin: current?.isAdmin ?? false,
              roles: current?.roles ?? const [],
            ),
          );
          SessionController.instance.onOrganizationUnavailable?.call();
          return null;
        }

        final branchResult = await _selectBranchUsecase(
          SelectBranchParams(
            accessToken: freshBranch!.accessToken!,
            misBranchId: freshBranch.id.toString(),
            refreshToken: freshBranch.refreshToken!,
          ),
        );

        return branchResult.when(
          failure: (f) async {
            debugPrint('[TokenRefresh] silent refresh failed: ${f.message}');
            return null;
          },
          success: (authToken) async {
            if (authToken.accessToken == null) return null;
            await SessionController.instance.updateActiveSession(authToken);
            debugPrint('[TokenRefresh] silent refresh succeeded');
            return authToken.accessToken;
          },
        );
      },
    );
  }
}
