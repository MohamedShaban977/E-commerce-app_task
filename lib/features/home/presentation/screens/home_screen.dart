import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../categories/presentation/cubit/categories_cubit.dart';
import '../../../main_layout_app/presentation/widgets/custom_drawer.dart';
import '../../../products/presentation/cubit/products_cubit.dart';
import '../widgets/bottom_screen_categories_and_most_recent_and_popular.dart';
import '../widgets/home_background_widget.dart';
import '../widgets/top_screen_search_and_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriesCubit _categoriesCubit = sl<CategoriesCubit>();
  final ProductsCubit _productsCubit = sl<ProductsCubit>();

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: const DrawerView(),
        backgroundColor: Colors.transparent,
        body: RefreshIndicator(
          onRefresh: () async =>
              await Future.delayed(const Duration(seconds: 3)),
          child: SizedBox(
            height: context.heightBodyWithNav,
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics()),
                child: Column(
                  children: [
                    const TopScreenSearchAndSlider(),
                    const SizedBox(height: AppSize.s37),
                    BottomScreenCategoriesAndMostRecentAndPopular(
                      categoriesCubit: _categoriesCubit,
                      productsCubit: _productsCubit,
                    ),
                    const SizedBox(height: AppSize.s37),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.home.tr()),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
      ),
    );
  }
}

///
