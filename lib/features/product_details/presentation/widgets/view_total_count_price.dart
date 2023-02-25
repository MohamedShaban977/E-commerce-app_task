import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/core/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/strings_manager.dart';
import '../cubit/product_details_cubit.dart';

class ViewTotalCountPrice extends StatelessWidget {
  const ViewTotalCountPrice({super.key, required ProductDetailsCubit cubit})
      : _cubit = cubit;
  final ProductDetailsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobileS(context) ? 120 : 160.0,
      height: 45.0,
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${_cubit.totalPrice}',
              style: context.displayMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                AppStrings.egp.tr(),
                style: context.bodySmall,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
