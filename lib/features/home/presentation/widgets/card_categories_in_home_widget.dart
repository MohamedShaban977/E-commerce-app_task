import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../../../core/routes/magic_router.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/routes/routes_request.dart';
import '../../../categories/domain/entities/categories_entity.dart';

class CardCategoriesInHomeWidget extends StatelessWidget {
  const CardCategoriesInHomeWidget({
    super.key,
    required CategoriesEntity categoriesEntity,
  }) : _categoriesEntity = categoriesEntity;

  final CategoriesEntity _categoriesEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
      child: GestureDetector(
        onTap: () => MagicRouterName.navigateTo(RoutesNames.products,
            arguments: RouteRequest(id: '${_categoriesEntity.id}').toJson()),
        child: Column(
          children: [
            Card(
              shape: const CircleBorder(),
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(_categoriesEntity.imageLink),
              ),
            ),
            const SizedBox(height: AppSize.s8),
            Text(_categoriesEntity.name, style: context.titleLarge),
          ],
        ),
      ),
    );
  }
}
