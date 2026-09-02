

## High-Severity Findings


### H2. No reactive 401 handling

`retry_interceptor.dart` only retries on connection errors/timeouts; `token_refresh_interceptor.dart` only refreshes _proactively_ based on a 2-minute expiry buffer. There's no `onError` hook that catches a live 401 and retries with a fresh token — if the proactive check races or the server invalidates early, the user just sees a generic auth error instead of a transparent silent recovery.

---

## Medium-Severity Findings

- **"Sticky message" state bug in 20+ state classes** (`message: message ?? this.message` in `copyWith`) — an error message can never be cleared back to null, so stale error banners can reappear or fail to re-display. Three files (`credit_management_state.dart`, `ac_statement_state.dart`, `branch_selection_state.dart`) already fixed this locally with an explicit `clearMessage` flag — the fix is known, just not applied everywhere.
- **`signin_bloc.dart` does too much** — full login → save credentials → save user → auto-select org → select branch → fetch roles → fetch features orchestration lives directly in the bloc, with one branch (`failure: (_) {}` at line 108) silently swallowing feature-fetch errors while the sibling branch surfaces role-fetch errors. This orchestration belongs in a usecase
.
- **`SessionController` is a bare mutable singleton** with public mutable fields and no synchronization outside the Dio interceptor's `QueuedInterceptor` — a secondary race-condition surface if session state is ever touched from outside the network layer.
- **Dashboard state modeling regresses to 4 independent status/error fields** (`admin_dashboard_state.dart`) instead of one sealed union — 16 theoretically reachable state combinations for what's rendered as one screen.
- **`DocumentRepositoryImpl` (scan_document) is the one repository that doesn't extend `BaseRepository`** — no `Result`/`Failure` wrapping, breaking the one error-handling contract every other repository follows.
- **`ProductTemplateEntity` lives in `core/shared/domain`** but is only ever used by one feature — misplaced, couples core to a single feature's vocabulary.
- **No cert pinning**, and Firebase Remote Config controls the API base URL with silently-swallowed fetch errors (`catch (_) {}`) and no integrity check — a compromised Remote Config or a MITM (enabled by the lack of pinning) can redirect all traffic, including the plaintext-password relogin call from C2.
- **Debug-signing fallback**: `android/app/build.gradle.kts` falls back to the **debug keystore** if `key.properties` is missing instead of failing the build — a misconfigured release build could silently ship debug-signed.
- **Validators exist but are barely used** — `lib/core/utils/validators.dart` is a comprehensive validation library, wired only into the sign-in screen; every other form (purchase/sale orders, HR modules) relies entirely on server-side rejection of malformed input.
- **`BlocBuilder` over-rebuild**: 35 files use `BlocBuilder`, only 24 total uses of `buildWhen` project-wide — most rebuild their entire subtree on any state emission (e.g. `accounts_view.dart` has 4 unscoped `BlocBuilder`s in one screen).
- **Dead/unused dependencies**: `get` (GetX, fully migrated away from but still declared — real risk of someone accidentally reaching for it again), `lottie`, `mason` (a CLI tool, shouldn't be a runtime dependency at all), `cupertino_icons`, `cached_network_image` (declared but unused).
- **`flutter_bloc`/`bloc` a major version behind** the current 9.x line.
- **No event transformers** (`bloc_concurrency`) anywhere — no `droppable()`/`restartable()` guard on any submit handler, so rapid double-tap on Save buttons can fire two concurrent requests with no de-dup.

---

## Low-Severity / Polish

- 1 stray `print()` in `lib/core/utils/apptoast_utils.dart:728`.
- `analysis_options.yaml` uses default `flutter_lints` with every custom rule commented out — no strictness upgrade (`very_good_analysis` or similar) has ever been applied.
- Two `flutter analyze` info-level notices: unused transitive import of `http_parser` in `dio_helper.dart`, and one genuinely unnecessary import in `admin_dashboard.dart`.
- Firebase API keys and `google-services.json` are committed — standard practice for Firebase client SDKs (these aren't secrets in the traditional sense), but worth a deliberate team decision rather than a default.
- Naming inconsistency: `snake_case` vs `camelCase` mixed in `RouteNames`/`RoutePaths` constants.

---
