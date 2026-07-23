// LoanAndAdvance feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/loan_and_advance_entity.dart';

// Presentation — loan_and_advance screen
export 'presentation/loan_and_advance/models/loan_record.dart';
export 'presentation/loan_and_advance/blocs/loan_and_advance_bloc.dart';
export 'presentation/loan_and_advance/blocs/loan_and_advance_event.dart';
export 'presentation/loan_and_advance/blocs/loan_and_advance_state.dart';
export 'presentation/loan_and_advance/views/loan_and_advance_view.dart';

// Presentation — apply loan screen
export 'presentation/apply_loan/blocs/apply_loan_bloc.dart';
export 'presentation/apply_loan/blocs/apply_loan_event.dart';
export 'presentation/apply_loan/blocs/apply_loan_state.dart';
export 'presentation/apply_loan/views/apply_loan_view.dart';
