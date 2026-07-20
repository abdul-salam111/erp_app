// System feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/system_entity.dart';

// Presentation — system screen
export 'presentation/system/blocs/system_bloc.dart';
export 'presentation/system/blocs/system_event.dart';
export 'presentation/system/blocs/system_state.dart';
export 'presentation/system/views/system_view.dart';

// Presentation — setup screen
export 'presentation/setup/views/setup_view.dart';
