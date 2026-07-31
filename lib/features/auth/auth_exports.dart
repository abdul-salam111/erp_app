// Auth feature barrel — public API of this feature.
// Data internals (datasource, repository impl) are intentionally excluded
// — imported directly by DI only.


export './domain/entities/user_entity.dart';
export './data/models/response_models/logged_in_user_model/logged_in_user_model_mapper.dart';
export './domain/i_repositories/auth_repository.dart';
export './domain/usecases/signin_usecase.dart';
export './domain/usecases/select_branch_usecase.dart';
export './domain/usecases/get_user_features_usecase.dart';
export './domain/usecases/get_user_roles_usecase.dart';

// Presentation — signin screen
export './presentation/signin/blocs/signin_bloc.dart';
export './presentation/signin/blocs/signin_event.dart';
export './presentation/signin/blocs/signin_state.dart';
export './presentation/signin/views/signin_view.dart';
export './presentation/organization_selection/views/organization_selection_view.dart';
export './presentation/organization_selection/blocs/branch_selection_bloc.dart';
export './presentation/organization_selection/blocs/branch_selection_event.dart';
export './presentation/organization_selection/blocs/branch_selection_state.dart';

// Data
export './data/datasources/auth_remote_datasource/auth_remote_datasource.dart';
export './data/repositories_impl/auth_repository_impl.dart';
export './data/models/request_models/login_request_model/login_request_model.dart';
export './data/models/response_models/logged_in_user_model/logged_in_user_model.dart';