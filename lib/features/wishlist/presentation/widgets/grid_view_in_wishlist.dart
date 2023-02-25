import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import 'card_view_wishlist_widget.dart';

class GridViewInWishlistView extends StatelessWidget {
  const GridViewInWishlistView({super.key, required this.products});

  final List<ProductDetailsEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: AppPadding.p16,
      crossAxisCount: Responsive.isMobile(context)
          ? 1
          : Responsive.isTablet(context)
              ? 2
              : 3,
      childAspectRatio: 0.9,
      children: List.generate(
          products.length,
          (index) => CardViewWishlistWidget(
                product: products[index],
              )),
    );
  }
}
