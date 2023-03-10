import 'package:flutter/material.dart';

import '../../../domain/entities/products_entity.dart';
import '../products_grid_view.dart';

class SearchBodyProductsWidget extends StatelessWidget {
  const SearchBodyProductsWidget({
    super.key,
    required this.allResult,
  });

  final List<ProductsEntity> allResult;

  @override
  Widget build(BuildContext context) {
    return ProductsGridView(products: allResult);
  }
}
