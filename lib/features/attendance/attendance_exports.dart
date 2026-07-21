// Attendance feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/attendance_entity.dart';

// Presentation — attendance screen
export 'presentation/attendance/blocs/attendance_bloc.dart';
export 'presentation/attendance/blocs/attendance_event.dart';
export 'presentation/attendance/blocs/attendance_state.dart';
export 'presentation/attendance/views/attendance_view.dart';
