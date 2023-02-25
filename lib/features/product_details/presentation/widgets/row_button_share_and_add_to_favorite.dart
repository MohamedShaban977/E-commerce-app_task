import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:e_commerce_app_task/widgets/toast_and_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/color_manager.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/cache/hive_helper.dart';
import '../../domain/entities/product_details_entity.dart';
import 'custom_button_widget.dart';

class RowButtonsShareAndAddToFavorite extends StatefulWidget {
  const RowButtonsShareAndAddToFavorite({
    super.key,
    required ProductDetailsEntity product,
  }) : _product = product;
  final ProductDetailsEntity _product;

  @override
  State<RowButtonsShareAndAddToFavorite> createState() => _RowButtonsShareAndAddToFavoriteState();
}

class _RowButtonsShareAndAddToFavoriteState extends State<RowButtonsShareAndAddToFavorite> {

  final WishlistCubit _wishlistCubit = sl<WishlistCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: context.width,
      child: Card(
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            BlocConsumer<WishlistCubit, WishlistState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is SaveProductByIdSuccessState) {
                  ToastAndSnackBar.toastSuccess(message: 'تم الحفظ بنجاح');
                }
                if (state is SaveProductByIdErrorState) {
                  ToastAndSnackBar.toastSuccess(
                      message: 'حدث خطا ${state.error}');
                }
              },
              builder: (context, state) {
                return CustomButtonWidget(
                  onPressed: () async {
                    /// Todo: addedToFavourites
                    await _wishlistCubit
                        .get(context)
                        .toggleIsFavorite(widget._product);
                  },
                  text: AppStrings.addedToFavourites.tr(),
                  icon: HiveHelper.favoritesProductDB.containsKey(widget._product.id) ? Icons.favorite : Icons.favorite_border,
                  colorText: ColorManager.secondary,
                  colorIcon: ColorManager.secondary,
                  style: context.bodyMedium,
                );
              },
            ),
            const VerticalDivider(
              thickness: 1.1,
              width: 1.0,
              color: ColorManager.darkGrey,
            ),
            CustomButtonWidget(
              onPressed: () async {
                ///TODO: share product
                await sl<WishlistCubit>()
                    .get(context)
                    .getAllProductsFavorite();
              },
              text: AppStrings.productSharing.tr(),
              icon: Icons.share,
              colorText: ColorManager.textGray,
              colorIcon: ColorManager.grey,
              style: context.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
