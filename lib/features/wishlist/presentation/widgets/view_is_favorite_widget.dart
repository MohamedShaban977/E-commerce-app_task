import 'package:flutter/material.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/color_manager.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../cubit/wishlist_cubit.dart';

class IsFavoriteWidget extends StatelessWidget {
  const IsFavoriteWidget({Key? key, required this.product}) : super(key: key);
  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () async =>
      await sl<WishlistCubit>().get(context).toggleIsFavorite(product),
      shape: const CircleBorder(),
      highlightColor: ColorManager.secondary.withOpacity(0.3),
      splashColor: ColorManager.secondary.withOpacity(0.3),
      padding: EdgeInsets.zero,
      child: Icon(
        sl<WishlistCubit>().get(context).isFavoriteIcon(product.id),
        color: ColorManager.secondary,
      ),
    );
  }
}
