import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../home/presentation/widgets/view_card_product_widget.dart';
import '../../domain/entities/products_entity.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({Key? key, required this.products}) : super(key: key);
  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: AppPadding.p8,
      crossAxisCount: Responsive.isMobile(context)
          ? 2
          : Responsive.isTablet(context)
              ? 3
              : 4,
      childAspectRatio: 0.8,
      children: List.generate(
          products.length,
          (index) => ViewCardProductWidget(
                product: products[index],
              )),
    );
  }
}
