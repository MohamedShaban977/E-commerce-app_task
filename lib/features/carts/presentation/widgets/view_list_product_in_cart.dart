import 'package:flutter/material.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';
import 'view_card_in_cart_item_widget.dart';

class ViewListProductInCart extends StatelessWidget {
  const ViewListProductInCart({Key? key, required this.productsCart})
      : super(key: key);
  final List<ProductDetailsEntity> productsCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(productsCart.length,
          (index) => ViewCardInCartItemWidget(product: productsCart[index])),
    );
  }
}
