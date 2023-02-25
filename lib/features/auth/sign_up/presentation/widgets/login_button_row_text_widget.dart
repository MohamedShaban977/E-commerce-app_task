import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/core/routes/magic_router.dart';
import 'package:e_commerce_app_task/core/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_manage/strings_manager.dart';
import '../../../../../core/app_manage/values_manager.dart';

class LoginButtonRowTextWidget extends StatelessWidget {
  const LoginButtonRowTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.youHaveAnAccount.tr(), style: context.titleLarge),
        const SizedBox(width: AppSize.s11),
        GestureDetector(
          onTap: () => MagicRouterName.navigateTo(RoutesNames.loginRoute),
          child: Text(AppStrings.login.tr(), style: context.displaySmall),
        ),
      ],
    );
  }
}
