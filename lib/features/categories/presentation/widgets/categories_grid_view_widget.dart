import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../../../core/responsive/responsive.dart';
import '../../domain/entities/categories_entity.dart';
import 'card_categories_widget.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({Key? key, required this.categoriesList})
      : super(key: key);
  final List<CategoriesEntity> categoriesList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: AppPadding.p16,
      crossAxisCount: Responsive.isMobile(context)
          ? 1
          : Responsive.isTablet(context)
          ? 2
          : 3,
      childAspectRatio: 2.6,
      children: List.generate(
          categoriesList.length,
              (index) => CardCategories(
            categoriesEntity:  categoriesList[index],
          )),
    );
  }
}
