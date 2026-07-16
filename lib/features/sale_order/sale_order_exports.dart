// SaleOrder feature barrel — public API of this feature.
// Import this from outside the feature instead of individual file paths.
// Data layer and domain internals (datasources, repository impls, repository
// interfaces, usecases) are intentionally excluded — imported directly by DI.

// Domain
export 'domain/entities/sale_order_entity.dart';

// Presentation — sale_order screen
export 'presentation/sale_order/blocs/sale_order_bloc.dart';
export 'presentation/sale_order/blocs/sale_order_event.dart';
export 'presentation/sale_order/blocs/sale_order_state.dart';
export 'presentation/sale_order/views/sale_order_view.dart';

// Presentation — create_sale_order screen
export 'presentation/create_sale_order/blocs/create_sale_order_bloc.dart';
export 'presentation/create_sale_order/blocs/create_sale_order_event.dart';
export 'presentation/create_sale_order/blocs/create_sale_order_state.dart';
export 'presentation/create_sale_order/views/create_sale_order_view.dart';
export 'domain/usecases/create_sale_order_usecase.dart';
