import '../../features/partah/data/datasources/remote_partah_datasource.dart';
import '../../features/partah/data/repositories_impl/partah_repository_impl.dart';
import '../../features/partah/domain/repositories/partah_repository.dart';
import '../../features/partah/domain/usecases/get_partah_categories_usecase.dart';
import '../../features/partah/domain/usecases/save_category_items_usecase.dart';
import '../../features/partah/domain/usecases/save_partah_category_usecase.dart';
import '../../features/partah/domain/usecases/search_category_products_usecase.dart';
import '../../features/partah/presentation/category_edit/blocs/category_edit_bloc.dart';
import '../../features/partah/presentation/partah/blocs/partah_bloc.dart';
import '../../features/partah/presentation/partah_categories/blocs/partah_categories_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerPartah() async {
  // DataSource
  sl.registerLazySingleton<IRemotePartahDataSource>(
    () => RemotePartahDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<PartahRepository>(
    () => PartahRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetPartahCategoriesUsecase(repository: sl()));
  sl.registerLazySingleton(() => SearchCategoryProductsUsecase(repository: sl()));
  sl.registerLazySingleton(() => SavePartahCategoryUsecase(repository: sl()));
  sl.registerLazySingleton(() => SaveCategoryItemsUsecase(repository: sl()));

  // BLoCs
  sl.registerFactory<PartahBloc>(
    () => PartahBloc(getCategories: sl()),
  );
  sl.registerFactory<PartahCategoriesBloc>(
    () => PartahCategoriesBloc(getCategories: sl()),
  );
  sl.registerFactory<CategoryEditBloc>(
    () => CategoryEditBloc(
      searchCategoryProducts: sl(),
      saveCategory: sl(),
      saveCategoryItems: sl(),
    ),
  );
}
