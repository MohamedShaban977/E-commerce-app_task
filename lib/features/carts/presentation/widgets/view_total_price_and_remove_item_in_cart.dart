import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/color_manager.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../../product_details/presentation/widgets/view_price_widget.dart';
import '../cubit/carts_cubit.dart';

class ViewTotalPriceAndRemoveItemInCart extends StatelessWidget {
  const ViewTotalPriceAndRemoveItemInCart({
    super.key,
    required this.product,
  });

  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    final cubit = sl<CartsCubit>().get(context);

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SizedBox(
              child: Card(
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: Center(
                    child: PriceWidget(
                  price: '${cubit.totalPriceProduct(product)}',
                  stylePrice: context.displayMedium,
                  style: context.bodySmall,
                )),
              ),
            ),
          ),
          SizedBox(
            width: 35.0,
            child: RawMaterialButton(
              fillColor: ColorManager.secondary,
              onPressed: () => cubit.deleteProductByIdCart(product.id),
              child: const Icon(
                Icons.delete_forever,
                color: ColorManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
