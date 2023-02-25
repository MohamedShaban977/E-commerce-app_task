import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_details_entity.dart';
import 'rate_widget.dart';
import 'view_price_widget.dart';

class NameAndPriceAndRateProduct extends StatelessWidget {
  const NameAndPriceAndRateProduct({Key? key, required this.product})
      : super(key: key);
  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name,
            textAlign: TextAlign.start,
            style: context.displayMedium.copyWith(
              height: 1.5,
            )),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceWidget(price: product.price),
            RateWidget(rate: product.rate),
          ],
        ),
      ],
    );
  }
}
