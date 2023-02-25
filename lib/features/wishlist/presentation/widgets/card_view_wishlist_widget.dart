import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';
import 'view_content_card_wishlist_widget.dart';
import 'view_is_favorite_widget.dart';

class CardViewWishlistWidget extends StatelessWidget {
  final ProductDetailsEntity product;

  const CardViewWishlistWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            ContentCardWishlistViewWidget(product: product),
            Positioned(
                top: 5.0,
                right: 5.0,
                height: 35.0,
                width: 35.0,
                child: IsFavoriteWidget(product: product)),
          ],
        ),
      ),
    );
  }
}
