import 'package:e_commerce_app_task/core/app_manage/color_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/strings_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_manage/assets_manager.dart';

class CustomEmptyWidget extends StatelessWidget {

  final bool isSearch;

  const CustomEmptyWidget({Key? key,  this.isSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightBodyWithNav,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isSearch ? SvgAssets.startSearch : SvgAssets.noData,
            height: context.height * 0.18,
          ),
          const SizedBox(height: 10.0),
          Text(
            isSearch ? AppStrings.waitingToSearch.tr() : AppStrings.noResultsFound.tr(),
            style: context.displayLarge.copyWith(color: ColorManager.textGray),
          ),
        ],
      )),
    );
  }
}
