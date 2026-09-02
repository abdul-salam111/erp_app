# mantic_erp_app — Engineering Audit (Code Quality)

**Auditor stance:** senior Flutter engineer, brutally honest, no sugar-coating.
**Scope:** full `lib/` tree (602 Dart files, 20 features), `pubspec.yaml`, `android/`, `lib/routes/`, `test/`.
**Method:** static analysis (`flutter analyze`), targeted deep-reads across architecture, state management, security, UI/responsiveness, performance, testing/dependencies.
**Note:** this report intentionally excludes missing/incomplete feature work (unimplemented endpoints, placeholder screens, dummy-data-only features) and does not include a remediation/action plan — it covers only defects and quality issues in code that is actually written.
**Date:** 2026-09-02.

---

## TL;DR — Overall Verdict

The parts of this codebase that are built out (`accounts`, `inventory`, `dashboard` admin, routing, DI) show real Clean Architecture + BLoC discipline. But the code that exists — not what's missing — has a set of concrete defects that matter:

- The project's own coding conventions (CLAUDE.md) are violated **~500 times** in written UI code — hardcoded colors and hardcoded padding — with nothing in CI catching it. (The non-shorthand-syntax portion of this, ~496 instances, has since been fixed.)

---

## Scorecard

| Dimension | Grade | /10 | One-line reason |
|---|---|---|---|
| Architecture shape (folders, DI, layering conventions) | B+ | 7.5 | Genuinely good conventions, followed inconsistently |
| State management (BLoC hygiene) | C+ | 6.5 | Solid patterns; the shared unguarded-emit bug has been fixed at the source |
| Error handling | C+ | 6.5 | Real `Result`/`Failure` pipeline exists and is used; typed contracts abandoned in ~40 files (`Result<dynamic>`) |
| Security | D | 3.0 | Live token leak via debug panel, plaintext password retention, no cert pinning |
| UI / responsiveness rule compliance | C- | 5.0 | ~500 remaining violations (hardcoded colors/padding) of the team's own CLAUDE.md conventions; shorthand-syntax violations fixed |
| Performance | B- | 7.0 | No major list-virtualization or image-caching issues; `BlocBuilder` over-rebuild is the main concern |
| Testing | F | 1.0 | 0% coverage, no test infra installed |
| Dependency hygiene | C | 5.5 | A few dead packages (`get`, `lottie`, `mason`, `cupertino_icons`), nothing dangerously outdated |
| Routing | A- | 8.5 | Centralized, consistently used, properly guarded — best-audited area in the app |
| Tooling / lint strictness | D | 3.0 | Default `flutter_lints`, all custom rules commented out, no CI gate found |
| **Overall (unweighted average)** | **C-** | **5.4** | Solid instincts undermined by zero test coverage and unenforced conventions |

---


## High-Severity Findings

### H1. Zero test coverage
602 lib files, 1 test file (untouched `flutter create` boilerplate). No `bloc_test`, no `mocktail`/`mockito` in `pubspec.yaml` — the tooling to write a bloc test isn't even installed. This is exactly the kind of gap that lets shared-infrastructure bugs (e.g. an unguarded `emit` after an `await` in a bloc mixin used by ~23 blocs — since fixed) ship silently and get rediscovered independently in multiple features instead of caught once in review.

### H2. No reactive 401 handling
`retry_interceptor.dart` only retries on connection errors/timeouts; `token_refresh_interceptor.dart` only refreshes *proactively* based on a 2-minute expiry buffer. There's no `onError` hook that catches a live 401 and retries with a fresh token — if the proactive check races or the server invalidates early, the user just sees a generic auth error instead of a transparent silent recovery.

### H3. Non-idempotent POSTs retried on connection error
`retry_interceptor.dart:21` retries any `connectionError`/`connectionTimeout` up to 3 times, including `POST` requests (create purchase order, apply leave, apply loan, apply overtime) with no idempotency key check. If the request actually succeeded server-side but the ack was lost, the retry can create a duplicate record — real financial/data-integrity risk in an ERP.

