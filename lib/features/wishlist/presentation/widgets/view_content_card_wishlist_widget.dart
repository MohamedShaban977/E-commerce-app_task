import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/core/responsive/responsive.dart';
import 'package:e_commerce_app_task/widgets/toast_and_snackbar.dart';
import 'package:flutter/material.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../widgets/custom_image_network_view.dart';
import '../../../carts/presentation/cubit/carts_cubit.dart';
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
        CustomViewImageNetwork(
          image: product.imageLink,
          height: Responsive.isMobileS(context) ? 150 : 250.0,
          width: context.width,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(product.name,
              style: context.displayMedium.copyWith(
                height: 1.5,
              )),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(product.price, style: context.titleMedium),
              const SizedBox(width: AppSize.s4),
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
              onPressed: () {
                sl<CartsCubit>().get(context).saveProductCart(product).then(
                    (value) => ToastAndSnackBar.toastSuccess(
                        message: AppStrings.movedToCart.tr()));
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSize.s4),
                bottomRight: Radius.circular(AppSize.s4),
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
