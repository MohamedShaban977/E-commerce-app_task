import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../../widgets/custom_empty_widget.dart';
import '../../../../widgets/custom_error_widget.dart';
import '../../../../widgets/custom_loading_widget.dart';
import '../../../main_layout_app/presentation/widgets/custom_drawer.dart';
import '../cubit/categories_cubit.dart';
import '../widgets/categories_custom_search_delegate.dart';
import '../widgets/categories_grid_view_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesCubit cubit() => sl<CategoriesCubit>().get(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Scaffold(
            appBar: _buildAppBar(),
            drawer: const DrawerView(),
            body: CustomLoadingWidget(
              inAsyncCall: state is CategoriesLoadingState,
              child: RefreshIndicator(
                onRefresh: () async =>
                    await Future.sync(() => cubit().categories()),
                child: SizedBox(
                  height: context.heightBodyWithNav,
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p16),
                      child: handleScreen(state),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.categoriesAppBar.tr()),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CategoriesCustomSearchDelegate(cubit()),
            );
          },
        ),
      ],
    );
  }

  Widget handleScreen(state) {
    if (state is CategoriesSuccessState && cubit().categoriesList.isEmpty) {
      return const CustomEmptyWidget();
    } else if (state is CategoriesErrorState) {
      return CustomErrorWidget(error: state.error);
    } else {
      return CategoriesGridView(categoriesList: cubit().categoriesList);
    }
  }
}