### H4. Core networking layer imports and re-implements auth
`token_refresh_interceptor.dart:3-4,76,111` imports feature-layer auth models directly and builds its own raw login/select-branch HTTP calls instead of calling `AuthRepository`/usecases through DI. This is an inverted dependency (core → feature) **and** it means there are now two independent code paths that can perform login, which can silently drift out of sync.

### H5. Domain layer leaks data-layer models
`sale_order_repository.dart`, `purchase_order_repository.dart`, and `auth_repository.dart` (domain interfaces) import and return/accept concrete data-layer model classes (`SaleOrderDetail`, `SelectBranchRequestModel`) instead of domain entities. This defeats the entire point of a domain boundary for these three features — any JSON shape change ripples straight into blocs with no buffer.

### H6. `Result<dynamic>` used in 40+ files
Repository/usecase contracts across `leaves`, `attendance`, `overtime`, `loan_and_advance`, `alert_panel`, `analytics`, `production`, `profile`, and both order-creation flows return untyped `dynamic`, pushing casting risk into the bloc/view layer and making the "clean architecture" label largely cosmetic in those features.

### H7. `~500` remaining violations of the project's own UI conventions
The CLAUDE.md file mandates theme-only color access via `context.*` and `Responsive.*`/`context.pagePadding`/`context.gridColumnCount` for all sizing. Grep counts: ~250 hardcoded-color instances, 242 hardcoded `EdgeInsets` calls vs. 71 `context.pagePadding` calls, and half of all `GridView` usages hardcode `crossAxisCount` — including two inside `lib/core/widgets`, which is supposed to be the example-setting shared layer. `flutter analyze` will never catch any of this; it needs a custom lint rule or a CI grep-gate, because right now it relies purely on individual developers remembering the rules, and evidently they don't, consistently, even within the same file. (The Dart 3 static-member-shorthand portion of this rule — `.center` not `MainAxisAlignment.center` — has been fixed: ~496 instances converted across 49 files, verified with `dart analyze`.)

### H8. Naming/typo inconsistency across repository layer
`IAuthRepostiory` has a typo'd interface name; naming/folder conventions (`i_repositories/` vs `repositories/`, `I`-prefixed vs not) are inconsistent across features with no enforced template.

---

## Medium-Severity Findings

- **"Sticky message" state bug in 20+ state classes** (`message: message ?? this.message` in `copyWith`) — an error message can never be cleared back to null, so stale error banners can reappear or fail to re-display. Three files (`credit_management_state.dart`, `ac_statement_state.dart`, `branch_selection_state.dart`) already fixed this locally with an explicit `clearMessage` flag — the fix is known, just not applied everywhere.
- **`signin_bloc.dart` does too much** — full login → save credentials → save user → auto-select org → select branch → fetch roles → fetch features orchestration lives directly in the bloc, with one branch (`failure: (_) {}` at line 108) silently swallowing feature-fetch errors while the sibling branch surfaces role-fetch errors. This orchestration belongs in a usecase.
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
- **No event transformers** (`bloc_concurrency`) anywhere — no `droppable()`/`restartable()` guard on any submit handler, so rapid double-tap on Save buttons can fire two concurrent requests with no de-dup. Compounds with H3 (non-idempotent retries).

---

## Low-Severity / Polish

- 1 stray `print()` in `lib/core/utils/apptoast_utils.dart:728`.
- `analysis_options.yaml` uses default `flutter_lints` with every custom rule commented out — no strictness upgrade (`very_good_analysis` or similar) has ever been applied.
- Two `flutter analyze` info-level notices: unused transitive import of `http_parser` in `dio_helper.dart`, and one genuinely unnecessary import in `admin_dashboard.dart`.
- Firebase API keys and `google-services.json` are committed — standard practice for Firebase client SDKs (these aren't secrets in the traditional sense), but worth a deliberate team decision rather than a default.
- Naming inconsistency: `snake_case` vs `camelCase` mixed in `RouteNames`/`RoutePaths` constants.

---
