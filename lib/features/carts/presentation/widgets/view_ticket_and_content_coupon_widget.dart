
import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/assets_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';

class ViewTicketAndContentCouponWidget extends StatelessWidget {
  const ViewTicketAndContentCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageAssets.ticket,
          fit: BoxFit.fill,
          width: context.width,
          height: 150.0,
        ),
        Positioned(
          top: 0.0,
          bottom: 0.0,
          width: context.width * 0.7,
          right: 0.0,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: AppSize.s11),
                  Text(
                    AppStrings.discountCoupon.tr(),
                    style: context.labelLarge,
                  ),
                  const SizedBox(height: AppSize.s20),
                  SizedBox(
                    height: 58.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: AppStrings.enterCouponNumber.tr(),
                                  hintStyle: context.bodyMedium,
                                  fillColor: Colors.white54),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: Text(AppStrings.apply.tr(),
                                  style: context.bodyMedium),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
