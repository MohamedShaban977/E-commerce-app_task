import 'package:flutter/material.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';
import 'view_name_and_price_widget.dart';
import 'view_total_price_and_remove_item_in_cart.dart';

class ViewContentLeftCard extends StatelessWidget {
  const ViewContentLeftCard({
    super.key,
    required this.product,
  });

  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        ViewNameAndPriceWidget(product: product),
        ViewTotalPriceAndRemoveItemInCart(product: product)
      ],
    ));
  }
}
