import 'package:e_commerce_app_task/core/routes/routes_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/routes/magic_router.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../home/presentation/widgets/content_card_product.dart';
import '../../../product_details/domain/entities/product_details_entity.dart'
    as details;
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../../wishlist/presentation/widgets/view_is_favorite_widget.dart';
import '../../domain/entities/products_entity.dart';

class ViewCardProductWidget extends StatelessWidget {
  const ViewCardProductWidget({
    super.key,
    required ProductsEntity product,
  }) : _product = product;

  final ProductsEntity _product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200.0,
        color: ColorManager.white,
        child: Stack(
          children: [
            MaterialButton(
                highlightColor: ColorManager.secondary.withOpacity(0.1),
                splashColor: ColorManager.secondary.withOpacity(0.3),
                padding: EdgeInsets.zero,
                onPressed: goToProductDetailsScreen,
                child: ContentCardProduct(product: _product)),
            Positioned(
              top: 5.0,
              right: 5.0,
              height: 35.0,
              width: 35.0,
              child: BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
                  return IsFavoriteWidget(
                    product: _buildProductDetailsEntity(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToProductDetailsScreen() => MagicRouterName.navigateTo(
        RoutesNames.productDetails,
        arguments: RouteRequest(id: '${_product.id}').toJson(),
      );

  details.ProductDetailsEntity _buildProductDetailsEntity() =>
      details.ProductDetailsEntity(
          name: _product.name,
          rate: _product.rate,
          price: _product.price,
          id: _product.id,
          imageLink: _product.imageLink,
          description: _product.description,
          category: details.CategoryEntity(
              id: _product.category!.id,
              name: _product.category!.name,
              imageLink: _product.category!.imageLink));
}
