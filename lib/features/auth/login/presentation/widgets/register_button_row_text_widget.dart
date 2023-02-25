import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/core/routes/magic_router.dart';
import 'package:e_commerce_app_task/core/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_manage/strings_manager.dart';
import '../../../../../core/app_manage/values_manager.dart';

class RegisterButtonRowTextWidget extends StatelessWidget {
  const RegisterButtonRowTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.dontHaveAnAccount.tr(), style: context.titleLarge),
        const SizedBox(width: AppSize.s11),
        GestureDetector(
          onTap: () => MagicRouterName.navigateTo(RoutesNames.signupRoute),
          child: Text(AppStrings.signUp.tr(), style: context.displaySmall),
        ),
      ],
    );
  }
}
