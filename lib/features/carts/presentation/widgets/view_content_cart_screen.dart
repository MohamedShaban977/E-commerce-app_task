import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:flutter/material.dart';

import '../cubit/carts_cubit.dart';
import 'cardViewTotalPriceAllProductAndTaxesInWidget.dart';
import 'checkout_button_widget.dart';
import 'view_list_product_in_cart.dart';
import 'view_ticket_and_content_coupon_widget.dart';
import 'view_total_item_and_price_widget.dart';

class ViewContentCartScreen extends StatelessWidget {
  const ViewContentCartScreen({
    super.key,
    required this.cubit,
  });

  final CartsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s16),
         ViewTotalItemAndPrice(cubit: cubit),
        const SizedBox(height: AppSize.s16),
        ViewListProductInCart(productsCart: cubit.productsCart),
        const SizedBox(height: AppSize.s25),
        const ViewTicketAndContentCouponWidget(),
        const SizedBox(height: AppSize.s25),
         CardViewTotalPriceAllProductAndTaxesInWidget(cubit: cubit),
        const SizedBox(height: AppSize.s16),
        const CheckoutButtonWidget(),
        const SizedBox(height: AppSize.s40),
      ],
    );
  }
}