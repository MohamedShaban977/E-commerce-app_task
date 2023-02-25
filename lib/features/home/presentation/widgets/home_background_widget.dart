import 'dart:ui';

import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_manage/color_manager.dart';
import '../cubit/home_cubit.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final HomeCubit cubit = HomeCubit().get(context);
                return Container(
                  width: context.width,
                  height: context.height * 0.3,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(
                          cubit.imageSlider()[cubit.yourActiveIndex]),
                    ),
                  ),
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        ColorManager.background
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [AppSize.s0, AppSize.s0, 0.85, 1.0],
                    ),
                  ),
                );
              },
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AppSize.s20,
                sigmaY: AppSize.s20,
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
              ),
            )
          ],
        ),
        child,
      ],
    );
  }
}
