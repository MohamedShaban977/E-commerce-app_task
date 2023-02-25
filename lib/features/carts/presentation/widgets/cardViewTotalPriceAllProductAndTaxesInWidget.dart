import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../product_details/presentation/widgets/view_price_widget.dart';
import '../cubit/carts_cubit.dart';

class CardViewTotalPriceAllProductAndTaxesInWidget extends StatelessWidget {
  const CardViewTotalPriceAllProductAndTaxesInWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CartsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: context.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(
                      AppStrings.total.tr(),
                      style: context.bodyMedium
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: PriceWidget(
                      price: '${cubit.totalPriceAllProduct()}',
                      stylePrice: context.titleLarge,
                      style: context.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(
                      AppStrings.taxes.tr(),
                      style: context.bodyMedium
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: PriceWidget(
                      price: '${cubit.calculateTax()}',
                      stylePrice: context.titleLarge,
                      style: context.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: AppSize.s1_5),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(
                      AppStrings.totalPriceAllProduct.tr(),
                      style: context.bodyMedium
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: PriceWidget(
                      price:
                          '${cubit.get(context).calculateTax() + cubit.get(context).totalPriceAllProduct()}',
                      stylePrice: context.titleLarge,
                      style: context.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
