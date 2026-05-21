// Dashboard feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.

// Domain
export 'domain/entities/dashboard_entity.dart';
export 'domain/repositories/dashboard_repository.dart';
export 'domain/usecases/dashboard_usecase.dart';

// Data
export 'data/datasources/remote_dashboard_datasource.dart';
export 'data/repositories_impl/dashboard_repository_impl.dart';

// Presentation — BLoC
export 'presentation/dashboard/blocs/dashboard_bloc.dart';

// Presentation — pages
export 'presentation/dashboard/pages/dashboard_view.dart';
export 'presentation/dashboard/pages/admin_dashboard.dart';
export 'presentation/dashboard/pages/accountant_dashboard.dart';
export 'presentation/dashboard/pages/hr_dashboard.dart';

// Presentation — widgets
export 'presentation/widgets/app_drawer.dart';
export 'presentation/widgets/dashboard_widgets.dart';
export 'presentation/widgets/greeting_banner.dart';
export 'presentation/widgets/month_overview_section.dart';
export 'presentation/widgets/new_orders_section.dart';
export 'presentation/widgets/quick_actions_section.dart';
export 'presentation/widgets/sale_orders_section.dart';
export 'presentation/widgets/section_header.dart';
export 'presentation/widgets/today_overview_section.dart';
