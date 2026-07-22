// SalaryMgmt feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/salary_mgmt_entity.dart';

// Presentation — salary_mgmt screen
export 'presentation/salary_mgmt/blocs/salary_mgmt_bloc.dart';
export 'presentation/salary_mgmt/blocs/salary_mgmt_event.dart';
export 'presentation/salary_mgmt/blocs/salary_mgmt_state.dart';
export 'presentation/salary_mgmt/views/salary_mgmt_view.dart';
