// Production feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/production_entity.dart';

// Presentation — production screen
export 'presentation/production/blocs/production_bloc.dart';
export 'presentation/production/blocs/production_event.dart';
export 'presentation/production/blocs/production_state.dart';
export 'presentation/production/views/production_view.dart';
