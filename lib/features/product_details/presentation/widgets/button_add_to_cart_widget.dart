import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/cache/hive_helper.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/features/carts/presentation/cubit/carts_cubit.dart';
import 'package:e_commerce_app_task/features/carts/presentation/cubit/carts_cubit.dart';
import 'package:e_commerce_app_task/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/strings_manager.dart';

class ButtonAddToCartWidget extends StatelessWidget {
  const ButtonAddToCartWidget({
    super.key, required this.detailsCubit,
  });

  final ProductDetailsCubit detailsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        final cubit = sl<CartsCubit>().get(context);
        return SizedBox(
          height: 45.0,
          // width: 160.0,
          child: ElevatedButton(
            onPressed: () async {
              detailsCubit.product.quantity = detailsCubit.countQuantity;
              await cubit.saveProductCart(detailsCubit.product);
              await cubit.getProductByIdCart(detailsCubit.product.id);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                 Icon(cubit.isCartIcon(detailsCubit.product.id), size: 20),
             const SizedBox(width: 20.0),
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      AppStrings.addToCart.tr(),
                      style: context.labelLarge,
                    ),
                    const SizedBox(width: 20.0),
                    if(cubit.isCart(detailsCubit.product.id))
                    Text('(${detailsCubit.product.quantity})',
                      style: context.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
