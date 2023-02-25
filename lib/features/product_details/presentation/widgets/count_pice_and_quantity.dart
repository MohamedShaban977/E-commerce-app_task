import 'package:flutter/material.dart';

import '../cubit/product_details_cubit.dart';
import 'viewCountQuantityAndIncrementAndDecrementQuantity.dart';
import 'view_total_count_price.dart';

class CountPriceAndQuantity extends StatelessWidget {
  const CountPriceAndQuantity({super.key, required ProductDetailsCubit cubit})
      : _cubit = cubit;
  final ProductDetailsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ViewCountQuantityAndIncrementAndDecrementQuantity(cubit: _cubit),
        const SizedBox(width: 12.0),
        ViewTotalCountPrice(cubit: _cubit),
      ],
    );
  }
}
