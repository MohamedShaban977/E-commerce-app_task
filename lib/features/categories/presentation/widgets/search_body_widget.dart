import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../domain/entities/categories_entity.dart';
import 'categories_grid_view_widget.dart';

class SearchBodyWidget extends StatelessWidget {
  const SearchBodyWidget({
    super.key,
    required this.allResult,
  });

  final List<CategoriesEntity> allResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: CategoriesGridView(categoriesList: allResult),
    );
  }
}
