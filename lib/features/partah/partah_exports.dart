// Partah feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/partah_entity.dart';
export 'domain/entities/cost_item_entity.dart';
export 'domain/entities/production_entry_entity.dart';
export 'domain/entities/partah_record_entity.dart';

// Presentation — partah screen
export 'presentation/partah/blocs/partah_bloc.dart';
export 'presentation/partah/blocs/partah_event.dart';
export 'presentation/partah/blocs/partah_state.dart';
export 'presentation/partah/views/partah_view.dart';

// Presentation — home screen
export 'presentation/partah_home/views/partah_home_view.dart';
export 'presentation/partah_home/how_to_use/how_to_use_view.dart';

// Presentation — more software screen
export 'presentation/more_software/views/more_software_view.dart';

// Presentation — manage products screen
export 'presentation/manage_products/blocs/manage_products_bloc.dart';
export 'presentation/manage_products/blocs/manage_products_event.dart';
export 'presentation/manage_products/blocs/manage_products_state.dart';
export 'presentation/manage_products/views/manage_products_view.dart';

// Presentation — settings screen
export 'presentation/partah_settings/views/partah_settings_view.dart';

// Presentation — reports screen
export 'presentation/reports/blocs/reports_bloc.dart';
export 'presentation/reports/blocs/reports_event.dart';
export 'presentation/reports/blocs/reports_state.dart';
export 'presentation/reports/views/reports_view.dart';
export 'presentation/reports/views/report_detail_view.dart';
