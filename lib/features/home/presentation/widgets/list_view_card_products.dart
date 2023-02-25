import 'package:flutter/material.dart';

import '../../../products/domain/entities/products_entity.dart';
import 'view_card_product_widget.dart';

class ListViewCardProducts extends StatelessWidget {
  const ListViewCardProducts({Key? key, required this.listProducts})
      : super(key: key);

  final List<ProductsEntity> listProducts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: List.generate(
          listProducts.length,
          (index) => ViewCardProductWidget(
            product: listProducts[index],
          ),
        ),
      ),
    );
  }
}
