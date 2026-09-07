// Partah feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/partah_entity.dart';
export 'domain/entities/cost_item_entity.dart';
export 'domain/entities/partah_category_entity.dart';
export 'domain/entities/partah_category_product_entity.dart';

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

// Presentation — parta categories screen
export 'presentation/partah_categories/blocs/partah_categories_bloc.dart';
export 'presentation/partah_categories/blocs/partah_categories_event.dart';
export 'presentation/partah_categories/blocs/partah_categories_state.dart';
export 'presentation/partah_categories/views/partah_categories_view.dart';

// Presentation — category edit screen
export 'presentation/category_edit/blocs/category_edit_bloc.dart';
export 'presentation/category_edit/blocs/category_edit_event.dart';
export 'presentation/category_edit/blocs/category_edit_state.dart';
export 'presentation/category_edit/views/category_edit_view.dart';

// Presentation — settings screen
export 'presentation/partah_settings/views/partah_settings_view.dart';
