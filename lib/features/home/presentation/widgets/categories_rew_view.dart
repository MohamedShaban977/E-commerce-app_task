import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/cubit/categories_cubit.dart';
import 'card_categories_in_home_widget.dart';

class CategoriesRewView extends StatelessWidget {
  const CategoriesRewView({
    super.key,
    required CategoriesCubit cubit,
  }) : _cubit = cubit;

  final CategoriesCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          child: _handleViewWidget(context),
        );
      },
    );
  }

  Widget _handleViewWidget(context) {
    if (_cubit.get(context).categoriesList == []) {
      return const SizedBox();
    }
    return _listViewCategories(context);
  }

  SingleChildScrollView _listViewCategories(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: List.generate(
          _cubit.get(context).categoriesList.length,
          (index) => CardCategoriesInHomeWidget(
            categoriesEntity: _cubit.get(context).categoriesList[index],
          ),
        ),
      ),
    );
  }
}
