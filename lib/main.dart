import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_task/core/cache/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/bloc_observer.dart';
import 'app/injection_container.dart';
import 'app/my_app.dart';

Future<void> main() async {
  await _initMain();

  runApp(MyApp());
}

Future<void> _initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await ServiceLocator.initApp();
  HiveHelper.init();
  Bloc.observer = MyBlocObserver();
}
