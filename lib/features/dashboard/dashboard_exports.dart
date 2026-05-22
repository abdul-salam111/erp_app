// Dashboard feature barrel — public API of this feature.

// ── Domain ────────────────────────────────────────────────────────────────────
export 'domain/entities/daily_stats_entity.dart';
export 'domain/entities/order_entity.dart';
export 'domain/entities/monthly_stats_entity.dart';
export 'domain/entities/sale_order_summary_entity.dart';
export 'domain/repositories/dashboard_repository.dart';
export 'domain/usecases/get_daily_stats_usecase.dart';
export 'domain/usecases/get_monthly_stats_usecase.dart';
export 'domain/usecases/get_sale_order_summary_usecase.dart';

// ── Data ──────────────────────────────────────────────────────────────────────
export 'data/datasources/remote_dashboard_datasource.dart';
export 'data/repositories_impl/dashboard_repository_impl.dart';
export 'data/models/response_models/get_daily_stats/daily_stats_model.dart';
export 'data/models/response_models/get_daily_stats/daily_stats_model_mapper.dart';
export 'data/models/response_models/get_monthly_stats/monthly_stats_model.dart';
export 'data/models/response_models/get_monthly_stats/monthly_stats_model_mapper.dart';
export 'data/models/response_models/get_sale_order_summary_by_party/sale_order_summary_mapper.dart';

// ── Presentation — BLoC ───────────────────────────────────────────────────────
export 'presentation/dashboard/blocs/dashboard_bloc.dart';

// ── Presentation — pages ──────────────────────────────────────────────────────
export 'presentation/dashboard/pages/dashboard_view.dart';
export 'presentation/dashboard/pages/admin_dashboard.dart';
export 'presentation/dashboard/pages/accountant_dashboard.dart';
export 'presentation/dashboard/pages/hr_dashboard.dart';

// ── Presentation — widgets ────────────────────────────────────────────────────
export 'presentation/widgets/app_drawer.dart';
export 'presentation/widgets/dashboard_widgets.dart';
export 'presentation/widgets/greeting_banner.dart';
export 'presentation/widgets/month_overview_section.dart';
export 'presentation/widgets/new_orders_section.dart';
export 'presentation/widgets/quick_actions_section.dart';
export 'presentation/widgets/sale_orders_section.dart';
export 'presentation/widgets/section_header.dart';
export 'presentation/widgets/today_overview_section.dart';
