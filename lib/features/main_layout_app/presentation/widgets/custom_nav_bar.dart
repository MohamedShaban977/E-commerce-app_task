import 'package:e_commerce_app_task/core/app_manage/color_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/font_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/strings_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../carts/presentation/cubit/carts_cubit.dart';
import '../cubit/nav_bar_cubit.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final PageStorageBucket bucket = PageStorageBucket();

  late NavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocConsumer<NavBarCubit, NavBarState>(
        listener: (context, states) {},
        builder: (context, states) {
          cubit = NavBarCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              if (cubit.currentTab != 0) {
                cubit.changeIndex(0);
                return Future.value(false);
              }
              return showExitPopup(context);
            },
            child: BlocBuilder<CartsCubit, CartsState>(
              builder: (context, state) {
                return Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: PageStorage(
                      bucket: bucket,
                      child: cubit.currentScreen,
                    ),

                    ///  Center  Tab bar icons
                    floatingActionButton:
                        sl<CartsCubit>().get(context).productsCart.isNotEmpty
                            ? buildFloatingActionButton(context)
                            : null,
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerDocked,
                    bottomNavigationBar: SizedBox(
                      width: double.infinity,
                      child: BottomAppBar(
                        shape: const CircularNotchedRectangle(),
                        notchMargin: 8.0,
                        child: SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ///lift  Tab bar icons
                              SizedBox(
                                width: sl<CartsCubit>()
                                        .get(context)
                                        .productsCart
                                        .isEmpty
                                    ? context.width * 0.5
                                    : context.width * 0.4,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ///home
                                    buildMaterialButton(
                                      context,
                                      index: 0,
                                      icon: Icons.home,
                                      text: AppStrings.home.tr(),
                                    ),

                                    ///category
                                    buildMaterialButton(
                                      context,
                                      index: 1,
                                      icon: Icons.category,
                                      text: AppStrings.category.tr(),
                                    ),
                                  ],
                                ),
                              ),

                              /// Right Tab bar icons
                              SizedBox(
                                width: sl<CartsCubit>()
                                        .get(context)
                                        .productsCart
                                        .isEmpty
                                    ? context.width * 0.5
                                    : context.width * 0.4,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    /// wishlist
                                    buildMaterialButton(
                                      context,
                                      index: 3,
                                      icon: Icons.favorite,
                                      text: AppStrings.wishlist.tr(),
                                    ),

                                    /// profile
                                    buildMaterialButton(
                                      context,
                                      index: 4,
                                      icon: Icons.person,
                                      text: AppStrings.profile.tr(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          );
        },
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  SystemNavigator.pop(animated: true);
                },
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  MaterialButton buildMaterialButton(BuildContext context,
      {required IconData? icon, required int index, required String text}) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => cubit.changeIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon, //Icons.home,
            size: 30,
            color: cubit.changeColorIcon(index),
          ),
          Text(
            text,
            style: context.titleLarge.copyWith(
              fontSize: FontSize.s14,
              color: cubit.changeColorText(index),
            ),
          )
        ],
      ),
    );
  }

  Container buildFloatingActionButton(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
          border: Border.all(
            width: cubit.currentTab != 2 ? 0.0 : 3.0,
            color: cubit.currentTab != 2
                ? ColorManager.secondary
                : ColorManager.selectNavBar,
          ),
          shape: BoxShape.circle),
      child: FittedBox(
        child: FloatingActionButton(
          // isExtended: true,
          backgroundColor: ColorManager.secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(sl<CartsCubit>().totalQuantity().toString(),
                  style: context.labelLarge.copyWith(fontSize: FontSize.s14)),
              const Icon(Icons.shopping_cart)
            ],
          ),

          // onPressed: () => cubit.changeIndex(2),
          onPressed: () => cubit.changeIndex(2),
        ),
      ),
    );
  }
}
