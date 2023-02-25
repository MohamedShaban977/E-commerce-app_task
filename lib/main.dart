import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_task/core/cache/hive_helper.dart';
import 'package:e_commerce_app_task/features/carts/data/tables/product_cart_table.dart';
import 'package:e_commerce_app_task/features/wishlist/data/tables/product_favorite_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/bloc_observer.dart';
import 'app/injection_container.dart';
import 'app/my_app.dart';

Future<void> main() async {
  await _initMain();

  runApp(MyApp());
}

Future<void> _initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: AppColors.backgroundDarkColor,
  // ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await ServiceLocator.initApp();
  var appDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDirectory.path)
    ..registerAdapter(ProductFavoriteTableAdapter())
    ..registerAdapter(CategoryTableAdapter())
    ..registerAdapter(ProductCartTableAdapter());
  HiveHelper.init();

  Bloc.observer = MyBlocObserver();
}
