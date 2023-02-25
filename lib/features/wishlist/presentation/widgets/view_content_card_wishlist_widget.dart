import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';

class ContentCardWishlistViewWidget extends StatelessWidget {
  const ContentCardWishlistViewWidget({Key? key, required this.product})
      : super(key: key);
  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          product.imageLink,
          height: 250.0,
          width: context.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(product.name,
              style: context.displayMedium.copyWith(
                height: 1.5,
              )),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(product.price, style: context.titleMedium),
              const SizedBox(width: 5.0),
              Text(AppStrings.egp.tr(),
                  style:
                      context.bodyMedium.copyWith(color: ColorManager.primary)),
            ],
          ),
        ),
        SizedBox(
          height: 40.0,
          width: context.width,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              ))),
              child: Text(
                AppStrings.transferToCart.tr(),
                style: context.labelLarge,
              )),
        )
      ],
    );
  }
}
