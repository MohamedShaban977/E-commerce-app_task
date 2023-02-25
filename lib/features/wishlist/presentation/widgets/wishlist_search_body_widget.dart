import 'package:e_commerce_app_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import 'grid_view_in_wishlist.dart';

class WishlistSearchBodyWidget extends StatelessWidget {
  const WishlistSearchBodyWidget({
    super.key,
    required this.allResult,
  });

  final List<ProductDetailsEntity> allResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: GridViewInWishlistView(products: allResult),
    );
  }
}
