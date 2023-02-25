import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../../categories/presentation/cubit/categories_cubit.dart';
import '../../../products/presentation/cubit/products_cubit.dart';
import 'categories_rew_view.dart';
import 'most_popular_widget.dart';
import 'most_recent_widget.dart';

class BottomScreenCategoriesAndMostRecentAndPopular extends StatelessWidget {
  const BottomScreenCategoriesAndMostRecentAndPopular(
      {Key? key, required this.categoriesCubit, required this.productsCubit})
      : super(key: key);

  final CategoriesCubit categoriesCubit;
  final ProductsCubit productsCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesRewView(cubit: categoriesCubit),
        const SizedBox(height: AppSize.s30),
        MostRecentWidget(cubit: productsCubit),
        const SizedBox(height: AppSize.s30),
        MostPopularWidget(cubit: productsCubit),
      ],
    );
  }
}
