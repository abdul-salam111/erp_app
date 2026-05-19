// Analytics feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/analytics_entity.dart';

// Presentation — analytics screen
export 'presentation/analytics/blocs/analytics_bloc.dart';
export 'presentation/analytics/blocs/analytics_event.dart';
export 'presentation/analytics/blocs/analytics_state.dart';
export 'presentation/analytics/views/analytics_view.dart';
