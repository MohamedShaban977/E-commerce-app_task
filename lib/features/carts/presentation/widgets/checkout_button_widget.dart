import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';

class CheckoutButtonWidget extends StatelessWidget {
  const CheckoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 50.0,
      child: ElevatedButton(
          onPressed: () => _alertSuccess(context),
          child: Text(AppStrings.checkout.tr())),
    );
  }

  void _alertSuccess(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: '',
      text: AppStrings.thankYouForOrder.tr(),
      confirmBtnColor: ColorManager.secondary,
      borderRadius: AppSize.s8,
      confirmBtnText: AppStrings.finished.tr(),
    );
  }
}
