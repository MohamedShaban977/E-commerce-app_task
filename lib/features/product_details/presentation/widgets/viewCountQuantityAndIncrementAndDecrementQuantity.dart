import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../cubit/product_details_cubit.dart';
import 'button_count_quantity_widget.dart';

class ViewCountQuantityAndIncrementAndDecrementQuantity
    extends StatelessWidget {
  const ViewCountQuantityAndIncrementAndDecrementQuantity(
      {super.key, required ProductDetailsCubit cubit})
      : _cubit = cubit;
  final ProductDetailsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: 150.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonCountQuantity(
            onPressed: () => _cubit.incrementQuantity(),
            icon: Icons.add,
          ),
          Expanded(
            child: SizedBox(
              child: Card(
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: Center(
                    child: Text(
                  '${_cubit.countQuantity}',
                  style: context.displayMedium,
                )),
              ),
            ),
          ),
          ButtonCountQuantity(
            onPressed: () => _cubit.decrementQuantity(),
            icon: Icons.remove,
            isRight: false,
            isDisable: _cubit.countQuantity <= 1,
          ),
        ],
      ),
    );
  }
}
