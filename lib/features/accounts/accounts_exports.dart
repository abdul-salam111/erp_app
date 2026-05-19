// Accounts feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/accounts_entity.dart';

// Presentation — accounts screen
export 'presentation/accounts/blocs/accounts_bloc.dart';
export 'presentation/accounts/blocs/accounts_event.dart';
export 'presentation/accounts/blocs/accounts_state.dart';
export 'presentation/accounts/views/accounts_view.dart';
