import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/color_manager.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../cubit/carts_cubit.dart';

class ViewContentRightCard extends StatelessWidget {
  const ViewContentRightCard({Key? key, required this.product})
      : super(key: key);
  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    final cubit = sl<CartsCubit>().get(context);
    return SizedBox(
      width: 120.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            product.imageLink,
            height: 110.0,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 35,
                  child: RawMaterialButton(
                    fillColor: ColorManager.primary,
                    onPressed: () {
                      cubit.incrementQuantity(product);
                    },
                    child: const Icon(
                      Icons.add,
                      color: ColorManager.white,
                    ),
                  ),
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
                        '${product.quantity}',
                        style: context.displayMedium,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                  child: RawMaterialButton(
                    fillColor: ColorManager.primary,
                    onPressed: () {
                      cubit.decrementQuantity(product);
                    },
                    child: const Icon(
                      Icons.remove,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
