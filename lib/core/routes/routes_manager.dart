import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/injection_container.dart';
import '../../features/auth/login/presentation/cubit/login_cubit.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import '../../features/auth/sign_up/presentation/screens/signup_screen.dart';
import '../../features/categories/presentation/cubit/categories_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/main_layout_app/presentation/screens/main_layout_app.dart';
import '../../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../../features/product_details/presentation/screens/product_details_screen.dart';
import '../../features/products/presentation/cubit/products_cubit.dart';
import '../../features/products/presentation/screens/products_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/wishlist/presentation/cubit/wishlist_cubit.dart';
import '../app_manage/strings_manager.dart';
import 'magic_router.dart';
import 'routes_request.dart';
import 'routes_name.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.initialRoute:
        return MagicRouter.pageRoute(const SplashScreen());

      // loginRoute
      case RoutesNames.loginRoute:
        ServiceLocator.initLoginGetIt();
        return MagicRouter.pageRoute(BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: const LoginScreen(),
        ));

      // signupRoute
      case RoutesNames.signupRoute:
        ServiceLocator.initSignUpGetIt();
        return MagicRouter.pageRoute(BlocProvider(
          create: (context) => sl<SignUpCubit>(),
          child: const SignupScreen(),
        ));

      // mainLayoutApp
      case RoutesNames.mainLayoutApp:
        ServiceLocator.initCategoriesGetIt();
        ServiceLocator.initProductsGetIt();
        ServiceLocator.initWishlistGetIt();
        ServiceLocator.initCartGetIt();

        return MagicRouter.pageRoute(MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => sl<CategoriesCubit>()..categories()),
            BlocProvider(create: (context) => sl<HomeCubit>()),
            BlocProvider(
              create: (context) => sl<ProductsCubit>()
                ..getProductsMostPopular()
                ..getProductsMostRecent(),
            ),
          ],
          child: const MainLayoutAppScreen(),
        ));

      // productDetails
      case RoutesNames.productDetails:
        ServiceLocator.initProductDetailsByIdGetIt();
        final RouteRequest res =
            RouteRequest.fromJson(settings.arguments! as Map<String, dynamic>);
        return MagicRouter.pageRoute(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  sl<ProductDetailsCubit>()..getProductDetailsById(id: res.id!),
            ),
            BlocProvider.value(value: sl<WishlistCubit>()),
          ],
          child: ProductDetailsScreen(id: res.id!),
        ));

      // products
      case RoutesNames.products:
        ServiceLocator.initProductsGetIt();

        final RouteRequest res =
            RouteRequest.fromJson(settings.arguments! as Map<String, dynamic>);
        return MagicRouter.pageRoute(BlocProvider(
          create: (context) =>
              sl<ProductsCubit>()..getProductsByCategory(idCategory: res.id!),
          child: ProductsScreen(id: res.id!),
        ));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MagicRouter.pageRoute(Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound),
      ),
      body: const Center(child: Text(AppStrings.noRouteFound)),
    ));
  }
}
