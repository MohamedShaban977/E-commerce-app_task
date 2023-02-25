import 'package:dio/dio.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/data/data_sources/signup_data_source.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/data/repositories/signup_repositories_impl.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/domain/repositories/signup_repositories.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/domain/use_cases/signup_use_case.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:e_commerce_app_task/features/carts/presentation/cubit/carts_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';
import '../core/cache/cache_data_shpref.dart';
import '../core/network/network_info.dart';
import '../core/service/locale_service/data/local/data_sources/locale_data_sources.dart';
import '../core/service/locale_service/data/repositories/locale_repository_impl.dart';
import '../core/service/locale_service/domain/repositories/locale_repository.dart';
import '../core/service/locale_service/domain/use_cases/locale_useCase.dart';
import '../core/service/locale_service/manager/locale_cubit.dart';
import '../features/auth/login/data/data_sources/login_data_source.dart';
import '../features/auth/login/data/repositories/login_repositories_impl.dart';
import '../features/auth/login/domain/repositories/login_repositories.dart';
import '../features/auth/login/domain/use_cases/login_use_case.dart';
import '../features/auth/login/presentation/cubit/login_cubit.dart';
import '../features/carts/data/data_sources/cart_local_data_sources.dart';
import '../features/carts/data/repositories/cart_repository_impl.dart';
import '../features/carts/domain/repositories/cart_repository.dart';
import '../features/carts/domain/use_cases/delete_product_by_id_use_case.dart';
import '../features/carts/domain/use_cases/get_product_by_id_use_case.dart';
import '../features/carts/domain/use_cases/geta_all_products_use_case.dart';
import '../features/carts/domain/use_cases/save_product_by_id_use_case.dart';
import '../features/categories/data/data_sources/categories_data_sources.dart';
import '../features/categories/data/repositories/categories_repository_impl.dart';
import '../features/categories/domain/repositories/categories_repository.dart';
import '../features/categories/domain/use_cases/categories_use_cases.dart';
import '../features/categories/presentation/cubit/categories_cubit.dart';
import '../features/product_details/data/data_sources/product_details_data_source.dart';
import '../features/product_details/data/repositories/product_details_repository_impl.dart';
import '../features/product_details/domain/repositories/product_details_repository.dart';
import '../features/product_details/domain/use_cases/product_details_use_case.dart';
import '../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../features/products/data/data_sources/products_data_sourse.dart';
import '../features/products/data/repositories/products_repository_impl.dart';
import '../features/products/domain/repositories/products_repository.dart';
import '../features/products/domain/use_cases/products_use_case.dart';
import '../features/products/presentation/cubit/products_cubit.dart';
import '../features/wishlist/data/data_sources/wishlist_local_data_sources.dart';
import '../features/wishlist/data/repositories/wshlist_repository_impl.dart';
import '../features/wishlist/domain/repositories/wishlist_repository.dart';
import '../features/wishlist/domain/use_cases/check_if_product_favorite_use_case.dart';
import '../features/wishlist/domain/use_cases/delete_product_by_id_use_case.dart';
import '../features/wishlist/domain/use_cases/get_product_by_id_use_case.dart';
import '../features/wishlist/domain/use_cases/geta_all_products_use_case.dart';
import '../features/wishlist/domain/use_cases/save_product_by_id_use_case.dart';
import '../features/wishlist/presentation/cubit/wishlist_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static final sl = GetIt.instance;

  static Future<void> initApp() async {
    ///! Features

    //Localization data Source
    sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(cacheHelper: sl()));

    //Localization Repository
    sl.registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl(
          dataSource: sl(),
        ));
    //Localization UseCase
    sl.registerLazySingleton<GetSavedLangUseCase>(
        () => GetSavedLangUseCase(repository: sl()));
    sl.registerLazySingleton<ChangeLangUseCase>(
        () => ChangeLangUseCase(repository: sl()));

    ///Bloc==> cubit
    /// Bloc
    // LocaleCubit
    sl.registerLazySingleton<LocaleCubit>(
        () => LocaleCubit(savedLangUseCase: sl(), changeLangUseCase: sl()));
    //Connection Cubit
    // sl.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit(connectivity: sl(), checker: sl()));

    ///! core
    ///_initDataCore();
    ///! core
    sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(connectionChecker: sl()));
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
    sl.registerLazySingleton<CacheHelper>(
        () => CacheHelper(sharedPreferences: sl<SharedPreferences>()));

    ///! External
    /// _initDataExternal();
    /// External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => InternetConnectionChecker());
    // sl.registerLazySingleton(() => Connectivity());
    sl.registerLazySingleton(() => AppInterceptors());
    sl.registerLazySingleton(() => LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: false,
          responseHeader: true,
          responseBody: false,
          error: true,
        ));
  }

  static initLoginGetIt() {
    //Login Data Source
    if (!sl.isRegistered<LoginDataSource>())
      sl.registerFactory<LoginDataSource>(
          () => LoginDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
    //Login Repository
    if (!sl.isRegistered<LoginRepository>())
      sl.registerFactory<LoginRepository>(
          () => LoginRepositoryImpl(dataSource: sl<LoginDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<LoginUseCases>())
      sl.registerFactory<LoginUseCases>(
          () => LoginUseCases(repository: sl<LoginRepository>()));
    // Login Cubit
    if (!GetIt.I.isRegistered<LoginCubit>())
      sl.registerFactory<LoginCubit>(
          () => LoginCubit(loginUseCases: sl<LoginUseCases>()));
  }

  static initSignUpGetIt() {
    //Login Data Source
    if (!sl.isRegistered<SignUpDataSource>())
      sl.registerFactory<SignUpDataSource>(
          () => SignUpDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
    //Login Repository
    if (!sl.isRegistered<SignUpRepository>())
      sl.registerFactory<SignUpRepository>(
          () => SignUpRepositoryImpl(dataSource: sl<SignUpDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<SignUpUseCases>())
      sl.registerFactory<SignUpUseCases>(
          () => SignUpUseCases(repository: sl<SignUpRepository>()));
    // Login Cubit
    if (!GetIt.I.isRegistered<SignUpCubit>())
      sl.registerFactory<SignUpCubit>(
          () => SignUpCubit(signupUseCases: sl<SignUpUseCases>()));
  }

  static initCategoriesGetIt() {
    //Login Data Source
    if (!sl.isRegistered<CategoriesDataSource>())
      sl.registerFactory<CategoriesDataSource>(
          () => CategoriesDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
    //Login Repository
    if (!sl.isRegistered<CategoriesRepository>())
      sl.registerFactory<CategoriesRepository>(() =>
          CategoriesRepositoryImpl(dataSource: sl<CategoriesDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<CategoriesUseCases>())
      sl.registerFactory<CategoriesUseCases>(
          () => CategoriesUseCases(repository: sl<CategoriesRepository>()));
    // Login Cubit
    if (!sl.isRegistered<CategoriesCubit>())
      sl.registerFactory<CategoriesCubit>(
          () => CategoriesCubit(categoriesUseCases: sl<CategoriesUseCases>()));
  }

  static initProductsGetIt() {
    //Login Data Source
    if (!sl.isRegistered<ProductsDataSource>())
      sl.registerFactory<ProductsDataSource>(
          () => ProductsDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
    //Login Repository
    if (!sl.isRegistered<ProductsRepository>())
      sl.registerFactory<ProductsRepository>(
          () => ProductsRepositoryImpl(dataSource: sl<ProductsDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<ProductsUseCase>())
      sl.registerFactory<ProductsUseCase>(
          () => ProductsUseCase(repository: sl<ProductsRepository>()));
    if (!sl.isRegistered<ProductsByCategoryUseCase>())
      sl.registerFactory<ProductsByCategoryUseCase>(() =>
          ProductsByCategoryUseCase(repository: sl<ProductsRepository>()));
    if (!sl.isRegistered<MostRecentProductsUseCase>())
      sl.registerFactory<MostRecentProductsUseCase>(() =>
          MostRecentProductsUseCase(repository: sl<ProductsRepository>()));
    if (!sl.isRegistered<MostPopularProductsUseCase>())
      sl.registerFactory<MostPopularProductsUseCase>(() =>
          MostPopularProductsUseCase(repository: sl<ProductsRepository>()));

    // Login Cubit
    if (!sl.isRegistered<ProductsCubit>())
      sl.registerFactory<ProductsCubit>(() => ProductsCubit(
          productsUseCase: sl<ProductsUseCase>(),
          productsByCategoryUseCase: sl<ProductsByCategoryUseCase>(),
          mostRecentProductsUseCase: sl<MostRecentProductsUseCase>(),
          mostPopularProductsUseCase: sl<MostPopularProductsUseCase>()));
  }

  static initProductDetailsByIdGetIt() {
    //Login Data Source
    if (!sl.isRegistered<ProductDetailsDataSource>())
      sl.registerFactory<ProductDetailsDataSource>(
          () => ProductDetailsDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
    //Login Repository
    if (!sl.isRegistered<ProductDetailsRepository>())
      sl.registerFactory<ProductDetailsRepository>(() =>
          ProductDetailsRepositoryImpl(
              dataSource: sl<ProductDetailsDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<ProductDetailsUseCase>())
      sl.registerFactory<ProductDetailsUseCase>(() =>
          ProductDetailsUseCase(repository: sl<ProductDetailsRepository>()));
    // Login Cubit
    if (!sl.isRegistered<ProductDetailsCubit>())
      sl.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(
          productDetailsUseCase: sl<ProductDetailsUseCase>()));
  }

  static initWishlistGetIt() {
    //Login Data Source
    if (!sl.isRegistered<WishlistLocalDataSource>())
      sl.registerLazySingleton<WishlistLocalDataSource>(
          () => WishlistLocalDataSourceImpl());
    //Login Repository
    if (!sl.isRegistered<WishlistRepository>())
      sl.registerLazySingleton<WishlistRepository>(() =>
          WishlistRepositoryImpl(dataSource: sl<WishlistLocalDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<SaveProductByIdUseCase>())
      sl.registerLazySingleton<SaveProductByIdUseCase>(
          () => SaveProductByIdUseCase(repository: sl<WishlistRepository>()));
    if (!sl.isRegistered<GetAllProductsUseCase>())
      sl.registerLazySingleton<GetAllProductsUseCase>(
          () => GetAllProductsUseCase(repository: sl<WishlistRepository>()));
    if (!sl.isRegistered<GetProductByIdUseCase>())
      sl.registerLazySingleton<GetProductByIdUseCase>(
          () => GetProductByIdUseCase(repository: sl<WishlistRepository>()));
    if (!sl.isRegistered<DeleteProductByIdUseCase>())
      sl.registerLazySingleton<DeleteProductByIdUseCase>(
          () => DeleteProductByIdUseCase(repository: sl<WishlistRepository>()));
    if (!sl.isRegistered<CheckIfProductFavoriteUseCase>())
      sl.registerLazySingleton<CheckIfProductFavoriteUseCase>(() =>
          CheckIfProductFavoriteUseCase(repository: sl<WishlistRepository>()));
    // Login Cubit
    if (!sl.isRegistered<WishlistCubit>())
      sl.registerLazySingleton<WishlistCubit>(() => WishlistCubit(
            saveProduct: sl<SaveProductByIdUseCase>(),
            getAllProducts: sl<GetAllProductsUseCase>(),
            getProductById: sl<GetProductByIdUseCase>(),
            deleteProductById: sl<DeleteProductByIdUseCase>(),
            checkIfProductFavorite: sl<CheckIfProductFavoriteUseCase>(),
          ));
  }



  static initCartGetIt() {
    //Login Data Source
    if (!sl.isRegistered<CartLocalDataSource>())
      sl.registerLazySingleton<CartLocalDataSource>(
              () => CartLocalDataSourceImpl());
    //Login Repository
    if (!sl.isRegistered<CartRepository>())
      sl.registerLazySingleton<CartRepository>(() =>
          CartRepositoryImpl(dataSource: sl<CartLocalDataSource>()));
    //Login Use Cases
    if (!sl.isRegistered<SaveCartProductByIdUseCase>())
      sl.registerLazySingleton<SaveCartProductByIdUseCase>(
              () => SaveCartProductByIdUseCase(repository: sl<CartRepository>()));
    if (!sl.isRegistered<GetAllCartProductsUseCase>())
      sl.registerLazySingleton<GetAllCartProductsUseCase>(
              () => GetAllCartProductsUseCase(repository: sl<CartRepository>()));
    if (!sl.isRegistered<GetCartProductByIdUseCase>())
      sl.registerLazySingleton<GetCartProductByIdUseCase>(
              () => GetCartProductByIdUseCase(repository: sl<CartRepository>()));
    if (!sl.isRegistered<DeleteCartProductByIdUseCase>())
      sl.registerLazySingleton<DeleteCartProductByIdUseCase>(
              () => DeleteCartProductByIdUseCase(repository: sl<CartRepository>()));

    ///
    if (!sl.isRegistered<CartsCubit>())
      sl.registerLazySingleton<CartsCubit>(() => CartsCubit(
        saveProduct: sl<SaveCartProductByIdUseCase>(),
        getAllProducts: sl<GetAllCartProductsUseCase>(),
        getProductById: sl<GetCartProductByIdUseCase>(),
        deleteProductById: sl<DeleteCartProductByIdUseCase>(),
      ));
  }
}
