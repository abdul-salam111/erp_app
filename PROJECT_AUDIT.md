

## High-Severity Findings


### H2. No reactive 401 handling

`retry_interceptor.dart` only retries on connection errors/timeouts; `token_refresh_interceptor.dart` only refreshes _proactively_ based on a 2-minute expiry buffer. There's no `onError` hook that catches a live 401 and retries with a fresh token — if the proactive check races or the server invalidates early, the user just sees a generic auth error instead of a transparent silent recovery.

---
## Medium-Severity Findings

- **`signin_bloc.dart` does too much** — full login → save credentials → save user → auto-select org → select branch → fetch roles → fetch features orchestration lives directly in the bloc, with one branch (`failure: (_) {}` at line 108) silently swallowing feature-fetch errors while the sibling branch surfaces role-fetch errors. This orchestration belongs in a usecase
.
- **`SessionController` is a bare mutable singleton** with public mutable fields and no synchronization outside the Dio interceptor's `QueuedInterceptor` — a secondary race-condition surface if session state is ever touched from outside the network layer.
- **`BlocBuilder` over-rebuild**: 35 files use `BlocBuilder`, only 24 total uses of `buildWhen` project-wide — most rebuild their entire subtree on any state emission (e.g. `accounts_view.dart` has 4 unscoped `BlocBuilder`s in one screen).
- **`flutter_bloc`/`bloc` a major version behind** the current 9.x line.

---

## Low-Severity / Polish

- 1 stray `print()` in `lib/core/utils/apptoast_utils.dart:728`.
- `analysis_options.yaml` uses default `flutter_lints` with every custom rule commented out — no strictness upgrade (`very_good_analysis` or similar) has ever been applied.
- Two `flutter analyze` info-level notices: unused transitive import of `http_parser` in `dio_helper.dart`, and one genuinely unnecessary import in `admin_dashboard.dart`.
- Firebase API keys and `google-services.json` are committed — standard practice for Firebase client SDKs (these aren't secrets in the traditional sense), but worth a deliberate team decision rather than a default.
- Naming inconsistency: `snake_case` vs `camelCase` mixed in `RouteNames`/`RoutePaths` constants.

---
