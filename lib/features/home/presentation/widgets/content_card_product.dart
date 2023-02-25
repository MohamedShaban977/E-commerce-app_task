import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/features/carts/presentation/cubit/carts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../products/domain/entities/products_entity.dart';

class ContentCardProduct extends StatelessWidget {
  const ContentCardProduct({
    super.key,
    required ProductsEntity product,
  }) : _product = product;

  final ProductsEntity _product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          _product.imageLink,
          height: 110.0,
          width: context.width,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(
                  _product.name,
                  style: context.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_product.price} ${AppStrings.egp.tr()}',
                      style: context.titleLarge
                          .copyWith(color: ColorManager.primary),
                    ),

                    BlocBuilder<CartsCubit, CartsState>(
                      builder: (context, state) {
                        return Icon(
                          sl<CartsCubit>().isCartIcon(_product.id),
                          color: sl<CartsCubit>().isCart(_product.id)
                              ? ColorManager.primary
                              : ColorManager.nonSelectNavBar,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
