import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../../product_details/presentation/widgets/view_price_widget.dart';

class ViewNameAndPriceWidget extends StatelessWidget {
  const ViewNameAndPriceWidget({
    super.key,
    required this.product,
  });

  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              product.name,
              style: context.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: PriceWidget(
              price: product.price,
              stylePrice:
                  context.titleLarge.copyWith(color: ColorManager.primary),
              style: context.bodySmall.copyWith(color: ColorManager.primary),
            ),
          ),
          const Divider(
            thickness: AppSize.s1_5,
            height: AppSize.s1,
          )
        ],
      ),
    );
  }
}
