import 'package:e_commerce_app_task/core/app_manage/color_manager.dart';
import 'package:e_commerce_app_task/core/routes/magic_router.dart';
import 'package:e_commerce_app_task/core/routes/routes_request.dart';
import 'package:e_commerce_app_task/core/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../domain/entities/categories_entity.dart';
import 'view_data_in_card_widget.dart';

class CardCategories extends StatelessWidget {
  const CardCategories({Key? key, required this.categoriesEntity})
      : super(key: key);

  final CategoriesEntity categoriesEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: AppMargin.m16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: () => MagicRouterName.navigateTo(
          RoutesNames.products,
          arguments: RouteRequest(id: '${categoriesEntity.id}').toJson(),
        ),
        splashColor: ColorManager.secondary,
        highlightColor: ColorManager.secondary,
        padding: EdgeInsets.zero,
        child: ViewDataInCardWidget(
          text: categoriesEntity.name,
          pathUrl: categoriesEntity.imageLink,
        ),
      ),
    );
  }
}
