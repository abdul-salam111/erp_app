// Inventory feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/stock_received_entity.dart';
export 'domain/entities/current_stock_entity.dart';

// Presentation — inventory screen
export 'presentation/inventory/blocs/inventory_bloc.dart';
export 'presentation/inventory/blocs/inventory_event.dart';
export 'presentation/inventory/blocs/inventory_state.dart';
export 'presentation/inventory/views/inventory_view.dart';

export 'data/models/response_models/get_current_stock/current_stock_model.dart';
export 'data/models/response_models/get_stock_recieved/stock_recieved_model.dart';

export '../../../../core/shared/shared_exports.dart';
export '../../../../core/constants/const_exports.dart';
export '../../../../core/services/session_manager.dart';
export 'data/datasources/remote_inventory_datasource.dart';
export 'data/datasources/i_remote_inventory_datasource.dart';
export 'domain/repositories/inventory_repository.dart';
export 'data/repositories_impl/inventory_repository_impl.dart';