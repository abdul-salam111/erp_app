# CLAUDE.md — mantic_erp_app

## Project Overview
Flutter ERP application (`mantic_erp_app`) with role-based dashboards (Admin, Accountant, HR). Built with clean architecture (data / domain / presentation layers) and BLoC state management.

## Tech Stack
- **Flutter / Dart SDK**: `^3.10.0`
- **State management**: `flutter_bloc` + `bloc`
- **Navigation**: `go_router`
- **Networking**: `dio`
- **DI**: `get_it`
- **Local storage**: `flutter_secure_storage`
- **Models**: `freezed` + `json_serializable` (run `build_runner` after model changes)
- **FP utilities**: `fpdart`
- **Fonts**: `google_fonts`
- **Icons**: `iconsax` (preferred) + Material Icons

## Folder Structure
```
lib/
  core/
    constants/       # AppColors, AppIcons, AppImages, shared_pref keys
    networks/        # Dio setup, exceptions, injection
    services/        # SplashServices, SessionManager
    shared/          # Base datasource, repository, use-cases
    theme/           # AppColors, ThemeExtension, ThemeBloc
    utils/           # Validators, extensions, date/currency utils
    widgets/         # Shared widgets (CustomAppBar, CustomButton, etc.)
  features/
    auth/            # Login flow
    dashboard/       # Role dashboards (admin, accountant, hr)
    splash/
  routes/            # go_router setup
```

## Dart Conventions (Dart 3.x)
Use **static member shorthand (must follow)** (dot syntax) whenever the type is inferred from context:

```dart
// ✅ Preferred
// Alignment & Layout
crossAxisAlignment: .start / .center / .end / .stretch,
mainAxisAlignment: .start / .center / .end / .spaceBetween / .spaceAround / .spaceEvenly,
mainAxisSize: .min / .max,
textAlign: .start / .center / .end / .justify,
alignment: .center / .topLeft / .bottomRight,  // on Align/Container

// Text & Typography
fontWeight: .w400 / .w500 / .w600 / .w700 / .bold / .normal,
overflow: .ellipsis / .fade / .clip / .visible,
fontStyle: .italic / .normal,
textDirection: .ltr / .rtl,

// BoxFit / Images
fit: .cover / .contain / .fill / .fitWidth / .fitHeight,

// Shapes & Borders
shape: .circle / .rectangle,          // BoxShape
clipBehavior: .hardEdge / .antiAlias / .none,

// Scroll
physics: const NeverScrollableScrollPhysics(),
scrollDirection: .horizontal / .vertical,

// Visibility / Sizing
visibility: .visible / .hidden,
softWrap: true / false,

// Axis
direction: .horizontal / .vertical,   // Flex/Wrap
```

Use `.withValues(alpha: x)` instead of the deprecated `.withOpacity(x)`.

## Theme Access
Use `BuildContext` extensions from `theme_utils.dart` — never hardcode colors or text styles:

```dart
context.primary        // brand blue
context.textPrimary    // theme-aware text
context.grey50         // light background
context.titleMedium    // TextStyle
context.bodySmall      // TextStyle
```

## Dashboard Architecture
- `DashboardView` provides `DashboardBloc` and renders `AdminDashboard` (or role-specific variant).
- Each dashboard is a `Scaffold` with `CustomAppBar` and a `SingleChildScrollView` body.
- Dashboard sections are private `StatelessWidget` classes within the same file, listed as `const` children in a `Column`.
- Section data (card items, labels, icons, colors) is stored as `static const` lists on the section widget.

## Responsiveness

**Target priority:** iPad / large tablets (≥ 900 px) → tablets (600–899 px) → phones (< 600 px).

### Breakpoints (`lib/core/utils/responsive.dart`)

| Class | Width | Typical device |
|-------|-------|----------------|
| phone | < 600 px | Android phones, small iPhones |
| tablet | 600–899 px | Android tablets, iPad mini |
| ipad | ≥ 900 px | iPad Air/Pro, large Android tablets |

### Rules

1. **Never hard-code sizes that differ by screen.** Use `Responsive.value(context, phone:, tablet:, ipad:)` or the `BuildContext` extensions below.
2. **Use `MediaQuery.sizeOf(context)`** (not `MediaQuery.of(context).size`) to avoid unnecessary rebuilds.
3. **Padding** — always use `context.pagePadding` for top-level screen padding. Never write `EdgeInsets.all(12)` directly on a page body.
4. **Grids** — use `context.gridColumnCount` for crossAxisCount and `context.overviewCardRatio` for childAspectRatio. Never hard-code `crossAxisCount: 2`.
5. **Spacing** — use `context.gridSpacing` for item gaps inside grids and lists.
6. **Do not wrap in `LayoutBuilder` just to read width** — `Responsive.*` helpers use `MediaQuery.sizeOf` which is cheaper.
7. **Never use `flutter_screenutil` or other scaling packages** — size with breakpoints, not pixel scaling.

### Available `BuildContext` extensions

```dart
context.isPhone          // bool
context.isTablet         // bool
context.isIpad           // bool
context.pagePadding      // EdgeInsets — 12 / 16 / 24 for phone / tablet / iPad
context.gridSpacing      // double — 8 / 10 / 14
context.gridColumnCount  // int — 2 / 3 / 4
context.overviewCardRatio // double — childAspectRatio for overview cards
```

### Ad-hoc responsive value

```dart
Responsive.value<double>(
  context,
  phone: 14,
  tablet: 16,
  ipad: 18,   // optional — falls back to tablet if omitted
)
```

## Code Style
- Prefer `const` constructors everywhere possible.
- Keep section widgets private (`_SectionName`) inside the dashboard file — only extract to separate files when reused.
- No trailing summary comments. No unnecessary docstrings on private helpers.
- `GridView.builder` with `shrinkWrap: true` + `NeverScrollableScrollPhysics()` inside scroll views.
