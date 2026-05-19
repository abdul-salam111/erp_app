// Inventory feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/inventory_entity.dart';

// Presentation — inventory screen
export 'presentation/inventory/blocs/inventory_bloc.dart';
export 'presentation/inventory/blocs/inventory_event.dart';
export 'presentation/inventory/blocs/inventory_state.dart';
export 'presentation/inventory/views/inventory_view.dart';
