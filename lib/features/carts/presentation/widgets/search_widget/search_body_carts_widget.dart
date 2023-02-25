import 'package:flutter/material.dart';

import '../../../../../core/app_manage/values_manager.dart';
import '../../../../product_details/domain/entities/product_details_entity.dart';
import '../view_list_product_in_cart.dart';

class SearchBodyCartsWidget extends StatelessWidget {
  const SearchBodyCartsWidget({
    super.key,
    required this.allResult,
  });

  final List<ProductDetailsEntity> allResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: ViewListProductInCart(productsCart: allResult),
    );
  }
}