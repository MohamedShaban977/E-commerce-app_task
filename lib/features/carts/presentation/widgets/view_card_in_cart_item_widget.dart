import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';
import 'view_content_left_card.dart';
import 'view_content_right_card_widget.dart';

class ViewCardInCartItemWidget extends StatelessWidget {
  const ViewCardInCartItemWidget({
    super.key,
    required this.product,
  });

  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p16),
      child: SizedBox(
          height: 150.0,
          width: context.width,
          child: Card(
            elevation: 0.8,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: Row(
              children: [
                ViewContentRightCard(product: product),
                ViewContentLeftCard(product: product),
              ],
            ),
          )),
    );
  }
}
