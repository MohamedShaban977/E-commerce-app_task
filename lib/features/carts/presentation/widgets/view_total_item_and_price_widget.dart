import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../product_details/presentation/widgets/view_price_widget.dart';
import '../cubit/carts_cubit.dart';

class ViewTotalItemAndPrice extends StatelessWidget {
  const ViewTotalItemAndPrice({
    super.key,
    required this.cubit,
  });

  final CartsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Card(
        elevation: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cubit.totalQuantity().toString(),
                      style: context.bodyMedium
                          .copyWith(color: ColorManager.primary)),
                  const SizedBox(width: AppSize.s4),
                  Text(
                    AppStrings.item.tr(),
                    style: context.titleLarge,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppStrings.total.tr(),
                      style: context.bodyMedium
                          .copyWith(color: ColorManager.primary)),
                  const SizedBox(width: 8.0),
                  PriceWidget(
                    price: cubit.totalPriceAllProduct().toString(),
                    stylePrice: context.titleLarge,
                    style: context.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
