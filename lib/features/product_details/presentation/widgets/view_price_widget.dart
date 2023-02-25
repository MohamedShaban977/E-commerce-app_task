import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.price, this.style, this.stylePrice})
      : super(key: key);
  final String price;
  final TextStyle? style;
  final TextStyle? stylePrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          price,
          style: stylePrice ?? context.titleMedium,
        ),
        const SizedBox(width: 5.0),
        Text(
          AppStrings.egp.tr(),
          style:
              style ?? context.bodyMedium.copyWith(color: ColorManager.primary),
        ),
      ],
    );
  }
}
